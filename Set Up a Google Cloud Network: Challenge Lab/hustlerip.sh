curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
export ZONE="$(gcloud compute instances list --project=$DEVSHELL_PROJECT_ID --format='value(ZONE)')"
export INT_IP=$(gcloud compute instances describe antern-postgresql-vm --zone=$ZONE \
  --format='get(networkInterfaces[0].networkIP)')
echo -e "\033[1;34mVM Internal IP:\033[0m \033[1;33m$INT_IP\033[0m"

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
