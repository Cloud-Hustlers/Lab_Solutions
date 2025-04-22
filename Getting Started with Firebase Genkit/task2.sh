curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
cd ~/genkit-intro
npx genkit flow:run menuSuggestionFlow '"French"' -s | tee -a output.txt

gcloud storage cp -r ~/genkit-intro/output.txt gs://$DEVSHELL_PROJECT_ID
gcloud storage cp -r ~/genkit-intro/src/index.ts gs://$DEVSHELL_PROJECT_ID

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
