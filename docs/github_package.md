# Building and Publishing a Package to AWS ECR using GitHub Actions
This guide provides step-by-step instructions on how to set up a GitHub Actions workflow to build and publish a package to AWS ECR.

# Prerequisites
- An AWS account with access to the Elastic Container Registry (ECR) service.
- A GitHub account and a repository where you want to set up the GitHub Actions workflow.
- Docker installed on your local machine (or the build environment).

# Step 1: Create an ECR Repository
1. Log in to the AWS Management Console.
2. Navigate to the Elastic Container Registry service.
3. Create a new repository by clicking on the "Create repository" button.
4. Choose a name for your repository and leave the other settings as default.
5. Make a note of the repository URI, which will be used in the GitHub Actions workflow.

# Step 2: Configure GitHub Secrets
1. In your GitHub repository, go to the "Settings" tab.
2. Click on the "Secrets" section in the left-hand menu.
3. Create the following secrets:
```bash
AWS_ACCESS_KEY_ID: Your AWS access key ID.
AWS_SECRET_ACCESS_KEY: Your AWS secret access key.
ECR_REGISTRY: The URI of the ECR repository you created in the previous step.
```

# Step 3: Create the GitHub Actions Workflow
In your GitHub repository, create a new file in the .github/workflows directory named build-and-publish.yml. 
[checkout workflow here](../.github/workflows/build-and-deploy.yaml)

Customize the workflow to fit your specific project requirements, such as the Dockerfile location, image name, and tag.

# Step 4: Commit and Push the Workflow
- Commit the build-and-publish.yml file to your GitHub repository.
- Push the changes to the main branch.

# Step 5: Verify the Workflow Execution
- Go to the "Actions" tab in your GitHub repository.
- You should see the "Build and Publish to AWS ECR" workflow running.
- Once the workflow completes successfully, you can verify that the Docker image has been pushed to your ECR repository.

# Conclusion
This guide provides a basic setup for building and publishing a package to AWS ECR using GitHub Actions. You can further customize the workflow to include additional steps, such as running tests, building multi-architecture images, or integrating with other AWS services. Remember to update the workflow configuration and GitHub secrets according to your specific project requirements.
