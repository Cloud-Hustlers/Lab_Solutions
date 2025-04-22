curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



echo project = `gcloud config get-value project` \
    >> ~/.cbtrc

echo instance = sandiego \
    >> ~/.cbtrc

cbt createtable current_conditions \
    families="lane"

cat > prepare_disk.sh <<'EOF_END'
git clone https://github.com/GoogleCloudPlatform/training-data-analyst
source /training/project_env.sh
/training/sensor_magic.sh
EOF_END

ZONE="$(gcloud compute instances list --project=$DEVSHELL_PROJECT_ID --format='value(ZONE)' | head -n 1)"

gcloud compute scp prepare_disk.sh training-vm:/tmp --project=$DEVSHELL_PROJECT_ID --zone=$ZONE --quiet

gcloud compute ssh training-vm --project=$DEVSHELL_PROJECT_ID --zone=$ZONE --quiet --command="bash /tmp/prepare_disk.sh"








curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
