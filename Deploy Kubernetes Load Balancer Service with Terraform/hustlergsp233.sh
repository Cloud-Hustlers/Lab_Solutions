curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

export REGION="${ZONE%-*}"

gsutil -m cp -r gs://spls/gsp233/* .

cd tf-gke-k8s-service-lb

terraform init

terraform apply -var="region=$REGION" -var="location=$ZONE" --auto-approve



curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
