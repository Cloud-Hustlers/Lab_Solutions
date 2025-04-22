curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



gcloud config set compute/region $REGION

gsutil mb gs://$DEVSHELL_PROJECT_ID

curl https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Ada_Lovelace_portrait.jpg/800px-Ada_Lovelace_portrait.jpg --output ada.jpg

gsutil cp ada.jpg gs://$DEVSHELL_PROJECT_ID

gsutil cp -r gs://$DEVSHELL_PROJECT_ID/ada.jpg .

gsutil cp gs://$DEVSHELL_PROJECT_ID/ada.jpg gs://$DEVSHELL_PROJECT_ID/image-folder/

gsutil acl ch -u AllUsers:R gs://$DEVSHELL_PROJECT_ID/ada.jpg

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
