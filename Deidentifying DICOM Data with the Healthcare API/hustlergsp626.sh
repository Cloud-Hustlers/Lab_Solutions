curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



gcloud services enable compute.googleapis.com container.googleapis.com dataflow.googleapis.com bigquery.googleapis.com pubsub.googleapis.com healthcare.googleapis.com

gcloud healthcare datasets create dataset1 --location=${REGION}

sleep 40

export PROJECT_ID=$(gcloud config list --format 'value(core.project)')
export PROJECT_NUMBER=$(gcloud projects list --filter=projectId:$PROJECT_ID --format="value(projectNumber)")
gcloud projects add-iam-policy-binding $PROJECT_ID --member=serviceAccount:service-$PROJECT_NUMBER@gcp-sa-healthcare.iam.gserviceaccount.com --role=roles/bigquery.admin
gcloud projects add-iam-policy-binding $PROJECT_ID \
--member=serviceAccount:service-$PROJECT_NUMBER@gcp-sa-healthcare.iam.gserviceaccount.com \
--role=roles/storage.objectAdmin
gcloud projects add-iam-policy-binding $PROJECT_ID \
--member=serviceAccount:service-$PROJECT_NUMBER@gcp-sa-healthcare.iam.gserviceaccount.com \
--role=roles/healthcare.datasetAdmin
gcloud projects add-iam-policy-binding $PROJECT_ID \
--member=serviceAccount:service-$PROJECT_NUMBER@gcp-sa-healthcare.iam.gserviceaccount.com \
--role=roles/healthcare.dicomStoreAdmin

gcloud projects add-iam-policy-binding $PROJECT_ID \
--member=serviceAccount:service-$PROJECT_NUMBER@gcp-sa-healthcare.iam.gserviceaccount.com \
--role=roles/storage.objectCreator


# Enable Data Read and Data Write audit logs for the Cloud Healthcare API
gcloud projects get-iam-policy $PROJECT_ID > policy.yaml

# Edit the policy.yaml to include audit configs for Cloud Healthcare
cat <<EOF >> policy.yaml
auditConfigs:
- auditLogConfigs:
  - logType: DATA_READ
  - logType: DATA_WRITE
  service: healthcare.googleapis.com
EOF

gcloud projects set-iam-policy $PROJECT_ID policy.yaml


gcloud beta healthcare dicom-stores create $DICOM_STORE_ID --dataset=$DATASET_ID --location=$REGION

curl -X POST \
     -H "Authorization: Bearer "$(sudo gcloud auth print-access-token) \
     -H "Content-Type: application/json; charset=utf-8" \
"https://healthcare.googleapis.com/v1beta1/projects/$PROJECT_ID/locations/$REGION/datasets/$DATASET_ID/dicomStores?dicomStoreId=dicomstore2"

sleep 10

gcloud beta healthcare dicom-stores import gcs $DICOM_STORE_ID --dataset=$DATASET_ID --location=$REGION --gcs-uri=gs://spls/gsp626/LungCT-Diagnosis/R_004/*


curl -X POST \
    -H "Authorization: Bearer "$(gcloud auth print-access-token) \
    -H "Content-Type: application/json; charset=utf-8" \
    --data "{
      'destinationDataset': 'projects/$PROJECT_ID/locations/$REGION/datasets/de-id',
      'config': {
        'dicom': {
          'filterProfile': 'ATTRIBUTE_CONFIDENTIALITY_BASIC_PROFILE'
        },
        'image': {
          'textRedactionMode': 'REDACT_NO_TEXT'
        }
      }
    }" "https://healthcare.googleapis.com/v1beta1/projects/$PROJECT_ID/locations/$REGION/datasets/$DATASET_ID:deidentify"


curl -X GET \
"https://healthcare.googleapis.com/v1beta1/projects/$PROJECT_ID/locations/$REGION/datasets/$DATASET_ID/operations/<operation-id>" \
-H "Authorization: Bearer "$(sudo gcloud auth print-access-token) \
-H 'Content-Type: application/json; charset=utf-8'



export BUCKET_ID="gs://$DEVSHELL_PROJECT_ID"
gsutil mb $BUCKET_ID



# Replace YOUR_PROJECT_NUMBER with your actual project number
SERVICE_ACCOUNT="service-$PROJECT_NUMBER@gcp-sa-healthcare.iam.gserviceaccount.com"

# Grant the Storage Object Creator role to the service account
gsutil iam ch serviceAccount:$SERVICE_ACCOUNT:roles/storage.objectCreator gs://$DEVSHELL_PROJECT_ID


gcloud beta healthcare dicom-stores export gcs $DICOM_STORE_ID --dataset=$DATASET_ID --gcs-uri-prefix=$BUCKET_ID --mime-type="image/jpeg; transfer-syntax=1.2.840.10008.1.2.4.50" --location=$REGION

gcloud beta healthcare dicom-stores export gcs $DICOM_STORE_ID --dataset=$DATASET_ID --gcs-uri-prefix=$BUCKET_ID --mime-type="image/png" --location=$REGION

gcloud beta healthcare dicom-stores import gcs $DICOM_STORE_ID --dataset=$DATASET_ID --location=$REGION --gcs-uri=gs://spls/gsp626/LungCT-Diagnosis/R_004/*

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
