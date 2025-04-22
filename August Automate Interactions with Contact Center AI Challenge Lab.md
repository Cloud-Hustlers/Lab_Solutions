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


# Automate Interactions with Contact Center AI: Challenge Lab




#### ▶ Activate the cloud shell 

#### ▶ Make sure your laptop not go for sleep 







## 

####  Export values from lab page ▶


##

```bash
export BUCKET_NAME=

export REGION=

export DATASET_NAME=

export TOPIC_NAME=

export BUCKET_NAME_2=

export DATAFLOW_OBJECT_NAME=
```


```bash
git clone https://github.com/GoogleCloudPlatform/dataflow-contact-center-speech-analysis.git

gsutil mb -l $REGION gs://$BUCKET_NAME/


cd dataflow-contact-center-speech-analysis/saf-longrun-job-func
gcloud functions deploy safLongRunJobFunc --runtime nodejs12 --trigger-resource $BUCKET_NAME --region $REGION --trigger-event google.storage.object.finalize


# To create the dataset
bq mk $DATASET_NAME

gcloud pubsub topics create $TOPIC_NAME

gsutil mb -l $REGION gs://$BUCKET_NAME_2/
gsutil cp /dev/null gs://$BUCKET_NAME_2/$DATAFLOW_OBJECT_NAME/

cd ..

cd saf-longrun-job-dataflow

python -m virtualenv env -p python3
source env/bin/activate
pip install apache-beam[gcp]
pip install dateparser
```

```bash
python saflongrunjobdataflow.py \
--project=$DEVSHELL_PROJECT_ID \
--region=$REGION \
--input_topic=projects/$DEVSHELL_PROJECT_ID/topics/$TOPIC_NAME \
--runner=DataflowRunner \
--temp_location=gs://$BUCKET_NAME/$DATAFLOW_OBJECT_NAME \
--output_bigquery=$DEVSHELL_PROJECT_ID:$DATASET_NAME.transcripts \
--requirements_file=requirements.txt
```

### If job is failed then re-run the above command again


#### 


```bash
    # mono flac audio sample
gsutil -h x-goog-meta-dlp:false -h x-goog-meta-callid:1234567 -h x-goog-meta-stereo:false -h x-goog-meta-pubsubtopicname:$TOPIC_NAME -h x-goog-meta-year:2019 -h x-goog-meta-month:11 -h x-goog-meta-day:06 -h x-goog-meta-starttime:1116 cp gs://qwiklabs-bucket-gsp311/speech_commercial_mono.flac gs://$BUCKET_NAME



    # stereo wav audio sample
gsutil -h x-goog-meta-dlp:false -h x-goog-meta-callid:1234567 -h x-goog-meta-stereo:true -h x-goog-meta-pubsubtopicname:$TOPIC_NAME -h x-goog-meta-year:2019 -h x-goog-meta-month:11 -h x-goog-meta-day:06 -h x-goog-meta-starttime:1116 cp gs://qwiklabs-bucket-gsp311/speech_commercial_stereo.wav gs://$BUCKET_NAME
```

### Now go to bigquery and check for transcripts table if transcripts table is present then only run the below commands,untill wait for it..

```bash
bq query --use_legacy_sql=false \
  --destination_table=$DEVSHELL_PROJECT_ID:$DATASET_NAME.saf \
  "SELECT entities.name, entities.type, COUNT(entities.name) AS count
  FROM $DATASET_NAME.transcripts, UNNEST(entities) entities
  GROUP BY entities.name, entities.type
  HAVING count > 5
  ORDER BY count ASC"

bq query --use_legacy_sql=false \
  --destination_table=$DEVSHELL_PROJECT_ID:$DATASET_NAME.hustler \
  "SELECT entities.name, entities.type, COUNT(entities.name) AS count
  FROM $DATASET_NAME.transcripts, UNNEST(entities) entities
  GROUP BY entities.name, entities.type
  HAVING count > 5
  ORDER BY count ASC"
```

#### now go to bigquery and follow the video's step to run a trigger 


###                 Congratulation !!!!
