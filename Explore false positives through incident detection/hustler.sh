curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



echo ""
echo ""

read -p "ENTER STUDENT2:- " STUDENT2

gcloud iam service-accounts create test-account \
  --description="Test account for project management" \
  --display-name="Test Account"


gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member="serviceAccount:test-account@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com" \
  --role="roles/owner"


gcloud iam service-accounts keys create ~/test-account.json \
    --iam-account="test-account@$DEVSHELL_PROJECT_ID.iam.gserviceaccount.com"


export PROJECT_ID=$(gcloud info --format='value(config.project)')
export SA_NAME="test-account@${PROJECT_ID}.iam.gserviceaccount.com"
gcloud auth activate-service-account ${SA_NAME} --key-file=test-account.json

gcloud projects add-iam-policy-binding $PROJECT_ID --member user:$STUDENT2 --role roles/editor




curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
