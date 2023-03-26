import json
import sqlparse, re
import pymysql
from crhelper import CfnResource
import os
import boto3
 
dbEndpoint = os.environ['DB_ENDPOINT']
S3Bucket = os.environ['BUCKET_NAME']
ddlKey = os.environ['DDL_KEY']
dmlKey = os.environ['DML_KEY']
user= os.environ["USER"]
password = os.environ["PASSWORD"]

helper = CfnResource(
    json_logging=False,
    log_level='DEBUG',
    boto_level='CRITICAL'
)

def lambda_handler(event, context):
    helper(event, context)
    
    return {
        'statusCode': 200,
        'body': json.dumps('success')
    }

def getDDL():
    s3 = boto3.resource('s3')
    obj = s3.Object(S3Bucket, ddlKey)
    ddl = obj.get()['Body'].read().decode('utf-8')
    
    return ddl

def getDML():
    s3 = boto3.resource('s3')
    obj = s3.Object(S3Bucket, dmlKey)
    dml = obj.get()['Body'].read().decode('utf-8')
    
    return dml
    
def executeStatements(cursor, sqlList):
    cursor.execute("START TRANSACTION;")
    for sql in sqlList:
        cursor.execute(sql);
    cursor.execute("COMMIT;")
    
def connectToRds():
    connection = pymysql.connect(host = dbEndpoint, port = 3306, user=user, passwd=password, charset = 'utf8')
    cursor = connection.cursor()
    
@helper.create
def create(event, context):
    print("Got Create")
    
    try:
        connection = pymysql.connect(host = dbEndpoint, port = 3306, user=user, passwd=password, charset = 'utf8')
        cursor = connection.cursor()
        ddlList = sqlparse.split(getDDL())
        dmlList = sqlparse.split(getDML())
        print("ddlList")
        print(ddlList)
        print("dmlList")
        print(dmlList)
        
        executeStatements(cursor, ddlList)
        executeStatements(cursor, dmlList)
        
    except Exception as e:
        print(e)
        helper.Data.update({"errorMsg": str(e)})
        
    
    # Items stored in helper.Data will be saved
    # as outputs in your resource in CloudFormation
    helper.Data.update({"successMsg": "Success!"})
    return "MyResourceId"


@helper.update
def update(event, context):
    print("Got Update")
    return "MyNewResourceId"


@helper.delete
def delete(event, context):
    print("delete!")