#!/bin/bash
role="helloworld_exec_role"
function_name="HelloWorld"
aws lambda delete-function --function-name $function_name
aws iam delete-role --role-name $role
