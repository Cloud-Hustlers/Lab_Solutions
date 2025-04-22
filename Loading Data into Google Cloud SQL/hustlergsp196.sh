curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



gcloud auth list

git clone \
   https://github.com/GoogleCloudPlatform/data-science-on-gcp/

cd data-science-on-gcp/03_sqlstudio

export PROJECT_ID=$(gcloud info --format='value(config.project)')
export BUCKET=${PROJECT_ID}-ml

gsutil cp create_table.sql \
    gs://$BUCKET/create_table.sql


gcloud sql instances create flights \
    --database-version=POSTGRES_13 --cpu=2 --memory=8GiB \
    --region=$REGION --root-password=Passw0rd

export ADDRESS=$(curl -s http://ipecho.net/plain)/32

gcloud sql instances patch flights --authorized-networks $ADDRESS --quiet



export INSTANCE_NAME=flights
export DATABASE_NAME=bts
export SQL_FILE=create_table.sql

# Create a database
gcloud sql databases create $DATABASE_NAME --instance=$INSTANCE_NAME


SERVICE_ACCOUNT_EMAIL=$(gcloud sql instances describe $INSTANCE_NAME --format='value(serviceAccountEmailAddress)')

gsutil iam ch serviceAccount:$SERVICE_ACCOUNT_EMAIL:roles/storage.objectViewer gs://$BUCKET


# Import the SQL file into the database
gcloud sql import sql $INSTANCE_NAME \
    gs://$BUCKET/$SQL_FILE \
    --database=$DATABASE_NAME \
    --quiet


curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
