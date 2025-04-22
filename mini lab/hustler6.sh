curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
export PROJECT_ID=$(gcloud projects list --format="value(PROJECT_ID)")

export BUCKET=$PROJECT_ID-bucket


cat > hustler.json <<EOF_END
[
  {
    "origin": ["http://example.com"],
    "method": ["GET"],
    "responseHeader": ["Content-Type"],
    "maxAgeSeconds": 3600
  }
]
EOF_END


gcloud storage buckets update gs://$BUCKET --cors-file=hustler.json

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
