curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

export BMSPROJ=$PROJECT_ID_1

export BASTIONPROJ=$PROJECT_ID_2

gcloud config set project $BASTIONPROJ

gcloud compute networks peerings create bms-peer-bastion --network bms-bastion-net --peer-network bms-db-net --peer-project $BMSPROJ

gcloud config set project $BMSPROJ

gcloud compute networks peerings create bms-peer-db --network  bms-db-net --peer-network bms-bastion-net --peer-project $BASTIONPROJ



curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
