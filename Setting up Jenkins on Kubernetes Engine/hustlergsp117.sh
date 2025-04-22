curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



gcloud auth list


gcloud config set compute/zone $ZONE

git clone https://github.com/GoogleCloudPlatform/continuous-deployment-on-kubernetes.git

cd continuous-deployment-on-kubernetes

gcloud container clusters create jenkins-cd \
--num-nodes 2 \
--scopes "https://www.googleapis.com/auth/projecthosting,cloud-platform"

gcloud container clusters get-credentials jenkins-cd

helm repo add jenkins https://charts.jenkins.io

helm repo update

helm upgrade --install -f jenkins/values.yaml myjenkins jenkins/jenkins

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
