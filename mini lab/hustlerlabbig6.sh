curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
PROJECT_ID=$(gcloud config get-value project)
REGION="us"

bq query \
--use_legacy_sql=false \
--destination_table=ecommerce.backup_orders \
--display_name='My Scheduled Query' \
--schedule='1 of month 00:00' \
--replace=true \
'CREATE OR REPLACE TABLE ecommerce.backup_orders AS
SELECT * FROM ecommerce.customer_orders;'


bq mk --transfer_config \
  --project_id=$PROJECT_ID \
  --data_source=scheduled_query \
  --target_dataset=ecommerce \
  --display_name="Monthly Backup of Customer Orders" \
  --schedule="1 of month 00:00" \
  --params='{"query":"SELECT * FROM `'${PROJECT_ID}'.ecommerce.customer_orders`", "destination_table_name_template":"backup_orders", "write_disposition":"WRITE_TRUNCATE"}'

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
