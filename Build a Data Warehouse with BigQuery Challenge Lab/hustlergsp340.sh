curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



export DATASET_NAME_1=covid
export DATASET_NAME_2=covid_data



bq mk --dataset $DEVSHELL_PROJECT_ID:covid

sleep 10

bq query --use_legacy_sql=false \
"
CREATE OR REPLACE TABLE $DATASET_NAME_1.oxford_policy_tracker
PARTITION BY date
OPTIONS(
partition_expiration_days=1445,
description='oxford_policy_tracker table in the COVID 19 Government Response public dataset with  an expiry time set to 90 days.'
) AS
SELECT
   *
FROM
   \`bigquery-public-data.covid19_govt_response.oxford_policy_tracker\`
WHERE
   alpha_3_code NOT IN ('GBR', 'BRA', 'CAN','USA')
"

#TASK 2

bq query --use_legacy_sql=false \
"
ALTER TABLE $DATASET_NAME_2.global_mobility_tracker_data
ADD COLUMN population INT64,
ADD COLUMN country_area FLOAT64,
ADD COLUMN mobility STRUCT<
   avg_retail      FLOAT64,
   avg_grocery     FLOAT64,
   avg_parks       FLOAT64,
   avg_transit     FLOAT64,
   avg_workplace   FLOAT64,
   avg_residential FLOAT64
>

"

#TASK 3

bq query --use_legacy_sql=false \
"
CREATE OR REPLACE TABLE $DATASET_NAME_2.pop_data_2019 AS
SELECT
  country_territory_code,
  pop_data_2019
FROM 
  \`bigquery-public-data.covid19_ecdc.covid_19_geographic_distribution_worldwide\`
GROUP BY
  country_territory_code,
  pop_data_2019
ORDER BY
  country_territory_code
"  



bq query --use_legacy_sql=false \
"
UPDATE
   \`$DATASET_NAME_2.consolidate_covid_tracker_data\` t0
SET
   population = t1.pop_data_2019
FROM
   \`$DATASET_NAME_2.pop_data_2019\` t1
WHERE
   CONCAT(t0.alpha_3_code) = CONCAT(t1.country_territory_code);
"   

#TASK 4

bq query --use_legacy_sql=false \
"
UPDATE
   \`$DATASET_NAME_2.consolidate_covid_tracker_data\` t0
SET
   t0.country_area = t1.country_area
FROM
   \`bigquery-public-data.census_bureau_international.country_names_area\` t1
WHERE
   t0.country_name = t1.country_name
"


# BONUS_TASK

bq query --use_legacy_sql=false \
"
 UPDATE
   \`$DATASET_NAME_2.consolidate_covid_tracker_data\` t0
SET
   t0.mobility.avg_retail      = t1.avg_retail,
   t0.mobility.avg_grocery     = t1.avg_grocery,
   t0.mobility.avg_parks       = t1.avg_parks,
   t0.mobility.avg_transit     = t1.avg_transit,
   t0.mobility.avg_workplace   = t1.avg_workplace,
   t0.mobility.avg_residential = t1.avg_residential
FROM
   ( SELECT country_region, date,
      AVG(retail_and_recreation_percent_change_from_baseline) as avg_retail,
      AVG(grocery_and_pharmacy_percent_change_from_baseline)  as avg_grocery,
      AVG(parks_percent_change_from_baseline) as avg_parks,
      AVG(transit_stations_percent_change_from_baseline) as avg_transit,
      AVG(workplaces_percent_change_from_baseline) as avg_workplace,
      AVG(residential_percent_change_from_baseline)  as avg_residential
      FROM \`bigquery-public-data.covid19_google_mobility.mobility_report\`
      GROUP BY country_region, date
   ) AS t1
WHERE
   CONCAT(t0.country_name, t0.date) = CONCAT(t1.country_region, t1.date)
"



bq query --use_legacy_sql=false \
"
SELECT DISTINCT country_name
FROM \`$DATASET_NAME_2.oxford_policy_tracker_worldwide\`
WHERE population is NULL
UNION ALL
SELECT DISTINCT country_name
FROM \`$DATASET_NAME_2.oxford_policy_tracker_worldwide\`
WHERE country_area IS NULL
ORDER BY country_name ASC
"





# Create a new table for country area data

bq query --use_legacy_sql=false \
"
CREATE TABLE $DATASET_NAME_2.country_area_data AS
SELECT *
FROM \`bigquery-public-data.census_bureau_international.country_names_area\`;
"


# Create a new table 'mobility_data' in the 'covid_data' dataset
bq query --use_legacy_sql=false \
"CREATE TABLE $DATASET_NAME_2.mobility_data AS
SELECT *
FROM \`bigquery-public-data.covid19_google_mobility.mobility_report\`"



# Delete Null population and country area data from oxford_policy_tracker_by_countries table

bq query --use_legacy_sql=false \
"DELETE FROM covid_data.oxford_policy_tracker_by_countries
WHERE population IS NULL AND country_area IS NULL"

bq query --use_legacy_sql=false \
"
DELETE FROM \`covid_data.oxford_policy_tracker_by_countries\`
WHERE 
    \`population\` IS NULL AND 
    \`country_area\` IS NULL
"


# Delete rows with NULL population
bq query --use_legacy_sql=false \
"DELETE FROM \`covid_data.oxford_policy_tracker_by_countries\` WHERE population IS NULL;"

# Delete rows with NULL country_area
bq query --use_legacy_sql=false \
"DELETE FROM \`covid_data.oxford_policy_tracker_by_countries\` WHERE country_area IS NULL;"



export DATASET_NAME_1=covid

bq query --use_legacy_sql=false \
"
CREATE OR REPLACE TABLE $DATASET_NAME_1.oxford_policy_tracker
PARTITION BY date
OPTIONS(
partition_expiration_days=1445,
description='oxford_policy_tracker table in the COVID 19 Government Response public dataset with  an expiry time set to 90 days.'
) AS
SELECT
   *
FROM
   \`bigquery-public-data.covid19_govt_response.oxford_policy_tracker\`
WHERE
   alpha_3_code NOT IN ('GBR', 'BRA', 'CAN','USA')
"

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
