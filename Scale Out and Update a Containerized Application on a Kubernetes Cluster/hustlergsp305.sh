curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh






gsutil cp gs://sureskills-ql/challenge-labs/ch05-k8s-scale-and-update/echo-web-v2.tar.gz .

tar xvzf echo-web-v2.tar.gz

gcloud builds submit --tag gcr.io/$DEVSHELL_PROJECT_ID/echo-app:v2 .

gcloud container clusters get-credentials echo-cluster --zone $ZONE

kubectl create deployment echo-web --image=gcr.io/qwiklabs-resources/echo-app:v1

kubectl expose deployment echo-web --type=LoadBalancer --port 80 --target-port 8000

kubectl patch deployment echo-web -p '{"spec": {"template": {"spec": {"containers": [{"name": "echo-app", "image": "gcr.io/qwiklabs-resources/echo-app:v2"}]}}}}'


kubectl scale deploy echo-web --replicas=2



curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
