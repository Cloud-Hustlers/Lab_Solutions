curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
mkdir ~/genkit-intro/data

cat <<EOF > ~/genkit-intro/data/questions.json
[
  {
    "input": {
        "question": "What's on the menu today?"
    }
  },
  {
    "input": {
        "question": "Are there any burgers in the menu today?"
    }
  }
]
EOF


cd ~/genkit-intro
npx genkit eval:flow ragMenuQuestion --input data/questions.json --output application_result.json

gcloud storage cp -r ~/genkit-intro/data gs://$DEVSHELL_PROJECT_ID
gcloud storage cp ~/genkit-intro/application_result.json gs://$DEVSHELL_PROJECT_ID
gcloud storage cp ~/genkit-intro/src/index.ts gs://$DEVSHELL_PROJECT_ID

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
