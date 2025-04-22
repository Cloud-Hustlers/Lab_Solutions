curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


cat > token_policies.txt <<EOF_END
[
  "default",
  "jenkins"
]
EOF_END


export PROJECT_ID=$(gcloud config get-value project)
gsutil cp token_policies.txt gs://$PROJECT_ID

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
