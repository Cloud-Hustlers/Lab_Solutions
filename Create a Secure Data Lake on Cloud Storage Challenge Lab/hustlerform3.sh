curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

echo ""
echo ""
echo "Please export the values."


# Prompt user to input three regions
read -p "Enter REGION: " REGION


#TASK 1
bq mk --location=US Raw_data

bq load --source_format=AVRO Raw_data.public-data gs://spls/gsp1145/users.avro


# TASK 2


gcloud dataplex zones create temperature-raw-data \
    --lake=public-lake \
    --location=$REGION \
    --type=RAW \
    --resource-location-type=SINGLE_REGION \
    --display-name="temperature-raw-data"

#TASK 3


gcloud dataplex assets create customer-details-dataset \
    --location=$REGION \
    --lake=public-lake \
    --zone=temperature-raw-data \
    --resource-type=BIGQUERY_DATASET \
    --resource-name=projects/$DEVSHELL_PROJECT_ID/datasets/customer_reference_data \
    --display-name="Customer Details Dataset" \
    --discovery-enabled  



curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
