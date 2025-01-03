# devops-coding-challenge
This project implements a CI/CD pipeline for deploying a web application with a PostgreSQL database, with the focus on securely handling database credentials and deploying the application in a Minikube cluster. It also includes an implementation of monitoring and alerting using Prometheus and Grafana.

## Steps of the Project

1. **Provision the PostgreSQL Database**:
   ```bash
   cd terraform
   terraform init
   terraform apply

2. ## Deploying the Web Application
cd ../kubernetes
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

3. ## Create the Kubernetes Secret
cd ../scripts
./create-secret.sh

4. ## Verify the deployment
kubectl get pods
kubectl get services

5. ## Access the Health Endpoint
curl http://<Minikube-IP>:<NodePort>/

6. ## Monitoring and Alerting with Prometheus and Grafana
# Installing Prometheus
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
kubectl create namespace monitoring
helm install prometheus prometheus-community/prometheus --namespace monitoring -f kubernetes/monitoring/values.yaml
# Installing Grafana
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install grafana grafana/grafana --namespace monitoring
kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
kubectl port-forward -n monitoring svc/grafana 3000:80
