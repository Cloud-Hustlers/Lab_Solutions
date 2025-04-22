curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
gcloud config set compute/zone $ZONE

gcloud container clusters create awwvision \
    --num-nodes 2 \
    --scopes cloud-platform

gcloud container clusters get-credentials awwvision

kubectl cluster-info

sudo apt-get install -y virtualenv

python3 -m venv venv

source venv/bin/activate

gsutil -m cp -r gs://spls/gsp066/cloud-vision .

cd cloud-vision/python/awwvision

make all

kubectl get pods




curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
