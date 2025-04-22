curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


gcloud config set project $DEVSHELL_PROJECT_ID
gsutil mb gs://$DEVSHELL_PROJECT_ID-bucket
gsutil bucketpolicyonly set off gs://$DEVSHELL_PROJECT_ID-bucket
gsutil iam ch allUsers:objectViewer gs://$DEVSHELL_PROJECT_ID-bucket


wget https://github.com/Cloud-Hustlers/Lab_Solutions/blob/master/Use%20APIs%20to%20Work%20with%20Cloud%20Storage%20Challenge%20Lab/world.jpeg

mv world.jpeg demo-image.jpg

gsutil cp demo-image.jpg  gs://$DEVSHELL_PROJECT_ID-bucket

gsutil acl ch -u allUsers:R gs://$DEVSHELL_PROJECT_ID-bucket/demo-image.jpg

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
