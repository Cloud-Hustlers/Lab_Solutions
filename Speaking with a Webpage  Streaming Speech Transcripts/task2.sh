#!/bin/bash
curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
# Define color variables
YELLOW_TEXT=$'\033[0;33m'
MAGENTA_TEXT=$'\033[0;35m'
NO_COLOR=$'\033[0m'
GREEN_TEXT=$'\033[0;32m'
RED_TEXT=$'\033[0;31m'
CYAN_TEXT=$'\033[0;36m'
BOLD_TEXT=`tput bold`
RESET_FORMAT=`tput sgr0`
BLUE_TEXT=$'\033[0;34m'

echo

if [ -z "$ZONE" ]; then
  echo "${RED_TEXT}${BOLD_TEXT}Error: ZONE is not set.${RESET_FORMAT}"
  echo "${YELLOW_TEXT}Please enter the ZONE:${RESET_FORMAT}"
  read ZONE
  export ZONE
  echo "${GREEN_TEXT}The zone is set to: $ZONE${RESET_FORMAT}"
fi

if [ -z "$DEVSHELL_PROJECT_ID" ]; then
  echo "${RED_TEXT}${BOLD_TEXT}Error: DEVSHELL_PROJECT_ID is not set.${RESET_FORMAT}"
  echo "${YELLOW_TEXT}Please enter your GCP project ID:${RESET_FORMAT}"
  read DEVSHELL_PROJECT_ID
  export DEVSHELL_PROJECT_ID
  echo "${GREEN_TEXT}The project ID is set to: $DEVSHELL_PROJECT_ID${RESET_FORMAT}"
fi

echo
echo "${BLUE_TEXT}${BOLD_TEXT}Stopping any running Jetty server on the VM instance...${RESET_FORMAT}"
gcloud compute ssh "speaking-with-a-webpage" --zone "$ZONE" --project "$DEVSHELL_PROJECT_ID" --quiet --command "pkill -f 'java.*jetty'"

sleep 5

echo
echo "${BLUE_TEXT}${BOLD_TEXT}Starting the WebAudio application on the VM instance...${RESET_FORMAT}"
gcloud compute ssh "speaking-with-a-webpage" --zone "$ZONE" --project "$DEVSHELL_PROJECT_ID" --quiet --command "cd ~/speaking-with-a-webpage/02-webaudio && mvn clean jetty:run"

echo
echo "${GREEN_TEXT}${BOLD_TEXT}The WebAudio application is now running!${RESET_FORMAT}"


# # Safely delete the script if it exists
# SCRIPT_NAME="arcadecrew.sh"
# if [ -f "$SCRIPT_NAME" ]; then
#     echo -e "${BOLD_TEXT}${RED_TEXT}Deleting the script ($SCRIPT_NAME) for safety purposes...${RESET_FORMAT}${NO_COLOR}"
#     rm -- "$SCRIPT_NAME"
# fi

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
