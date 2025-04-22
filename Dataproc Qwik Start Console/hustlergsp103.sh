curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


export REGION="${ZONE%-*}"

export PROJECT_NUMBER="$(gcloud projects describe $DEVSHELL_PROJECT_ID --format='get(projectNumber)')"



gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
    --member serviceAccount:$PROJECT_NUMBER-compute@developer.gserviceaccount.com \
    --role roles/storage.objectAdmin

gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
    --member serviceAccount:$PROJECT_NUMBER-compute@developer.gserviceaccount.com \
    --role roles/dataproc.worker


gcloud compute networks subnets update default \
    --region $REGION \
    --enable-private-ip-google-access


gcloud dataproc clusters create example-cluster --region $REGION --zone $ZONE --master-machine-type e2-standard-2 --master-boot-disk-type pd-balanced --master-boot-disk-size 30 --num-workers 2 --worker-machine-type e2-standard-2 --worker-boot-disk-type pd-balanced --worker-boot-disk-size 30 --image-version 2.2-debian12 --project $DEVSHELL_PROJECT_ID


gcloud dataproc jobs submit spark \
    --cluster example-cluster \
    --region $REGION \
    --class org.apache.spark.examples.SparkPi \
    --jars file:///usr/lib/spark/examples/jars/spark-examples.jar \
    -- 1000



gcloud dataproc clusters update example-cluster \
    --region $REGION \
    --num-workers 4

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
