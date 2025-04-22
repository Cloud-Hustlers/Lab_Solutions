curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


export PROJECT=$(gcloud projects list --format="value(PROJECT_ID)")

gcloud storage buckets update gs://$PROJECT-bucket --no-uniform-bucket-level-access

gcloud storage buckets update gs://$PROJECT-bucket --web-main-page-suffix=index.html --web-error-page=error.html

gcloud storage objects update gs://$PROJECT-bucket/index.html --add-acl-grant=entity=AllUsers,role=READER

gcloud storage objects update gs://$PROJECT-bucket/error.html --add-acl-grant=entity=AllUsers,role=READER

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
