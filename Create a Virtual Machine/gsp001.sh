#!/bin/bash
# Define color variables

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

# Array of color codes excluding black and white
TEXT_COLORS=($RED $GREEN $YELLOW $BLUE $MAGENTA $CYAN)
BG_COLORS=($BG_RED $BG_GREEN $BG_YELLOW $BG_BLUE $BG_MAGENTA $BG_CYAN)

# Pick random colors
RANDOM_TEXT_COLOR=${TEXT_COLORS[$RANDOM % ${#TEXT_COLORS[@]}]}
RANDOM_BG_COLOR=${BG_COLORS[$RANDOM % ${#BG_COLORS[@]}]}



curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



echo "${RANDOM_BG_COLOR}${RANDOM_TEXT_COLOR}${BOLD}Starting Execution${RESET}"

# Step 1: Set Compute Zone
echo "${BOLD}${BLUE}Setting Compute Zone${RESET}"
export ZONE=$(gcloud compute project-info describe \
--format="value(commonInstanceMetadata.items[google-compute-default-zone])")

# Step 2: Get Project ID
echo "${BOLD}${MAGENTA}Fetching Project ID${RESET}"
export PROJECT_ID=$(gcloud config get-value project)

# Step 3: Get Project Number
echo "${BOLD}${GREEN}Retrieving Project Number${RESET}"
export PROJECT_NUMBER=$(gcloud projects describe ${PROJECT_ID} \
    --format="value(projectNumber)")

# Step 4: Create VM Instance `gcelab`
echo "${BOLD}${YELLOW}Creating VM Instance 'gcelab'${RESET}"
gcloud compute instances create gcelab \
    --project=$DEVSHELL_PROJECT_ID \
    --zone=$ZONE \
    --machine-type=e2-medium \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
    --metadata=enable-oslogin=true \
    --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --service-account=$PROJECT_NUMBER-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/trace.append \
    --tags=http-server \
    --create-disk=auto-delete=yes,boot=yes,device-name=gcelab,image=projects/debian-cloud/global/images/debian-11-bullseye-v20241009,mode=rw,size=10,type=pd-balanced \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ec-src=vm_add-gcloud \
    --reservation-affinity=any

# Step 5: Create second instance `gcelab2`
echo "${BOLD}${RED}Creating second VM 'gcelab2'${RESET}"
gcloud compute instances create gcelab2 --machine-type e2-medium --zone=$ZONE

# Step 6: Install and verify nginx on gcelab
echo "${BOLD}${CYAN}Installing NGINX and verifying process${RESET}"
gcloud compute ssh --zone "$ZONE" "gcelab" --project "$DEVSHELL_PROJECT_ID" --quiet --command "sudo apt-get update && sudo apt-get install -y nginx && ps auwx | grep nginx "

# Step 7: Create firewall rule for HTTP access
echo "${BOLD}${MAGENTA}Creating firewall rule to allow HTTP traffic${RESET}"
gcloud compute firewall-rules create allow-http --network=default --allow=tcp:80 --target-tags=allow-http


curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
