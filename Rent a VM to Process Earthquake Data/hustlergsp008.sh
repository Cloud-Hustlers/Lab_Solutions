curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


gcloud compute instances create instance-1 --project=$DEVSHELL_PROJECT_ID --zone=$ZONE --machine-type=e2-medium --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default --metadata=enable-oslogin=true --maintenance-policy=MIGRATE --provisioning-model=STANDARD --scopes=https://www.googleapis.com/auth/cloud-platform --create-disk=auto-delete=yes,boot=yes,device-name=instance-1,image=projects/debian-cloud/global/images/debian-10-buster-v20230809,mode=rw,size=10,type=projects/$DEVSHELL_PROJECT_ID/zones/$ZONE/diskTypes/pd-balanced --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --labels=goog-ec-src=vm_add-gcloud --reservation-affinity=any

sleep 10

gcloud storage buckets create gs://$DEVSHELL_PROJECT_ID \
  --location="${ZONE%-*}" \
  --default-storage-class=REGIONAL \
  --project=$DEVSHELL_PROJECT_ID



gcloud compute ssh --zone "$ZONE" "instance-1" --project "$DEVSHELL_PROJECT_ID" --quiet --command 'bash -c "$(curl -fsSL https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/master/Rent%20a%20VM%20to%20Process%20Earthquake%20Data/hustler.sh)"'




curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
