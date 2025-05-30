curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
git clone https://github.com/GoogleCloudPlatform/training-data-analyst

cd training-data-analyst/blogs

PROJECT_ID=`gcloud config get-value project`
BUCKET=${PROJECT_ID}-bucket


gsutil mb -c multi_regional gs://${BUCKET}

gsutil -m cp -r endpointslambda gs://${BUCKET}

mv endpointslambda/Apache2_0License.txt endpointslambda/old.txt

rm endpointslambda/aeflex-endpoints/app.yaml

gsutil -m rsync -d -r endpointslambda gs://${BUCKET}/endpointslambda

gsutil -m acl set -R -a public-read gs://${BUCKET}

gsutil cp -s nearline ghcn/ghcn_on_bq.ipynb gs://${BUCKET}

gsutil ls -Lr gs://${BUCKET} | more

gsutil rm -rf gs://${BUCKET}/*

gsutil rb gs://${BUCKET}

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
