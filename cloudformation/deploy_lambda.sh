#!/bin/bash
set -eo pipefail
aws cloudformation package --template-file template.yml --s3-bucket mulani-lambda-bucket --output-template-file out.yml
aws cloudformation deploy --template-file out.yml --stack-name java-basic --capabilities CAPABILITY_NAMED_IAM
