curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
echo ""
echo ""

read -p "Enter REGION: " REGION


export PROJECT_ID=$(gcloud projects list --format="value(PROJECT_ID)")


bq mk --connection \
    --connection_type='CLOUD_SPANNER' \
    --properties='{"database":"projects/'$PROJECT_ID'/instances/ecommerce-instance/databases/ecommerce"}' \
    --location=$REGION \
    my_connection_id


bq query --use_legacy_sql=false \
"
SELECT * FROM EXTERNAL_QUERY('$PROJECT_ID.$REGION.my_connection_id', 'SELECT * FROM orders;');
"

bq query --use_legacy_sql=false \
"
CREATE VIEW ecommerce.order_history AS SELECT * FROM EXTERNAL_QUERY('$PROJECT_ID.$REGION.my_connection_id', 'SELECT * FROM orders;');
"

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
