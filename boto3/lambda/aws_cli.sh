aws s3api help
aws s3api create-bucket help


aws s3api create-bucket --bucket mulani-bucket --create-bucket-configuration '{"LocationConstraint":"ap-south-1"}'

aws s3api list-buckets

aws lambda list-functions

aws lambda get-policy --function-name HelloWorld

aws cloudtrail lookup-events

aws cloudtrail lookup-events --lookup-attributes AttributeKey=ResourceName,AttributeValue=mulani-bucket

aws s3api list-objects --bucket mulani-bucket

aws s3api put-object --bucket mulani-bucket --key "dev/test/helloworld.txt" --body output.txt

aws s3api list-objects --bucket mulani-bucket

aws s3api get-object --bucket mulani-bucket --key "dev/test/helloworld.txt" s3_object_output.txt


aws lambda invoke --function-name HelloWorld --payload '{"first_name":"TT", "last_name":"LL"}' tt.txt

aws iam attach-role-policy --role-name $role --policy-arn "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"

