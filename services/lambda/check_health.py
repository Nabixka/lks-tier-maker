import os
import boto3
import psycopg2
from botocore.exceptions import ClientError
from psycopg2 import OperationalError

SNS_TOPIC_ARN = os.environ.get("SNS_TOPIC_ARN", "arn:aws:sns:region:account-id:db-health-alerts")
sns_client = boto3.client('sns')

DB_USER_CONFIG = {
    "dbname": os.environ.get("DB_USER_NAME", ""),
    "user": os.environ.get("DB_USER_USERNAME", "postgres"),
    "password": os.environ.get("DB_USER_PASSWORD", "password_user"),
    "host": os.environ.get("DB_USER_HOST", "host-db-user.rds.amazonaws.com"),
    "port": os.environ.get("DB_USER_PORT", "5432"),
    "connect_timeout": 3
}

DB_TM_CONFIG = {
    "dbname": os.environ.get("DB_TM_NAME", ""),
    "user": os.environ.get("DB_TM_USERNAME", "postgres"),
    "password": os.environ.get("DB_TM_PASSWORD", "password_tm"),
    "host": os.environ.get("DB_TM_HOST", "host-db-tm.rds.amazonaws.com"),
    "port": os.environ.get("DB_TM_PORT", "5432"),
    "connect_timeout": 3
}

def send_sns_alert(subject, message):
    try:
        sns_client.publish(
            TopicArn=SNS_TOPIC_ARN,
            Subject=subject,
            Message=message
        )
        print("Laporan kegagalan berhasil dikirim ke SNS.")
    except ClientError as e:
        print(f"Gagal mengirim laporan ke SNS: {e}")

def check_single_db(config, db_name_label):
    """Fungsi helper untuk mengecek satu database"""
    connection = None
    try:
        connection = psycopg2.connect(**config)
        with connection.cursor() as cursor:
            cursor.execute("SELECT 1;")
            result = cursor.fetchone()
            if result and result[0] == 1:
                return True, None
    except Exception as e:
        return False, str(e)
    finally:
        if connection and not connection.closed:
            connection.close()
    return False, "Unknown connection error"

def lamdda_handler(event, context):
    user_healthy, user_error = check_single_db(DB_USER_CONFIG, "Database User")
    tm_healthy, tm_error = check_single_db(DB_TM_CONFIG, "Database TM")
    
    failed_dbs = []
    
    if not user_healthy:
        failed_dbs.append(f"- **Database User ({DB_USER_CONFIG['dbname']})**: {user_error}")
    if not tm_healthy:
        failed_dbs.append(f"- **Database TM ({DB_TM_CONFIG['dbname']})**: {tm_error}")
        
    if failed_dbs:
        error_details = "\n".join(failed_dbs)
        error_subject = "🚨 ALERT: Microservice Database Health Check Gagal!"
        error_message = (
            f"Halo Tim,\n\n"
            f"Sistem mendeteksi adanya kegagalan pada database microservice berikut:\n\n"
            f"{error_details}\n\n"
            f"Mohon segera lakukan pengecekan pada instance database terkait.\n"
        )
        
        send_sns_alert(error_subject, error_message)
        
        return {
            "statusCode": 500,
            "body": f"Unhealthy databases detected. Laporan dikirim ke SNS."
        }
        
    return {
        "statusCode": 200,
        "body": "✅ All Microservice Databases (User & TM) are HEALTHY"
    }