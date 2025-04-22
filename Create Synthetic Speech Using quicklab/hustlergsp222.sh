curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



gcloud services enable texttospeech.googleapis.com --project=$DEVSHELL_PROJECT_ID

sudo apt-get install -y virtualenv

python3 -m venv venv

source venv/bin/activate


gcloud iam service-accounts create tts-qwiklab

export PROJECT_ID=$(gcloud config get-value project)

gcloud iam service-accounts keys create tts-qwiklab.json --iam-account tts-qwiklab@$PROJECT_ID.iam.gserviceaccount.com

export GOOGLE_APPLICATION_CREDENTIALS=tts-qwiklab.json




curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
