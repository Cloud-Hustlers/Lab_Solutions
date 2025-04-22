curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
#TASK 2

ZONE=$(gcloud compute instances list --format="value(ZONE)" | tail -n 2 | head -n 1)


gcloud compute networks peerings create peering-1-2 \
  --network=mynetwork \
  --peer-network=privatenet \
  --auto-create-routes


gcloud compute networks peerings create peering-2-1 \
  --network=privatenet \
  --peer-network=mynetwork \
  --auto-create-routes

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
