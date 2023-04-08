import json
import sqlparse, re
import pymysql
from crhelper import CfnResource
import os
import boto3
 
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

def createConfigFile(S3Bucket, fileKey, configMap):
    s3 = boto3.resource('s3')
    obj = s3.Object(S3Bucket, fileKey)
    
    body = ""
    for key, value in configMap.items():
        body = body + key
        body = body + "="
        body = body + value + "\n"
        
    obj.put(Body = body)
    
    
@helper.create
def create(event, context):
    print("Got Create")
    print(event)
    
    properties = event.get('ResourceProperties', {})
    
    #for creating config file
    configFileKey = properties.get("CONFIG_FILE_KEY")
    configMap = properties.get("WEB_SERVER_ENV")
    S3Bucket = properties.get("BUCKET_NAME") #name of bucket to put file
    
    print("configMap: " , end= " ")
    print(configMap)
    print(type(configMap))
    print("bucket name: ", end = " ")
    print(S3Bucket)
    
    
    try:
        response = createConfigFile(S3Bucket, configFileKey, configMap)
        print("response: ", end= " ")
        print(response)
    except Exception as e:
        print(e)
        helper.Data.update({"errorMsg": str(e)})
        
    
    # Items stored in helper.Data will be saved
    # as outputs in your resource in CloudFormation
    helper.Data.update({"successMsg": "Success!"})
    return "MyResourceId"


@helper.update
def update(event, context):
    print("============================ Update ================================")
    #for creating config file
    print("event: " ,end= " ")
    print(event)

    properties = event.get('ResourceProperties', {})
    
    #for creating config file
    configFileKey = properties.get("CONFIG_FILE_KEY")
    configMap = properties.get("WEB_SERVER_ENV")
    S3Bucket = properties.get("BUCKET_NAME") #name of bucket to put file
    
    print("configMap: " , end= " ")
    print(configMap)
    print(type(configMap))
    print("bucket name: ", end = " ")
    print(S3Bucket)
    
    
    try:
        response = createConfigFile(S3Bucket, configFileKey, configMap)
        print("response: ", end= " ")
        print(response)
    except Exception as e:
        print(e)
        helper.Data.update({"errorMsg": str(e)})
        
    
    # Items stored in helper.Data will be saved
    # as outputs in your resource in CloudFormation
    helper.Data.update({"successMsg": "Success!"})
    
    
    return "MyNewResourceId"


@helper.delete
def delete(event, context):
    print("delete!")