#!/bin/bash

if [ -z ${AWS_ACCOUNT_ID+x} ]; then
    echo "variable AWS_ACCOUNT_ID is not set"
    exit 1
fi

bucket_name="mulani-bucket"
notification_config="put_bucket_notification.json"
function_name="HelloWorld"

## grant permission to s3 service to  invoke lambda fnction
aws lambda add-permission \
--function-name HelloWorld \
--statement-id some-unique-id \
--action "lambda:InvokeFunction" \
--principal s3.amazonaws.com \
--source-arn arn:aws:s3:::$bucket_name \
--source-account ${AWS_ACCOUNT_ID} \
#--profile adminuser
#--region us-west-2 \

## verify the policy
aws lambda get-policy \
--function-name $function-name \
#--profile adminuser

## configure put bucket notification event
aws --debug --color on s3api \
put-bucket-notification-configuration \
--bucket $bucket_name \
--notification-configuration file://$notification_config



