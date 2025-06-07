# GitHub Actions Automation with Kubernetes

This project explores the integration of Kubernetes with GitHub Actions to set up a powerful CI/CD pipeline.

## Project Structure
- Basic Docker application with Nginx
- GitHub Actions workflow setup
- Self-hosted runners
- Kubernetes deployment automation

## Getting Started

We'll follow these steps:
1. Set up a basic Docker application with Nginx
2. Create and configure GitHub Actions workflow
3. Set up a self-hosted runner
4. Implement Kubernetes deployment automation

Let's get started with each step!

## Step 1: Basic Docker Application Setup

// ...existing content for step 1...

## Setting up Self-Hosted Runner

1. In your GitHub repository, go to Settings > Actions > Runners
2. Click "New self-hosted runner"
3. Choose your OS (Windows) and architecture
4. Follow the configuration steps shown in GitHub:
   ```powershell
   # Download runner
   mkdir actions-runner; cd actions-runner
   # Download the runner package...
   # Extract the installer...
   
   # Configure the runner
   ./config.cmd --url https://github.com/YannickVa/lab5_mlops --token YOUR_TOKEN
   
   # Start the runner
   ./run.cmd
   ```

## Testing the Complete Pipeline

The complete pipeline includes:
1. Docker image building with versioning
2. Kubernetes deployment with random pod names
3. Helm chart deployment with proper versioning

You can test components individually:
- Docker: `docker build -t hello-world-nginx:local .`
- Kubernetes: `kubectl apply -f k8s/pod.yaml`
- Helm: Run `./scripts/test-helm.ps1`

## Notes on Kubernetes Updates
- We use rolling updates by default
- Image tags use git SHA for versioning
- Namespace is created if it doesn't exist
- Both kubectl and Helm deployments are included

## Questions and Answers

### Q: What did the `multi-line script` return?

A: The multi-line script in the initial GitHub Actions workflow returns "Hello, world!" by default. This is because it was created using the "Simple workflow" template which includes a basic shell script that echoes this message.
