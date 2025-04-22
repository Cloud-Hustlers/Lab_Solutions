curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh




export PROJECT_ID=$(gcloud config get-value project)
export PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format='value(projectNumber)')
export REGION="${ZONE%-*}"
gcloud config set compute/region $REGION

gcloud services enable \
  cloudresourcemanager.googleapis.com \
  container.googleapis.com \
  artifactregistry.googleapis.com \
  containerregistry.googleapis.com \
  containerscanning.googleapis.com

sleep 10

git clone https://github.com/GoogleCloudPlatform/cloud-code-samples/
cd ~/cloud-code-samples


gcloud container clusters create container-dev-cluster --zone=$ZONE


gcloud artifacts repositories create container-dev-repo --repository-format=docker \
  --location=$REGION \
  --description="Docker repository for Container Dev Workshop"

gcloud auth configure-docker $REGION-docker.pkg.dev

cd ~/cloud-code-samples/java/java-hello-world

docker build -t europe-west4-docker.pkg.dev/qwiklabs-gcp-01-abd9f1f06a9b/container-dev-repo/java-hello-world:tag1 .

docker push europe-west4-docker.pkg.dev/qwiklabs-gcp-01-abd9f1f06a9b/container-dev-repo/java-hello-world:tag1


curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
