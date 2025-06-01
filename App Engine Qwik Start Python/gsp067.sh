curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
gcloud auth list
gcloud services enable appengine.googleapis.com

git clone https://github.com/GoogleCloudPlatform/python-docs-samples.git

cd python-docs-samples/appengine/standard_python3/hello_world

sudo apt install python3 -y
sudo apt install python3.11-venv -y
python3 -m venv create myvenv
source myvenv/bin/activate


sed -i '32c\    return "Hello, Cruel World!"' main.py

sleep 30

gcloud app create --region=$REGION

gcloud app deploy --quiet

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
