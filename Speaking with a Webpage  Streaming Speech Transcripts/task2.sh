curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



gcloud compute ssh "speaking-with-a-webpage" --zone "$ZONE" --project "$DEVSHELL_PROJECT_ID" --quiet --command "pkill -f 'java.*jetty'"

sleep 5

gcloud compute ssh "speaking-with-a-webpage" --zone "$ZONE" --project "$DEVSHELL_PROJECT_ID" --quiet --command "cd ~/speaking-with-a-webpage/02-webaudio && mvn clean jetty:run"

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
