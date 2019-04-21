echo "Beware !!!You will be deleting Cloud Formation stacks"
read -p "Enter stack name: " STACK_NAME_2
echo "Deleting stack '$STACK_NAME_2'..."
aws cloudformation delete-stack --stack-name $STACK_NAME_2
aws cloudformation wait stack-delete-complete --stack-name $STACK_NAME_2

echo "Stack $STACK_NAME_2 deleted successfully"

DeletedStackList=$(aws cloudformation list-stacks --stack-status-filter DELETE_COMPLETE --query "StackSummaries[*].StackName" --output text)
echo "List of all recently deleted Stackname $DeletedStackList"

