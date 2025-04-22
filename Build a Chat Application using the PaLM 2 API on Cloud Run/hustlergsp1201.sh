curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



gsutil cp -R gs://spls/gsp1201/chat-flask-cloudrun .

cd chat-flask-cloudrun

export PROJECT_ID=$DEVSHELL_PROJECT_ID


export AR_REPO='chat-app-repo'
export SERVICE_NAME='chat-flask-app'

gcloud artifacts repositories create "$AR_REPO" --location="$REGION" --repository-format=Docker

gcloud builds submit --tag "$REGION-docker.pkg.dev/$PROJECT_ID/$AR_REPO/$SERVICE_NAME"

gcloud run deploy "$SERVICE_NAME" --port=8080 --image="$REGION-docker.pkg.dev/$PROJECT_ID/$AR_REPO/$SERVICE_NAME:latest" --allow-unauthenticated --region=$REGION --platform=managed --project=$PROJECT_ID --set-env-vars=GCP_PROJECT=$PROJECT_ID,GCP_REGION=$REGION

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
