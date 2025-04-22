curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
bq mk --dataset --project_id=$DEVSHELL_PROJECT_ID gke_app_errors_sink

gcloud logging sinks create $SINK_NAME --project=$DEVSHELL_PROJECT_ID bigquery.googleapis.com/projects/$DEVSHELL_PROJECT_ID/datasets/gke_app_errors_sink --log-filter='resource.type=resource.labels.container_name;
severity=ERROR'

gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member=user:$USER1 \
  --role=roles/bigquery.dataViewer

gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
  --member=user:$USER2 \
  --role=roles/bigquery.admin

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
