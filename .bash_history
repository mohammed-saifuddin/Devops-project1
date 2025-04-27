sudo apt update -y
curl -sfL https://get.k3s.io | sh -
sudo cat /var/lib/rancher/k3s/server/node-token
ip a
sudo kubectl get nodes
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
curl -L https://istio.io/downloadIstio | sh -
cd istio-*
export PATH=$PWD/bin:$PATH
istioctl install --set profile=demo -y
sudo systemctl status k3s
sudo cat /etc/rancher/k3s/k3s.yaml
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
echo "export KUBECONFIG=/etc/rancher/k3s/k3s.yaml" >> ~/.bashrc
source ~/.bashrc
kubectl get nodes
sudo su
istioctl install --set profile=demo -y
sudo su
sudo suistioctl install --set profile=demo -y
sudo su istioctl install --set profile=demo -y
sudo istioctl install --set profile=demo -y
# 1. Download Istio CLI
curl -L https://istio.io/downloadIstio | sh -
# 2. Move into Istio directory
cd istio-*
# 3. Add istioctl to your PATH
export PATH=$PWD/bin:$PATH
# 4. Check if installed
istioctl version
sudo istioctl install --set profile=demo -y
istioctl install --set profile=demo -y
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
sudo kubectl get nodes
# Copy the kubeconfig
sudo cp /etc/rancher/k3s/k3s.yaml $HOME/k3s.yaml
# Fix ownership
sudo chown $USER:$USER $HOME/k3s.yaml
sudo cp /etc/rancher/k3s/k3s.yaml $HOME/k3s.yaml
export KUBECONFIG=$HOME/k3s.yaml
kubectl get nodes
echo "export KUBECONFIG=$HOME/k3s.yaml" >> ~/.bashrc
source ~/.bashrc
istioctl install --set profile=demo -y
nano stable-deployment.yml
nano canary-deployment.yml
kubectl apply -f stable-deployment.yaml
kubectl apply -f canary-deployment.yaml
kubectl apply -f canary-deployment.yml
kubectl apply -f stable-deployment.yaml
kubectl apply -f stable-deployment.yml
kubectl get nodes
kubectl get deployment
nano istio-gateway.yml
nano istio-virtualservice.yml
kubectl apply -f istio-gateway.yaml
kubectl apply -f istio-virtualservice.yaml
kubectl apply -f istio-virtualservice.yml
kubectl apply -f istio-gateway.yml
kubectl get deployment
kubectl get svc istio-ingressgateway -n istio-system
kubectl get deployment
kubectl get pods -A
kubectl get svc -A
kubectl get svc -n istio-system
kubectl get virtualservice -A
kubectl describe virtualservice <your-vs-name> -n <namespace>
kubectl describe virtualservice app-virtualservice
kubectl get deployment
ls
cat canary-deployment.yml 
nano canary-deployment.yml 
nano stable-deployment.yml 
kubectl apply -f stable-deployment.yaml
kubectl apply -f stable-deployment.yml
kubectl apply -f canary-deployment.yml
nano destination.yml
kubectl apply -f destination.yml
nano destination.yml
kubectl get namespace
nano canary-deployment.yml 
nano stable-deployment.yml 
nano destination.yml
nano stable-deployment.yml 
nano destination.yml
kubectl apply -f canary-deployment.yml
kubectl apply -f stable-deployment.yml
kubectl apply -f destination.yml
kubectl create namespace app-canary
kubectl label namespace app-canary istio-injection=enabled
kubectl apply -f destination.yml
kubectl get pods -n istio-system
kubectl apply -f destination.yml
kubectl delete pod -n istio-system --all
kubectl get crds | grep istio
istioctl install --set profile=demo -y
kubectl get validatingwebhookconfiguration istio-sidecar-injector
kubectl logs -n istio-system -l app=istiod
kubectl apply -f destination.yml
kubectl get svc istio-ingressgateway -n istio-system
istioctl dashboard kiali
istioctl dashboard
nano Dockerfile
sudo apt install docker.io -y
nano Dockerfile
docker build -t myapp .
sudo docker build -t myapp .
nano server.js
nano server1.js
docker build -t myapp .
sudo docker build -t myapp .
ls
kubectl get pods
kubectl get deployment
kubectl get pods
kubectl get deployment
kubectl get pods
