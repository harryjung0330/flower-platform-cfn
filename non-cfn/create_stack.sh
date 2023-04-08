aws cloudformation create-stack --stack-name <stack-name> --template-body file://<file-path> --parameters ParameterKey=<param-key>,ParameterValue=<param-value> --capabilities CAPABILITY_NAMED_IAM

#example
aws cloudformation create-stack --template-body file://test_env.yaml --capabilities CAPABILITY_NAMED_IAM --stack-name test-env --timeout-in-minutes 30

aws cloudformation update-stack --template-body file://test_env.yaml --capabilities CAPABILITY_NAMED_IAM --stack-name test-env
 
aws cloudformation create-stack --template-body file://web_servers.yaml --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=LoadBalancerSubnets,ParameterValue="subnet-05a0919a70315125f\,subnet-0c31e2bae947418bb" \
 ParameterKey=WebServerSubnets,ParameterValue="subnet-04aee95a6c7e6813e\,subnet-0cee9f42b1b0ca063" ParameterKey=VPC,ParameterValue="vpc-0d084a9cfe8adb5b1"\
  ParameterKey=BastionServerSecurityGroup,ParameterValue=sg-06bcb4f3c63436922 --stack-name asg-example

aws cloudformation update-stack --template-body file://web_servers.yaml --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=LoadBalancerSubnets,ParameterValue="subnet-05a0919a70315125f\,subnet-0c31e2bae947418bb" \
 ParameterKey=WebServerSubnets,ParameterValue="subnet-04aee95a6c7e6813e\,subnet-0cee9f42b1b0ca063" ParameterKey=VPC,ParameterValue="vpc-0d084a9cfe8adb5b1"\
  ParameterKey=BastionServerSecurityGroup,ParameterValue=sg-06bcb4f3c63436922 ParameterKey=SSHKeyName,ParameterValue=spring-web-server --stack-name asg-example


aws cloudformation create-stack --template-body file://RDS.yaml --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=DBMasterUserName,ParameterValue="admin" \
 ParameterKey=DBMasterPassword,ParameterValue=helloworld! ParameterKey=DBSubnets,ParameterValue="subnet-02e90cf7c880a1913\,subnet-0c219a46f47b76a45" ParameterKey=VpcId,ParameterValue="vpc-0d084a9cfe8adb5b1"\
 ParameterKey=BastionSecGroup,ParameterValue=sg-06bcb4f3c63436922 ParameterKey=ClientSecGroup,ParameterValue=sg-0e516b236a277c345 --stack-name rds-example


aws cloudformation create-stack --template-body file://on_create_stack.yaml --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=DBUser,ParameterValue="admin" \
 ParameterKey=DBPassword,ParameterValue=helloworld! ParameterKey=SubnetIds,ParameterValue="subnet-0f67d0606ceb1cd97\,subnet-0a2c04fc6630d6e0d"\
 ParameterKey=CodeBucketName,ParameterValue=cloudformation-code-repo-flower-platform ParameterKey=CodeKey,ParameterValue=non-cfn/on_create_stack/on_create_stack.py.zip\
 ParameterKey=LayerKey,ParameterValue=non-cfn/on_create_stack/python.zip ParameterKey=ResourceBucketName,ParameterValue=cloudformation-code-repo-flower-platform\
 ParameterKey=DMLKey,ParameterValue=non-cfn/database/dml.sql ParameterKey=DDLKey,ParameterValue=non-cfn/database/ddl.sql\
 ParameterKey=DBEndpoint,ParameterValue=test-env-database-1vf0oezdmw6iu-rds-obniw2lxrpmd.c3ftl6psdgtp.ap-northeast-2.rds.amazonaws.com\
 ParameterKey=SecGroupId,ParameterValue=sg-0c015b255d07cfadf --stack-name rds-example


