curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


PROJECT_ID=$(gcloud config get-value project)

echo "PROJECT_ID=${PROJECT_ID}"
echo "REGION=${REGION}"

USER=$(gcloud config get-value account 2> /dev/null)
echo "USER=${USER}"

gcloud services enable cloudaicompanion.googleapis.com --project ${PROJECT_ID}

gcloud projects add-iam-policy-binding ${PROJECT_ID} --member user:${USER} --role=roles/cloudaicompanion.user
gcloud projects add-iam-policy-binding ${PROJECT_ID} --member user:${USER} --role=roles/serviceusage.serviceUsageViewer

gcloud container clusters create-auto gemini-demo --region $REGION

kubectl create deployment hello-server --image=us-docker.pkg.dev/google-samples/containers/gke/hello-app:1.0

kubectl expose deployment hello-server --type LoadBalancer --port 80 --target-port 8080 

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
