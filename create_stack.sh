aws cloudformation create-stack --stack-name <stack-name> --template-body file://<file-path> --parameters ParameterKey=<param-key>,ParameterValue=<param-value> --capabilities CAPABILITY_NAMED_IAM

#example
aws cloudformation update-stack --stack-name test-env --template-body file://vpc.yaml --capabilities CAPABILITY_NAMED_IAM

aws cloudformation create-stack --template-body file://web_servers.yaml --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=LoadBalancerSubnets,ParameterValue="subnet-05a0919a70315125f\,subnet-0c31e2bae947418bb" \
 ParameterKey=WebServerSubnets,ParameterValue="subnet-04aee95a6c7e6813e\,subnet-0cee9f42b1b0ca063" ParameterKey=VPC,ParameterValue="vpc-0d084a9cfe8adb5b1"\
  ParameterKey=BastionServerSecurityGroup,ParameterValue=sg-06bcb4f3c63436922 --stack-name asg-example

aws cloudformation update-stack --template-body file://web_servers.yaml --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=LoadBalancerSubnets,ParameterValue="subnet-05a0919a70315125f\,subnet-0c31e2bae947418bb" \
 ParameterKey=WebServerSubnets,ParameterValue="subnet-04aee95a6c7e6813e\,subnet-0cee9f42b1b0ca063" ParameterKey=VPC,ParameterValue="vpc-0d084a9cfe8adb5b1"\
  ParameterKey=BastionServerSecurityGroup,ParameterValue=sg-06bcb4f3c63436922 ParameterKey=SSHKeyName,ParameterValue=spring-web-server --stack-name asg-example
