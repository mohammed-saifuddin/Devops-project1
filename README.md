CI/CD Pipeline with GitHub Actions & Docker (No Cloud Needed)

Objective

This project sets up a complete CI/CD pipeline that builds a Docker image, runs tests, and deploys locally without using any cloud services. The pipeline leverages GitHub Actions, Docker, and Minikube (or a local VM).
 Tools Used
- GitHub Actions: Automates the CI/CD workflow.
- Docker: For containerizing the application.
- Docker Hub: Free repository for hosting Docker images.
- Minikube or Local VM: For local Kubernetes cluster setup.
- Node.js: Backend framework for the example app (can be customized as per your app).
 Setup Instructions


 Dockerfile
The Dockerfile defines the environment for building and running the application.


 Docker Compose
docker-compose.yml is used to define services and manage multi-container deployments.


GitHub Actions Workflow
The .github/workflows/ci-cd.yml file defines the CI/CD pipeline and automates tasks like building the Docker image, running tests, and deploying to Minikube.

Make sure to set up Docker Hub credentials as GitHub Secrets (DOCKER_USERNAME and DOCKER_PASSWORD).


 Minikube Setup
Install Minikube on your local machine.

Start Minikube:
minikube start
Deploy the app to Minikube:
kubectl run your-app --image=yourdockerhubusername/yourappname:latest --port=3000
kubectl expose pod your-app --type=NodePort --port=3000
kubectl get services


 Running Locally (for testing)
Before pushing your changes, test everything locally:

 Build the image locally
docker build -t yourappname .

Run the image
docker run -p 3000:3000 yourappname

 Test the app at http://localhost:3000

 
 CI/CD Workflow Results
After pushing changes to the main branch, the GitHub Actions workflow will trigger. You can view the workflow results in the Actions tab on GitHub.


GitHub Repository with Workflows: The repository contains the CI/CD configuration in .github/workflows/ci-cd.yml.


Docker Image Link:https://hub.docker.com/repository/docker/saifuddin337/ci-cd-app/general

CI/CD Workflow Results: You can monitor the results in the GitHub Actions tab.


