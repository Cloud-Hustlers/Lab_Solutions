curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


## ``` Now check the score for TASK 6 After that run the below commands 
SLOW_URL=$(gcloud functions describe slow-function --region $REGION --gen2 --format="value(serviceConfig.uri)")

hey -n 10 -c 10 $SLOW_URL


gcloud run services delete slow-function --region $REGION --quiet

gcloud functions deploy slow-concurrent-function \
  --gen2 \
  --runtime go116 \
  --entry-point HelloWorld \
  --source . \
  --region $REGION \
  --trigger-http \
  --allow-unauthenticated \
  --min-instances 1 \
  --max-instances 4 \
  --quiet



gcloud run deploy slow-concurrent-function \
--image=$REGION-docker.pkg.dev/$DEVSHELL_PROJECT_ID/gcf-artifacts/slow--concurrent--function:version_1 \
--concurrency=100 \
--cpu=1 \
--max-instances=4 \
--region=$REGION \
--project=$DEVSHELL_PROJECT_ID \
 && gcloud run services update-traffic slow-concurrent-function --to-latest --region=$REGION


curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
