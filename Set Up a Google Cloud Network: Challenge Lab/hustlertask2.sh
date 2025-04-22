curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member=user:$USER1 \
  --role=roles/cloudsql.instanceUser

gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member=user:$USER2 \
  --role=roles/cloudsql.admin


gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member=user:$USER2 \
  --role=roles/compute.networkAdmin

gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member=user:$USER2 \
  --role=roles/compute.securityAdmin

gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member=user:$USER2 \
  --role=roles/logging.admin


# Remove Viewer role
gcloud projects remove-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member=user:$USER3 \
  --role=roles/viewer

# Add Editor role
gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member=user:$USER3 \
  --role=roles/editor

gcloud projects remove-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member=user:$USER3 \
  --role=roles/editor

gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member=user:$USER3 \
  --role=roles/viewer

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
