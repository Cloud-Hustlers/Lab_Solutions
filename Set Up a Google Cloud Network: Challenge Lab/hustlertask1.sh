curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
gcloud services enable datamigration.googleapis.com
gcloud services enable servicenetworking.googleapis.com

export ZONE="$(gcloud compute instances list --project=$DEVSHELL_PROJECT_ID --format='value(ZONE)')"
export PROJECT_ID=$DEVSHELL_PROJECT_ID
gcloud compute ssh --zone "$ZONE" "antern-postgresql-vm" --project "$DEVSHELL_PROJECT_ID" --quiet

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
