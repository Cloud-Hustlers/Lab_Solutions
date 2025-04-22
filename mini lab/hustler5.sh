curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
export PROJECT=$(gcloud projects list --format="value(PROJECT_ID)")

gsutil iam get gs://$PROJECT-urgent

gsutil iam ch -d allUsers gs://$PROJECT-urgent
gsutil iam ch -d allAuthenticatedUsers gs://$PROJECT-urgent

gsutil iam get gs://$PROJECT-urgent

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
