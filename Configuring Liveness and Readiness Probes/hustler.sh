curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh






source <(kubectl completion bash)


gcloud container clusters get-credentials $CLUSTER_NAME --zone $ZONE

git clone https://github.com/GoogleCloudPlatform/training-data-analyst


ln -s ~/training-data-analyst/courses/ak8s/v1.1 ~/ak8s

cd ~/ak8s/Probes/


kubectl create -f exec-liveness.yaml

kubectl get pod liveness-exec


kubectl create -f readiness-deployment.yaml

kubectl get service readiness-demo-svc

kubectl exec readiness-demo-pod -- touch /tmp/healthz

kubectl describe pod readiness-demo-pod | grep ^Conditions -A 5

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
