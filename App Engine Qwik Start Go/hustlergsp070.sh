curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
gcloud auth list
gcloud services enable appengine.googleapis.com

git clone https://github.com/GoogleCloudPlatform/golang-samples.git

cd golang-samples/appengine/go11x/helloworld

sudo apt-get install google-cloud-sdk-app-engine-go

sleep 30

gcloud app create --region=$REGION

gcloud app deploy --quiet

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
