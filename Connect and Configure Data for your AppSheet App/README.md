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


# ETL Processing on Google Cloud Using Dataflow and BigQuery

Click Activate Cloud Shell Activate Cloud Shell icon at the top of the Google Cloud console.




## export REGION :-

```bash
export REGION=
```

```bash
gcloud services disable dataflow.googleapis.com

gcloud services enable dataflow.googleapis.com

sleep 30

gsutil -m cp -R gs://spls/gsp290/dataflow-python-examples .

export PROJECT=$(gcloud config get-value project)

gsutil mb -c regional -l $REGION  gs://$PROJECT

gsutil cp gs://spls/gsp290/data_files/usa_names.csv gs://$PROJECT/data_files/
gsutil cp gs://spls/gsp290/data_files/head_usa_names.csv gs://$PROJECT/data_files/

bq mk lake

docker run -it -e PROJECT=$PROJECT -v $(pwd)/dataflow-python-examples:/dataflow python:3.7 /bin/bash
```

```bash
pip install apache-beam[gcp]==2.24.0

pip install --upgrade pip
```

```bash
cd dataflow/
```

```bash
export REGION=
```

```bash
python dataflow_python_examples/data_ingestion.py \
  --project=$PROJECT --region=$REGION \
  --runner=DataflowRunner \
  --machine_type=e2-small \
  --staging_location=gs://$PROJECT/test \
  --temp_location gs://$PROJECT/test \
  --input gs://$PROJECT/data_files/head_usa_names.csv \
  --save_main_session
```

```bash
python dataflow_python_examples/data_transformation.py \
  --project=$PROJECT \
  --region=$REGION \
  --runner=DataflowRunner \
  --machine_type=e2-small \
  --staging_location=gs://$PROJECT/test \
  --temp_location gs://$PROJECT/test \
  --input gs://$PROJECT/data_files/head_usa_names.csv \
  --save_main_session
```

```bash
sed -i "s/values = \[x.decode('utf8') for x in csv_row\]/values = \[x for x in csv_row\]/" ./dataflow_python_examples/data_enrichment.py

python dataflow_python_examples/data_enrichment.py \
  --project=$PROJECT \
  --region=us-central1 \
  --runner=DataflowRunner \
  --machine_type=e2-small \
  --staging_location=gs://$PROJECT/test \
  --temp_location gs://$PROJECT/test \
  --input gs://$PROJECT/data_files/head_usa_names.csv \
  --save_main_session
```

```bash
python dataflow_python_examples/data_lake_to_mart.py \
  --worker_disk_type="compute.googleapis.com/projects//zones//diskTypes/pd-ssd" \
  --max_num_workers=4 \
  --project=$PROJECT \
  --runner=DataflowRunner \
  --machine_type=e2-small \
  --staging_location=gs://$PROJECT/test \
  --temp_location gs://$PROJECT/test \
  --save_main_session \
  --region=$REGION
```



## Congratulation !!! 
