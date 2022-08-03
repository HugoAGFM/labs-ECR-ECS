REGION=$(jq -r .outputs.region.value ./terraform/terraform.tfstate)
AWS_ACCOUNT_ID=$(jq -r .outputs.aws_account_id.value ./terraform/terraform.tfstate)
ECR_NAME=$(jq -r .outputs.ecr_name.value ./terraform/terraform.tfstate)
ECR_URI=$(jq -r .outputs.ecr_uri.value ./terraform/terraform.tfstate)


aws ecr get-login-password --region $REGION | docker login -u AWS --password-stdin $AWS_ACCOUNT_ID".dkr.ecr."$REGION".amazonaws.com"

docker build -t $ECR_NAME ./docker

docker tag $ECR_NAME":latest" $ECR_URI":latest"

docker push $ECR_URI":latest"
