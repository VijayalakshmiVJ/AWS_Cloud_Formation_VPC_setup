#NETWORK STACK CREATION
read -p "Enter network stack name: " networkStackname
echo "Creating network stack '$networkStackname' using cloudformation template tele5360-cf-networking.json..."
aws cloudformation create-stack --stack-name $networkStackname --template-body file://tele5360-cf-networking.json --parameters  ParameterKey=stackName,ParameterValue=$networkStackname
aws cloudformation wait stack-create-complete --stack-name $networkStackname
CreatedStackList=$(aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE --query "StackSummaries[*].StackName" --output text)
echo "Network Stack $networkStackname created successfully"
#if [[ $CreatedStackList = *"$networkStackname"* ]]; then
#    echo "Network Stack $networkStackname created successfully"
#    else
#    echo "Network Stack $stackname creation failed"
#fi
