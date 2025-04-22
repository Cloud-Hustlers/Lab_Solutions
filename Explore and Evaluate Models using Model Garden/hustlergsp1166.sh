curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' 

echo -e "${GREEN}Open text-bison in Google Cloud Console:${NC}"
echo "   https://console.cloud.google.com/vertex-ai/publishers/google/model-garden/text-bison?project=$DEVSHELL_PROJECT_ID"
echo " "

echo "-----------------------------------------------"
echo " "

echo -e "${BLUE}Open owlvit-base-patch32 in Google Cloud Console:${NC}"
echo "   https://console.cloud.google.com/vertex-ai/publishers/google/model-garden/owlvit-base-patch32?project=$DEVSHELL_PROJECT_ID"
echo " "

echo "-----------------------------------------------"
echo " "

echo -e "${GREEN}Open bert-base in Google Cloud Console:${NC}"
echo "   https://console.cloud.google.com/vertex-ai/publishers/google/model-garden/bert-base?project=$DEVSHELL_PROJECT_ID"

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
