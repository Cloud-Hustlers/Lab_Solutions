curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

bq query --use_legacy_sql=false \
'
SELECT * FROM `thelook_gcda.products` WHERE brand IS NOT NULL limit 10;
'




bq query --use_legacy_sql=false \
'
SELECT * FROM `thelook_gcda.orders` limit 10;
'


bq query --use_legacy_sql=false \
'
SELECT * FROM `thelook_gcda.order_items` limit 10;
'


bq query --use_legacy_sql=false \
'
SELECT * FROM `ghcn_daily.ghcnd_1763` limit 10;
'


bq query --use_legacy_sql=false \
'
SELECT
 name AS product_name,
 id AS product_id
FROM
  thelook_gcda.products
LIMIT 10;
'

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
