curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh




export REGION="${ZONE%-*}"



gcloud compute addresses create mc-server-ip --region=$REGION

ADDRESS=$(gcloud compute addresses describe mc-server-ip --region=$REGION --format='value(address)')

gcloud compute instances create mc-server --project=$DEVSHELL_PROJECT_ID --zone=$ZONE --machine-type=e2-medium --network-interface=address=$ADDRESS,network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default --metadata=enable-oslogin=true --maintenance-policy=MIGRATE --provisioning-model=STANDARD --scopes=https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/trace.append,https://www.googleapis.com/auth/devstorage.read_write --tags=minecraft-server --create-disk=auto-delete=yes,boot=yes,device-name=mc-server,image=projects/debian-cloud/global/images/debian-11-bullseye-v20240110,mode=rw,size=10,type=projects/$DEVSHELL_PROJECT_ID/zones/$ZONE/diskTypes/pd-balanced --create-disk=device-name=minecraft-disk,mode=rw,name=minecraft-disk,size=50,type=projects/$DEVSHELL_PROJECT_ID/zones/$ZONE/diskTypes/pd-ssd --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --labels=goog-ec-src=vm_add-gcloud --reservation-affinity=any

gcloud compute --project=$DEVSHELL_PROJECT_ID firewall-rules create minecraft-rule --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:25565 --source-ranges=0.0.0.0/0 --target-tags=minecraft-server


gcloud compute instances add-metadata mc-server \
    --metadata project-id=$DEVSHELL_PROJECT_ID \
    --zone=$ZONE


cat > prepare_disk.sh <<'EOF_END'

# Create directory
sudo mkdir -p /home/minecraft

# Format the disk
sudo mkfs.ext4 -F -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/disk/by-id/google-minecraft-disk

# Mount the disk
sudo mount -o discard,defaults /dev/disk/by-id/google-minecraft-disk /home/minecraft

sudo apt-get update

sudo apt-get install -y default-jre-headless

cd /home/minecraft

sudo apt-get install wget -y

sudo wget https://launcher.mojang.com/v1/objects/d0d0fe2b1dc6ab4c65554cb734270872b72dadd6/server.jar

sudo java -Xmx1024M -Xms1024M -jar server.jar nogui

echo "eula=true" | sudo tee eula.txt

sudo apt-get install -y screen

sudo timeout 120s java -Xmx1024M -Xms1024M -jar server.jar nogui


PROJECT_ID=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/project/project-id)
echo "Project ID: $PROJECT_ID"
export YOUR_BUCKET_NAME=$PROJECT_ID
echo $YOUR_BUCKET_NAME
gcloud storage buckets create gs://$YOUR_BUCKET_NAME-minecraft-backup
echo YOUR_BUCKET_NAME=$YOUR_BUCKET_NAME >> ~/.profile
sudo curl https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/master/Working%20with%20Virtual%20Machines/backup.sh --output backup.sh
sudo chmod 755 /home/minecraft/backup.sh
. /home/minecraft/backup.sh
EOF_END

gcloud compute scp prepare_disk.sh mc-server:/tmp --project=$DEVSHELL_PROJECT_ID --zone=$ZONE --quiet

gcloud compute ssh mc-server --project=$DEVSHELL_PROJECT_ID --zone=$ZONE --quiet --command="bash /tmp/prepare_disk.sh"



gcloud compute instances add-metadata mc-server \
    --metadata project-id=$DEVSHELL_PROJECT_ID,startup-script-url=https://storage.googleapis.com/cloud-training/archinfra/mcserver/startup.sh,shutdown-script-url=https://storage.googleapis.com/cloud-training/archinfra/mcserver/shutdown.sh \
    --zone=$ZONE








curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
