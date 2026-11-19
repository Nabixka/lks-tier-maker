import os
import psycopg2

DB_USER_CONFIG = {
    "dbname": os.environ.get("DB_USER_NAME", "tm_user"),
    "user": os.environ.get("DB_USER_USERNAME", "nabixka"),
    "password": os.environ.get("DB_USER_PASSWORD", "bixkafa"),
    "host": os.environ.get("DB_USER_HOST", "localhost"),
    "port": os.environ.get("DB_USER_PORT", "5432")
}

# DB_TM_CONFIG = {
#     "dbname": os.environ.get("DB_TM_NAME", "tm_db"),
#     "user": os.environ.get("DB_TM_USERNAME", "nabixka"),
#     "password": os.environ.get("DB_TM_PASSWORD", "bixkafa"),
#     "host": os.environ.get("DB_TM_HOST", "localhost"),
#     "port": os.environ.get("DB_TM_PORT", "5432")
# }

def create_users_table(usr_conn):
    """Membuat tabel users kosong di db_tm (silakan sesuaikan kolomnya)."""
    sql = """
    CREATE TABLE IF NOT EXISTS users (
        id SERIAL PRIMARY KEY,
        email VARCHAR(255) NOT NULL UNIQUE,
        password TEXT NOT NULL
    );
    """
    with usr_conn.cursor() as cur:
        cur.execute(sql)
    usr_conn.commit()


def migrate_table():
    usr_conn = None
    try:
        usr_conn = psycopg2.connect(**DB_USER_CONFIG)
        # usr_conn = psycopg2.connect(**DB_TM_CONFIG)
        create_users_table(usr_conn)

        print("Table success create")
    except Exception as exc:
        if usr_conn:
            usr_conn.rollback()
        print(f"Gagal membuat tabel: {exc}")
        raise
    finally:
        if usr_conn:
            usr_conn.close()


if __name__ == "__main__":
    migrate_table()