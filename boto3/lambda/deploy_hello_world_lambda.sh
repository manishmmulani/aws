#!/bin/bash

### Ensure the variable AWS_ACCOUNT_ID is set
# http://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash
if [ -z ${AWS_ACCOUNT_ID+x} ]; then
    echo "variable AWS_ACCOUNT_ID is not set"
    exit 1
fi

### Create the lambda package
## https://github.com/cleesmith/get_html_head_title_tag -- site-packages / virtualenv
zip -j helloworld.zip *.py

### Create the role for the lambda to assume
role="helloworld_exec_role"
trust="trust.json"

## http://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-service.html
# step 1 : create role for 'trusted' account
# step 2 : grant access for 'trusted' account to 'AssumeRole' on your behalf to access 'lambda service'
aws iam create-role --role-name $role --assume-role-policy-document file://$trust
aws iam update-assume-role-policy --role-name $role --policy-document file://$trust


## attach policy of AWSLambdaBasicExecution to be able to access / write to cloudwatch
aws iam attach-role-policy --role-name $role --policy-arn "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"

## Ideally sleep for 5 to 6 seconds

### Create the lambda function
function_name="HelloWorld"
handler_name="hello_world.my_handler"
package_file=helloworld.zip
runtime=python3.6
aws lambda create-function \
  --function-name $function_name \
  --handler $handler_name \
  --runtime $runtime \
  --memory 512 \
  --timeout 60 \
  --role arn:aws:iam::${AWS_ACCOUNT_ID}:role/$role \
  --zip-file fileb://$package_file


## Execution
#aws lambda invoke --invocation-type RequestResponse --function-name HelloWorld --payload '{"first_name":"Manish","last_name":"Mulani"}' output.txt
# payload --payload file://file-path/inputfile.txt can be a file
