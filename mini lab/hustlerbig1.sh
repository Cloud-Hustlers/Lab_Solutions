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
read -p "Enter BUCKET_NAME: " BUCKET_NAME


bq mk work_day

bq mk --table work_day.employee \
    employee_id:INTEGER,device_id:STRING,username:STRING,department:STRING,office:STRING

bq load --source_format=CSV --skip_leading_rows=1 work_day.employee gs://$BUCKET_NAME/employees.csv employee_id:INTEGER,device_id:STRING,username:STRING,department:STRING,office:STRING


curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
