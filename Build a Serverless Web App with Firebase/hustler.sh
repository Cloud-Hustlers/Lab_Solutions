curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

git clone https://github.com/rosera/pet-theory.git

cd pet-theory/lab02/

npm i && npm audit fix --force

gcloud firestore databases create --location=$REGION

echo "https://console.cloud.google.com/firebase?referrer=search&project=$DEVSHELL_PROJECT_ID"

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
