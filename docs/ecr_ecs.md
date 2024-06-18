# How to push an image to aws registry (ECR) and run a container using ECS.

## Prerequisites

- AWS Account: You will need an AWS account with the necessary permissions to access and manage ECR and ECS services.

- AWS CLI: Ensure you have the AWS CLI installed and configured on your local machine. You can follow the <a href="https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html">official AWS CLI installation guide</a> for your operating system.

- Docker: You'll need to have Docker installed on your local machine. You can download Docker from the <a href="https://www.docker.com/get-started/">official Docker website</a>.

# Getting Started
Before you can use AWS services like ECR and ECS, you need to configure your AWS credentials. There are two main ways to do this:

1. AWS CLI Configuration:
- Run ```aws configure``` in your terminal. A prompt will be displayed to enter the AWS credentials.

- Enter your AWS Access Key ID, AWS Secret Access Key, and default AWS region when prompted.

2. Environment Variables:
- Set the following environment variables with your AWS credentials:
```bash
export AWS_ACCESS_KEY_ID="your-access-key-id"
export AWS_SECRET_ACCESS_KEY="your-secret-access-key"
export AWS_SESSION_TOKEN="your-session-token" (optional)
```

# Creating and pushing our first image to ECR

Step 1: Create an ECR Repository
- Open the AWS Management Console and navigate to the ECR service.
- Click on "Create repository" and provide a name for your repository.
- Click "Create repository" to create the ECR repository.

Step 2: Retrieve an authentication token and authenticate your Docker client to your registry. Use the AWS CLI:
```bash
aws ecr get-login-password --region your-aws-region | docker login --username AWS --password-stdin your-ecr-repository-uri
```

Note: After connecting successfully, the credentials will be stored in the file ~/.docker/config.json unencrypted so there is a better need to securely store those information yourself. To be able to do that follow the steps in the guide [How to set up secure credential storage for docker using docker credential helper](../Readme.md)

Step 2: Build and Push the Docker Image to ECR
```bash
docker build -t image-name . # the . specifies the context that is where our Dockerfile is found
```

Step 3: After the build completes, tag your image so you can push the image to this repository:
```bash
docker tag image-name:version your-ecr-repository-uri/your-image-name:latest
```

Step 4: Run the following command to push this image to your newly created AWS repository:
```bash
docker push your-ecr-repository-uri/your-image-name:latest
```

# Running a Container with our Image.
Step 1: Create an ECS Cluster
- Open the AWS Management Console and navigate to the ECS service.
- Click on "Clusters" in the left-hand menu.
- Click "Create Cluster" and choose the appropriate cluster template for your needs (e.g., Fargate or EC2).
- Provide a name for your cluster and configure any other required settings.
- Click "Create" to create the ECS cluster.

Step 2: Create an ECS Task Definition
- In the ECS service, click on "Task Definitions" in the left-hand menu.
- Click "Create new Task Definition".
- Choose the appropriate launch type for your task (e.g., Fargate or EC2).
- Configure the task definition, including the container image, port mappings, and any other required settings.
- Click "Create" to create the ECS task definition.

Step 3: Create an ECS Service
- In the ECS service, click on "Services" in the left-hand menu.
- Click "Create Service".
- Choose the appropriate service type (e.g., Replica or Daemon).
- Select the cluster and task definition you created earlier.
- Configure the service settings, such as the number of tasks, load balancing, and any other required settings.
- Click "Create Service" to create the ECS service.

That's it! You have now successfully pushed a Docker image to AWS ECR and created an ECS service to run your container.