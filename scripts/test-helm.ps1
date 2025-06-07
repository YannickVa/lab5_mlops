# Test deployment locally
$GIT_SHA = (git rev-parse --short HEAD)

Write-Host "Testing Helm deployment with image tag: $GIT_SHA"

# Create namespace if it doesn't exist
if (!(kubectl get namespace my-namespace 2>$null)) {
    kubectl create namespace my-namespace
}

# Deploy using Helm
helm upgrade --install nginx-app ./helm-chart `
    --namespace my-namespace `
    --create-namespace `
    --set image.tag=$GIT_SHA `
    --wait

# Check deployment status
Write-Host "`nPod status:"
kubectl get pods -n my-namespace

Write-Host "`nHelm release status:"
helm list -n my-namespace
