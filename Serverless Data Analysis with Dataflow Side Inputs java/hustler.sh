curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

gcloud services disable  dataflow.googleapis.com

gcloud services enable  dataflow.googleapis.com

sleep 30


git clone https://github.com/GoogleCloudPlatform/training-data-analyst

gsutil mb gs://$DEVSHELL_PROJECT_ID

export BUCKET=$DEVSHELL_PROJECT_ID

cd ~/training-data-analyst/courses/data_analysis/lab2/javahelp
./run_oncloud3.sh $DEVSHELL_PROJECT_ID $BUCKET JavaProjectsThatNeedHelp


curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
