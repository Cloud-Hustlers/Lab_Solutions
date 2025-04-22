curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
echo "Listing all Dataflow jobs:"
gcloud dataflow jobs list


export JOB_ID=$(gcloud dataflow jobs list | grep JOB_ID: | awk '{print $2}')

gcloud dataflow jobs cancel $JOB_ID

cbt deletetable current_conditions

echo -e "\e[1m\e[34mhttps://console.cloud.google.com/dataflow/jobs?referrer=search&project=$DEVSHELL_PROJECT_ID\e[0m"

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
