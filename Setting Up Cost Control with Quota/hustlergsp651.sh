curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

bq query --use_legacy_sql=false \
"
SELECT
    w1mpro_ep,
    mjd,
    load_id,
    frame_id
FROM
    \`bigquery-public-data.wise_all_sky_data_release.mep_wise\`
ORDER BY
    mjd ASC
LIMIT 500
"


gcloud alpha services quota list --service=bigquery.googleapis.com --consumer=projects/${DEVSHELL_PROJECT_ID} --filter="usage"

gcloud alpha services quota update --consumer=projects/${DEVSHELL_PROJECT_ID} --service bigquery.googleapis.com --metric bigquery.googleapis.com/quota/query/usage --value 262144 --unit 1/d/{project}/{user} --force

gcloud alpha services quota list --service=bigquery.googleapis.com --consumer=projects/${DEVSHELL_PROJECT_ID} --filter="usage"

bq query --use_legacy_sql=false --nouse_cache \
"
 SELECT
     w1mpro_ep,
     mjd,
     load_id,
     frame_id
 FROM
     \`bigquery-public-data.wise_all_sky_data_release.mep_wise\`
 ORDER BY
     mjd ASC
 LIMIT 500
"


curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
