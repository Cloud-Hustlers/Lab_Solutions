curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh




export REGION="${ZONE%-*}"


gcloud composer environments create composer-advanced-lab \
  --location=$REGION \
  --image-version=composer-1.20.12-airflow-2.4.3 \
  --zone=$ZONE \
  --python-version=3


gsutil mb -l us gs://$DEVSHELL_PROJECT_ID-hustler-us

gsutil mb -l eu gs://$DEVSHELL_PROJECT_ID-hustler-eu

bq mk --dataset_id=nyc_tlc_EU --location=EU

sudo apt-get install -y virtualenv

python3 -m venv venv

source venv/bin/activate

DAGS_BUCKET=$(gcloud alpha storage buckets list --filter="name:$REGION" --format="value(name)")

gcloud composer environments run composer-advanced-lab \
--location us-east1 variables -- \
set table_list_file_path /home/airflow/gcs/dags/bq_copy_eu_to_us_sample.csv
gcloud composer environments run composer-advanced-lab \
--location us-east1 variables -- \
set gcs_source_bucket $DEVSHELL_PROJECT_ID-hustler-us
gcloud composer environments run composer-advanced-lab \
--location us-east1 variables -- \
set gcs_dest_bucket $DEVSHELL_PROJECT_ID-hustler-us

cd ~
gsutil -m cp -r gs://spls/gsp283/python-docs-samples .

gsutil cp -r python-docs-samples/third_party/apache-airflow/plugins/* gs://$DAGS_BUCKET/plugins

gsutil cp python-docs-samples/composer/workflows/bq_copy_across_locations.py gs://$DAGS_BUCKET/dags
gsutil cp python-docs-samples/composer/workflows/bq_copy_eu_to_us_sample.csv gs://$DAGS_BUCKET/dags

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
