curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
gcloud auth list
git clone https://github.com/googlecodelabs/user-authentication-with-iap.git
cd user-authentication-with-iap

cd 1-HelloWorld

gcloud app create --project=$(gcloud config get-value project) --region=$REGION

sed -i "15c\runtime: python38" app.yaml
sleep 30
gcloud app deploy --quiet

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
