curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

export PROJECT_NUMBER=$(gcloud projects describe $DEVSHELL_PROJECT_ID --format='value(projectNumber)')
export PROJECT_ID=$(gcloud info --format='value(config.project)')


gcloud services enable dialogflow.googleapis.com
gcloud services disable cloudfunctions.googleapis.com
gcloud services enable cloudfunctions.googleapis.com
gcloud services enable firestore.googleapis.com


gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member="serviceAccount:service-$PROJECT_NUMBER@gcf-admin-robot.iam.gserviceaccount.com" \
  --role="roles/artifactregistry.reader"


gcloud firestore databases create --location=nam5


# Print Firestore in yellow
echo -e "\033[1;33mFirestore\033[0m"

# Print the URL in blue and bold
echo -e "\033[1;34m(https://console.cloud.google.com/firestore/databases/-default-/data/panel)\033[0m"

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
