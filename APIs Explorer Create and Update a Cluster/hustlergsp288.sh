curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


echo ""
echo ""

read -p "Enter ZONE: " ZONE

export REGION="${ZONE%-*}"

gcloud services enable dataproc.googleapis.com

gcloud dataproc clusters create my-cluster \
    --region=$REGION \
    --zone=$ZONE \
    --image-version=2.0-debian10 \
    --optional-components=JUPYTER \
    --project=$DEVSHELL_PROJECT_ID

gcloud dataproc jobs submit spark \
    --cluster=my-cluster \
    --region=$REGION \
    --jars=file:///usr/lib/spark/examples/jars/spark-examples.jar \
    --class=org.apache.spark.examples.SparkPi \
    --project=$DEVSHELL_PROJECT_ID \
    -- \
    1000

gcloud dataproc clusters update my-cluster \
    --region=$REGION \
    --num-workers=3 \
    --project=$DEVSHELL_PROJECT_ID

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
