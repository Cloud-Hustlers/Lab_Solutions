curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


# 2nd Project ID

export REGION="${ZONE%-*}"

gsutil mb -p $DEVSHELL_PROJECT_ID -c STANDARD -l $REGION -b on gs://$DEVSHELL_PROJECT_ID-2

gsutil uniformbucketlevelaccess set off gs://$DEVSHELL_PROJECT_ID-2

echo "subscribe to hustler" > test.txt

gsutil cp test.txt gs://$DEVSHELL_PROJECT_ID-2




# Create the service account
gcloud iam service-accounts create cross-project-storage --display-name "Cross-Project Storage Account"

# Grant Storage Object Viewer role to the service account
gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID --member="serviceAccount:cross-project-storage@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com" --role="roles/storage.objectViewer"

gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID --member="serviceAccount:cross-project-storage@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com" --role="roles/storage.objectAdmin"

# Generate and download the JSON key file
gcloud iam service-accounts keys create credentials.json --iam-account=cross-project-storage@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
