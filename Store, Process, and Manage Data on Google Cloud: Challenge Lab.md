![API Gateway Banner](https://raw.githubusercontent.com/Cloud-Hustlers/content/f9a8642976ea21cd234c91239431e41f05264842/gif/12.gif)

<div align="center">
  
# Connect with Cloud Hustlers Community
</div>

<p align="center">
  <a href="https://whatsapp.cloudhustlers.in" target="_blank">
    <img src="https://raw.githubusercontent.com/Cloud-Hustlers/content/main/gif/whatsapp.gif" alt="WhatsApp" width="80">
  </a>
  <a href="https://in.linkedin.com/company/cloud-hustlers" target="_blank">
    <img src="https://raw.githubusercontent.com/Cloud-Hustlers/content/main/gif/linkedin%20gif.gif" alt="LinkedIn" width="80">
  </a>
  <a href="https://www.youtube.com/@CloudHustlers" target="_blank">
    <img src="https://raw.githubusercontent.com/Cloud-Hustlers/content/main/gif/youtube.png" alt="Youtube" width="80">
  </a>
  <a href="https://instagram.com/cloud_hustlers" target="_blank">
    <img src="https://raw.githubusercontent.com/Cloud-Hustlers/content/main/gif/insta.gif" alt="Instagram" width="80">
  </a>
  <a href="https://discord.gg/MdbVq7BJNd" target="_blank">
    <img src="https://raw.githubusercontent.com/Cloud-Hustlers/content/main/gif/discord.gif" alt="GitHub" width="80">
  </a>
</p>


### Store, Process, and Manage Data on Google Cloud: Challenge Lab

### Activate your cloud shell >_

### Export All Values
```
export BUCKET_NAME=

export TOPIC_NAME=

export FUNCTION_NAME=

export REGION=
```

```
gsutil mb -l $REGION gs://$BUCKET_NAME

gcloud pubsub topics create $TOPIC_NAME


mkdir hustler

cd hustler

gcloud services enable run.googleapis.com
gcloud services enable eventarc.googleapis.com

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/master/Store%20Process%20and%20Manage%20Data%20on%20Google%20Cloud%20Challenge%20Lab/index.js

curl -LO https://raw.github.com/Cloud-Hustlers/Lab_Solutions/master/Store%20Process%20and%20Manage%20Data%20on%20Google%20Cloud%20Challenge%20Lab/package.json

sed -i "s/\$TOPIC_NAME/${TOPIC_NAME}/g" index.js
sed -i "s/\$FUNCTION_NAME/${FUNCTION_NAME}/g" index.js


export PROJECT_NUMBER=$(gcloud projects describe $DEVSHELL_PROJECT_ID --format="json(projectNumber)" --quiet | jq -r '.projectNumber')
```
```
  gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
    --member=serviceAccount:service-$PROJECT_NUMBER@gs-project-accounts.iam.gserviceaccount.com  \
    --role=roles/pubsub.publisher
```
### Rerun the above command until you get the output
```
  gcloud projects add-iam-policy-binding $DEVSHELL_PROJECT_ID \
    --member=serviceAccount:service-$PROJECT_NUMBER@gcp-sa-eventarc.iam.gserviceaccount.com  \
    --role=roles/pubsub.publisher
```
### Rerun the above command until you get the output

```
gcloud functions deploy $FUNCTION_NAME \
  --trigger-bucket $BUCKET_NAME \
  --runtime nodejs16 \
  --gen2 \
  --region $REGION \
  --entry-point $FUNCTION_NAME \
  --allow-unauthenticated \
  --quiet
```

```
curl -LO https://storage.googleapis.com/cloud-training/gsp315/map.jpg

gsutil cp map.jpg gs://$BUCKET_NAME/
```


### Congratulation !!!


