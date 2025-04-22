curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

bq query --use_legacy_sql=false \
"SELECT
  *
FROM
  \`bigquery-public-data.new_york_citibike.citibike_stations\`
LIMIT
  10"



bq query --use_legacy_sql=false \
"SELECT
  ST_GeogPoint(longitude, latitude) AS WKT,
  num_bikes_available
FROM
  \`bigquery-public-data.new_york_citibike.citibike_stations\`
WHERE num_bikes_available > 30"

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
