curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
gcloud config set compute/region $REGION
export PROJECT_ID=$(gcloud config get-value project)


git clone https://github.com/GoogleCloudPlatform/nodejs-docs-samples.git
cd nodejs-docs-samples/functions/v2/helloPubSub/

gcloud functions deploy cf-demo \
--gen2 \
--runtime=nodejs20 \
--region=$REGION \
--source=. \
--entry-point=helloPubSub \
--trigger-topic=cf_topic \
--quiet

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
