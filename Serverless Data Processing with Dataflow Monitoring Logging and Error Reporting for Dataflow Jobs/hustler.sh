curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



gcloud services enable dataflow.googleapis.com

 sudo apt-get install -y python3-venv
 python3 -m venv df-env
 source df-env/bin/activate

 python3 -m pip install -q --upgrade pip setuptools wheel
python3 -m pip install apache-beam[gcp]


cat > email-channel.json <<EOF_END
{
  "type": "email",
  "displayName": "Qwiklabs Student",
  "description": "Subscribe to hustler",
  "labels": {
    "email_address": "$USER_EMAIL"
  }
}
EOF_END


gcloud beta monitoring channels create --channel-content-from-file="email-channel.json"



# Run the gcloud command and store the output in a variable
channel_info=$(gcloud beta monitoring channels list)

# Extract the channel ID using grep and awk
channel_id=$(echo "$channel_info" | grep -oP 'name: \K[^ ]+' | head -n 1)


cat > app-engine-error-percent-policy.json <<EOF_END
{
  "displayName": "Failed Dataflow Job",
  "userLabels": {},
  "conditions": [
    {
      "displayName": "Dataflow Job - Failed",
      "conditionThreshold": {
        "filter": "resource.type = \"dataflow_job\" AND metric.type = \"dataflow.googleapis.com/job/is_failed\"",
        "aggregations": [
          {
            "alignmentPeriod": "300s",
            "crossSeriesReducer": "REDUCE_NONE",
            "perSeriesAligner": "ALIGN_SUM"
          }
        ],
        "comparison": "COMPARISON_GT",
        "duration": "0s",
        "trigger": {
          "count": 1
        },
        "thresholdValue": 0
      }
    }
  ],
  "alertStrategy": {},
  "combiner": "OR",
  "enabled": true,
  "notificationChannels": [
    "$channel_id"
  ],
  "severity": "SEVERITY_UNSPECIFIED"
}

EOF_END



gcloud alpha monitoring policies create --policy-from-file="app-engine-error-percent-policy.json"




cat > my_pipeline.py <<'EOF_END'
import argparse
import logging
import argparse, logging, os
import apache_beam as beam
from apache_beam.io import WriteToText
from apache_beam.options.pipeline_options import PipelineOptions

class ReadGBK(beam.DoFn):

 def process(self, e):
   k, elems = e
   for v in elems:
     logging.info(f"the element is {v}")
     yield v


def run(argv=None):
   parser = argparse.ArgumentParser()
   parser.add_argument(
     '--output', dest='output', help='Output file to write results to.')
   known_args, pipeline_args = parser.parse_known_args(argv)
   read_query = """(
                 SELECT
                   version,
                   block_hash,
                   block_number
                 FROM
                   `bugquery-public-data.crypto_bitcoin.transactions`
                 WHERE
                   version = 1
                 LIMIT
                   1000000 )
               UNION ALL (
                 SELECT
                   version,
                   block_hash,
                   block_number
                 FROM
                   `bigquery-public-data.crypto_bitcoin.transactions`
                 WHERE
                   version = 2
                 LIMIT
                   1000 ) ;"""
   p = beam.Pipeline(options=PipelineOptions(pipeline_args))
   (p
   | 'Read from BigQuery' >> beam.io.ReadFromBigQuery(query=read_query, use_standard_sql=True)
   | "Add Hotkey" >> beam.Map(lambda elem: (elem["version"], elem))
   | "Groupby" >> beam.GroupByKey()
   | 'Print' >>  beam.ParDo(ReadGBK())
   | 'Sink' >>  WriteToText(known_args.output))

   result = p.run()

if __name__ == '__main__':
 logger = logging.getLogger().setLevel(logging.INFO)
 run()

EOF_END



export PROJECT_ID=$(gcloud config get-value project)
gsutil mb -l US gs://$PROJECT_ID

# Attempt to launch the pipeline
python3 my_pipeline.py \
  --project=${PROJECT_ID} \
  --region=$REGION \
  --tempLocation=gs://$PROJECT_ID/temp/ \
  --runner=DataflowRunner


# Launch the pipeline
python3 my_pipeline.py \
  --project=${PROJECT_ID} \
  --region=$REGION \
  --output gs://$PROJECT_ID/results/prefix \
  --tempLocation=gs://$PROJECT_ID/temp/ \
  --max_num_workers=5 \
  --runner=DataflowRunner


# Launch the pipeline
python3 my_pipeline.py \
  --project=${PROJECT_ID} \
  --region=$REGION \
  --output gs://$PROJECT_ID/results/prefix \
  --tempLocation=gs://$PROJECT_ID/temp/ \
  --max_num_workers=5 \
  --runner=DataflowRunner




cat > my_pipeline.py <<'EOF_END'
import argparse
import logging
import argparse, logging, os
import apache_beam as beam
from apache_beam.io import WriteToText
from apache_beam.options.pipeline_options import PipelineOptions
class ReadGBK(beam.DoFn):
 def process(self, e):
   k, elems = e
   for v in elems:
     logging.info(f"the element is {v}")
     yield v
def run(argv=None):
   parser = argparse.ArgumentParser()
   parser.add_argument(
     '--output', dest='output', help='Output file to write results to.')
   known_args, pipeline_args = parser.parse_known_args(argv)
   read_query = """(
                 SELECT
                   version,
                   block_hash,
                   block_number
                 FROM
                   `bigquery-public-data.crypto_bitcoin.transactions`
                 WHERE
                   version = 1
                 LIMIT
                   1000000 )
               UNION ALL (
                 SELECT
                   version,
                   block_hash,
                   block_number
                 FROM
                   `bigquery-public-data.crypto_bitcoin.transactions`
                 WHERE
                   version = 2
                 LIMIT
                   1000 ) ;"""
   p = beam.Pipeline(options=PipelineOptions(pipeline_args))
   (p
   | 'Read from BigQuery' >> beam.io.ReadFromBigQuery(query=read_query, use_standard_sql=True)
   | "Add Hotkey" >> beam.Map(lambda elem: (elem["version"], elem))
   | "Groupby" >> beam.GroupByKey()
   | 'Print' >>  beam.ParDo(ReadGBK())
   | 'Sink' >>  WriteToText(known_args.output))
   result = p.run()
if __name__ == '__main__':
 logger = logging.getLogger().setLevel(logging.INFO)
 run()

EOF_END



export PROJECT_ID=$(gcloud config get-value project)
gsutil mb -l US gs://$PROJECT_ID


python3 my_pipeline.py \
  --project=${PROJECT_ID} \
  --region=$REGION \
  --output gs://$PROJECT_ID/results/prefix \
  --tempLocation=gs://$PROJECT_ID/temp/ \
  --max_num_workers=5 \
  --runner=DataflowRunner





curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
