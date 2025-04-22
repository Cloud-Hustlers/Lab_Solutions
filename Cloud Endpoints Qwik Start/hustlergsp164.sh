curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



gsutil cp gs://spls/gsp164/endpoints-quickstart.zip .
unzip endpoints-quickstart.zip

cd endpoints-quickstart

cd scripts

./deploy_api.sh

./deploy_app.sh

./query_api.sh

./query_api.sh JFK

./deploy_api.sh ../openapi_with_ratelimit.yaml

./deploy_app.sh

gcloud alpha services api-keys create --display-name="hustler"  
KEY_NAME=$(gcloud alpha services api-keys list --format="value(name)" --filter "displayName=hustler") 
export API_KEY=$(gcloud alpha services api-keys get-key-string $KEY_NAME --format="value(keyString)") 


./query_api_with_key.sh $API_KEY

timeout 15s ./generate_traffic_with_key.sh $API_KEY && ./query_api_with_key.sh $API_KEY


curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
