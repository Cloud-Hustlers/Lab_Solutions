curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



export REGION=$(gcloud compute project-info describe \
--format="value(commonInstanceMetadata.items[google-compute-default-region])")

export ZONE=$(gcloud compute project-info describe \
--format="value(commonInstanceMetadata.items[google-compute-default-zone])")


PROJECT_ID=`gcloud config get-value project`

export PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format="value(projectNumber)")



gcloud compute instances create instance-1 \
  --project=$PROJECT_ID \
  --zone=$ZONE \
  --machine-type=n1-standard-1 \
  --image-family=debian-11 \
  --image-project=debian-cloud \
  --boot-disk-type=pd-standard \
  --boot-disk-device-name=instance-1



gcloud compute instances delete instance-1 \
  --project=$PROJECT_ID \
  --zone=$ZONE --quiet

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
