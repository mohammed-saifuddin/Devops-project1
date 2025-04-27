
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

```Dockerfile
# Base image
FROM node:16

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy application code
COPY . .

# Expose the port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
```

Build and push your Docker image to **Docker Hub**:

```bash
# Build the image
docker build -t yourusername/yourapp:v1 .

# Push the image to Docker Hub
docker push yourusername/yourapp:v1
```

Repeat for the **canary version** (e.g., `yourusername/yourapp:v2`).

#### Deployments Configuration

Create two YAML files for stable and canary versions:

##### `stable-deployment.yaml`

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: yourapp-stable
  labels:
    app: yourapp
    version: stable
spec:
  replicas: 3
  selector:
    matchLabels:
      app: yourapp
      version: stable
  template:
    metadata:
      labels:
        app: yourapp
        version: stable
    spec:
      containers:
        - name: yourapp
          image: yourusername/yourapp:v1
          ports:
            - containerPort: 3000
```

##### `canary-deployment.yaml`

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: yourapp-canary
  labels:
    app: yourapp
    version: canary
spec:
  replicas: 1
  selector:
    matchLabels:
      app: yourapp
      version: canary
  template:
    metadata:
      labels:
        app: yourapp
        version: canary
    spec:
      containers:
        - name: yourapp
          image: yourusername/yourapp:v2
          ports:
            - containerPort: 3000
```

Apply these deployments to the K3s cluster:

```bash
kubectl apply -f stable-deployment.yaml
kubectl apply -f canary-deployment.yaml
```
4. Configure Istio Gateway and Routing

Create **Istio Gateway** and **VirtualService** configuration files to control the traffic routing between stable and canary versions.

 `istio-gateway.yaml`

```yaml
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: yourapp-gateway
  namespace: default
spec:
  selector:
    istio: ingressgateway # Use Istio's default ingress gateway
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - "*"
```

 `istio-virtualservice.yaml`

```yaml
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: yourapp-virtualservice
  namespace: default
spec:
  hosts:
    - "*"
  http:
    - route:
        - destination:
            host: yourapp
            subset: stable
          weight: 80
        - destination:
            host: yourapp
            subset: canary
          weight: 20
```

Apply the Istio configurations:

```bash
kubectl apply -f istio-gateway.yaml
kubectl apply -f istio-virtualservice.yaml
```
 5. Monitor and Manage Traffic

To monitor the traffic, use **Prometheus** and **Grafana** integrated with Istio.

To change traffic routing, adjust the weights in the `VirtualService` configuration. For example, to send 50% of traffic to the canary version, modify the configuration:

```yaml
- route:
    - destination:
        host: yourapp
        subset: stable
      weight: 50
    - destination:
        host: yourapp
        subset: canary
      weight: 50
```




Apply the updated configuration:

```bash
kubectl apply -f istio-virtualservice.yaml
```



