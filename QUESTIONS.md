# MLOps Lab 5 - GitHub Actions Questions

## Basic GitHub Actions

### Question 1: What did the `multi-line script` return?
**Answer:** The multi-line script in the initial GitHub Actions workflow returns "Hello, world!" by default. This is from the simple workflow template.

### Question 2: What did you change in the workflow file? Show the changes and explain.
**Answer:** I changed the workflow to build and test a Docker container:
- Added Docker build step to create an Nginx image
- Added Docker run step to start the container on port 8081
- Added container verification step to ensure it's running
- [Include screenshot of your docker-build.yml file]

### Question 3: Did your workflow fail? If so, why?
**Answer:** Initially, the workflow would fail because:
1. The workflow was on the main branch
2. We needed to create a pull request from 01_DockerTest to main
3. The workflow needed to be triggered from the correct branch

## Self-hosted Runner

### Question 4: How did you make the name randomised in the Kubernetes Pod?
**Answer:** In our PowerShell-based GitHub Actions workflow, we generate a random pod name using PowerShell's Get-Random cmdlet:
```powershell
$podName = "mypod-$(Get-Random)"
```
This creates a unique pod name each time the workflow runs. We could also use GitHub's built-in contexts like `${{ github.run_id }}` or `${{ github.sha }}` for unique identifiers.

### Question 5: How does the command for a Helm install look like with the flags added?
**Answer:** In our workflow, the Helm install command with all necessary flags looks like:
```bash
helm upgrade --install my-app ./helm-chart \
  --namespace my-namespace \
  --create-namespace \
  --set image.tag=${{ github.sha }} \
  --set replicaCount=2 \
  --wait
```
Key flags explained:
- `upgrade --install`: Updates if exists, creates if not
- `--namespace`: Specifies the K8s namespace
- `--create-namespace`: Creates namespace if it doesn't exist
- `--set`: Overrides values (we use git SHA for unique versioning)
- `--wait`: Waits for deployment to complete

## Things to Include/Verify:
1. Screenshots:
   - GitHub Actions workflow runs
   - Docker container running locally
   - Self-hosted runner connected to GitHub
   
2. Code snippets:
   - Final workflow YAML
   - Kubernetes pod definition
   - Helm commands used

3. Testing proof:
   - Screenshot of successful workflow run
   - Container test results
   - Pod deployment verification
