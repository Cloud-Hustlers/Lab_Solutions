curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



gcloud compute networks create staging --subnet-mode=custom --project=$DEVSHELL_PROJECT_ID

gcloud compute networks create development --project=$DEVSHELL_PROJECT_ID

gcloud compute networks subnets create dev-1 \
    --network=development \
    --region=$REGION \
    --range=10.1.0.0/24 \
    --project=$DEVSHELL_PROJECT_ID






curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
