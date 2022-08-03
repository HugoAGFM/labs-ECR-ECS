aws ecr get-login-password --region $REGION | docker login -u AWS --password-stdin $AWS_ACCOUNT_ID".dkr.ecr."$REGION".amazonaws.com"

docker build -t $ECR_NAME ./docker

docker tag $ECR_NAME":latest" $ECR_URI":latest"

docker push $ECR_URI":latest"
