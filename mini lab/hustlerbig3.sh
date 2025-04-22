curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
PROJECT_ID=`gcloud config get-value project`

bq ls --format=json $PROJECT_ID:Inventory



bq query --use_legacy_sql=false "
SELECT DISTINCT products.product_name, products.price
FROM \`$PROJECT_ID.Inventory.products\` AS products
INNER JOIN \`$PROJECT_ID.Inventory.category\` AS category
ON products.category_id = category.category_id
WHERE products.category_id = 1;"


bq query --use_legacy_sql=false "
CREATE VIEW \`$PROJECT_ID.Inventory.Product_View\` AS
SELECT DISTINCT products.product_name, products.price
FROM \`$PROJECT_ID.Inventory.products\` AS products
INNER JOIN \`$PROJECT_ID.Inventory.category\` AS category
ON products.category_id = category.category_id
WHERE products.category_id = 1;"

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
