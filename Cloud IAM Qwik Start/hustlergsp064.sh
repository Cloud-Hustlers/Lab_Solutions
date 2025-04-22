curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh




gsutil mb -l us -b on gs://$DEVSHELL_PROJECT_ID


echo "subscribe to hustler " > sample.txt


gsutil cp sample.txt gs://$DEVSHELL_PROJECT_ID


gcloud projects remove-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member=user:$USERNAME_2 \
  --role=roles/viewer



gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member=user:$USERNAME_2 \
  --role=roles/storage.objectViewer

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
