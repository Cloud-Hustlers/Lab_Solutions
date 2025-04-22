curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



gcloud auth list 

gcloud services enable artifactregistry.googleapis.com \
    cloudbuild.googleapis.com \
    run.googleapis.com

git clone https://github.com/googlecodelabs/monolith-to-microservices.git
cd ~/monolith-to-microservices

./setup.sh

cd ~/monolith-to-microservices/monolith


gcloud artifacts repositories create monolith-demo \
    --repository-format=docker \
    --location=$REGION \
    --description="Subscribe to hustler" 


gcloud auth configure-docker  --quiet 

gcloud builds submit --tag $REGION-docker.pkg.dev/${GOOGLE_CLOUD_PROJECT}/monolith-demo/monolith:1.0.0

echo "Y" | gcloud run deploy monolith --image $REGION-docker.pkg.dev/${GOOGLE_CLOUD_PROJECT}/monolith-demo/monolith:1.0.0 --region $REGION

gcloud run deploy monolith --image $REGION-docker.pkg.dev/${GOOGLE_CLOUD_PROJECT}/monolith-demo/monolith:1.0.0 --region $REGION --concurrency 1

gcloud run deploy monolith --image $REGION-docker.pkg.dev/${GOOGLE_CLOUD_PROJECT}/monolith-demo/monolith:1.0.0 --region $REGION --concurrency 80


cd ~/monolith-to-microservices/react-app/src/pages/Home
mv index.js.new index.js

cat ~/monolith-to-microservices/react-app/src/pages/Home/index.js

cd ~/monolith-to-microservices/react-app
npm run build:monolith

cd ~/monolith-to-microservices/monolith
gcloud builds submit --tag $REGION-docker.pkg.dev/${GOOGLE_CLOUD_PROJECT}/monolith-demo/monolith:2.0.0

gcloud run deploy monolith --image $REGION-docker.pkg.dev/${GOOGLE_CLOUD_PROJECT}/monolith-demo/monolith:2.0.0 --region $REGION

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
