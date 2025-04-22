curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



gcloud config set compute/zone $ZONE

gcloud container clusters create hello-world

git clone https://github.com/GoogleCloudPlatform/kubernetes-engine-samples

cd kubernetes-engine-samples/quickstarts/hello-app

docker build -t gcr.io/$DEVSHELL_PROJECT_ID/hello-app:1.0 .

gcloud docker -- push gcr.io/$DEVSHELL_PROJECT_ID/hello-app:1.0

kubectl create deployment hello-app --image=gcr.io/$DEVSHELL_PROJECT_ID/hello-app:1.0

kubectl expose deployment hello-app --name=hello-app --type=LoadBalancer --port=80 --target-port=8080

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
