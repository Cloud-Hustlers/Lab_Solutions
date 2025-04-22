curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


gcloud auth list 

sudo apt-get install -y virtualenv

python3 -m venv venv

source venv/bin/activate

pip install --upgrade google-cloud-pubsub

git clone https://github.com/googleapis/python-pubsub.git

cd python-pubsub/samples/snippets

python publisher.py -h

python publisher.py $GOOGLE_CLOUD_PROJECT create MyTopic

python subscriber.py $GOOGLE_CLOUD_PROJECT create MyTopic MySub


curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
