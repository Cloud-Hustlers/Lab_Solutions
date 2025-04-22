curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



curl -LO https://github.com/Cloud-Hustlers/Lab_Solutions/blob/master/APIs%20Explorer%20Cloud%20Storage/demo-image1-copy.png
curl -LO https://github.com/Cloud-Hustlers/Lab_Solutions/blob/master/APIs%20Explorer%20Cloud%20Storage/demo-image1.png
curl -LO https://github.com/Cloud-Hustlers/Lab_Solutions/blob/master/APIs%20Explorer%20Cloud%20Storage/demo-image2.png


gcloud alpha services api-keys create --display-name="hustler"  
KEY_NAME=$(gcloud alpha services api-keys list --format="value(name)" --filter "displayName=hustler") 
export API_KEY=$(gcloud alpha services api-keys get-key-string $KEY_NAME --format="value(keyString)") 
echo $API_KEY

gsutil mb gs://$DEVSHELL_PROJECT_ID

gsutil mb gs://$DEVSHELL_PROJECT_ID-hustler

gsutil cp demo-image1.png gs://$DEVSHELL_PROJECT_ID

gsutil cp demo-image2.png gs://$DEVSHELL_PROJECT_ID

gsutil cp demo-image1-copy.png gs://$DEVSHELL_PROJECT_ID-hustler

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
