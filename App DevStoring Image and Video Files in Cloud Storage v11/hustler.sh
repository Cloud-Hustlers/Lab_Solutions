curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
gcloud auth list

git clone https://github.com/GoogleCloudPlatform/training-data-analyst

cd ~/training-data-analyst/courses/developingapps/nodejs/cloudstorage/start

. prepare_environment.sh

gsutil mb gs://$DEVSHELL_PROJECT_ID-media

export GCLOUD_BUCKET=$DEVSHELL_PROJECT_ID-media

cd ~/training-data-analyst/courses/developingapps/nodejs/cloudstorage/start/server/gcp

rm cloudstorage.js

##uploading files here

wget https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/master/App%20DevStoring%20Image%20and%20Video%20Files%20in%20Cloud%20Storage%20v11/cloudstorage.js

npm start

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
