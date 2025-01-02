# devops-coding-challenge
## Steps of the Project
1. **Provision the PostgreSQL Database**:
   ```bash
   cd terraform
   terraform init
   terraform apply

## Deploying the Web Application
cd ../kubernetes
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

## Create the Kubernetes Secret
cd ../scripts
./create-secret.sh

## Verify the deployment
kubectl get pods
kubectl get services

## Access the Health Endpoint
curl http://<Minikube-IP>:<NodePort>/
