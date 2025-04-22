curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

bq --location=US mk --dataset $DEVSHELL_PROJECT_ID:sports

bq --location=US mk --dataset $DEVSHELL_PROJECT_ID:soccer

bq mk --table $DEVSHELL_PROJECT_ID:soccer.premiership

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
