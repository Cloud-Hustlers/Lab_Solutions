curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

LAKE_ID="sensors"
ZONE_ID="temperature-raw-data"
ASSET_ID="measurements"


# Detach (delete) the asset
gcloud dataplex assets delete $ASSET_ID --lake=$LAKE_ID --zone=$ZONE_ID --location=$REGION --quiet

# Delete the zone
gcloud dataplex zones delete $ZONE_ID --lake=$LAKE_ID --location=$REGION --quiet

# Delete the lake
gcloud dataplex lakes delete $LAKE_ID --location=$REGION --quiet

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
