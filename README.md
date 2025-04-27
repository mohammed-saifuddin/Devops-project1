
Kubernetes-Based Canary Deployment with K3s and Istio

 Objective

This project demonstrates how to set up a **Kubernetes-based Canary Deployment** using **K3s** and **Istio**. The canary deployment will simulate routing traffic between a stable version and a canary version of an application, allowing traffic splitting and performance monitoring.

Tools Used

- K3s: Lightweight Kubernetes cluster.
- Istio: Service mesh for traffic management, routing, and observability.
- Docker: For containerizing the application.
- Helm: For managing Kubernetes charts.
- Node.js (or Python): Example app for the deployment.

 Setup Instructions

 1. Set Up K3s Cluster

First, install **K3s** on your local machine or on a VM. Follow the installation instructions [here](https://k3s.io/).

Verify the K3s installation by running:

```bash
kubectl get nodes
```

 2. Install Istio on K3s Cluster

Install **Istio** using Helm. Run the following commands:

```bash
# Add Istio repo and update Helm repos
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update

# Install Istio using the default profile
helm install istio-base istio/base -n istio-system
helm install istiod istio/istiod -n istio-system --wait
```

Verify the Istio installation:

```bash
kubectl get pods -n istio-system
```

3. Deploy Two Versions of the App (Stable and Canary)

Create a **Dockerfile** for your application. Below is a sample Dockerfile for a Node.js app:


Build and push your Docker image to **Docker Hub**:

```bash
# Build the image
docker build -t yourusername/yourapp:v1 .

# Push the image to Docker Hub
docker push yourusername/yourapp:v1
```

 Deployments Configuration

Create two YAML files for stable and canary versions:


Apply these deployments to the K3s cluster:

```bash
kubectl apply -f stable-deployment.yaml
kubectl apply -f canary-deployment.yaml
```
4. Configure Istio Gateway and Routing

Create **Istio Gateway** and **VirtualService** configuration files to control the traffic routing between stable and canary versions

Apply the Istio configurations:

```bash
kubectl apply -f istio-gateway.yaml
kubectl apply -f istio-virtualservice.yaml
```
 5. Monitor and Manage Traffic

To monitor the traffic, use **Prometheus** and **Grafana** integrated with Istio.

To change traffic routing, adjust the weights in the `VirtualService` configuration. For example, to send 50% of traffic to the canary version, modify the configuration:



```bash
kubectl apply -f istio-virtualservice.yaml
```



