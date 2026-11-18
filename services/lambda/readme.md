# Lambda Fuction

<p>Lambda function an serverless services. Lambda function will trigger automaticly with eventbridge. Only one lambda function we need. Don't forget to install dependency and set lambda layers. Version <strong>Python 3.13</strong>.</p>

--- 
<h3>Install dependency</h3>
<p>Depencies are important thing, if there's no dependency the application can't run properly. So you need install depencies first and set lambda layers with that dependency</p>

```bash
# Depedencies 
boto3
psycopg2-binary
```

--- 
<h3>Environtment Variable</h3>
<p>Environtment a secret information about the application, without this you're application can't connect to dabatase so make sure at lambda you setting it</p>

```bash
# DB User
DB_USERS_NAME     = # Name of DB User
DB_USERS_HOST     = # Endpoint of RDS DB User
DB_USERS_USERNAME = # Username of DB User
DB_USERS_PASSWORD = # Password Of DB Password

# DB TierMaker
DB_TM_NAME     = # Name of DB TM
DB_TM_HOST     = # Endpoint of RDS DB TM
DB_TM_USERNAME = # Username of DB TM
DB_TM_PASSWORD = # Password Of DB Password

# SNS
SNS_TOPIC_ARN = # Arn of SNS Topic
```