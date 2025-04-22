curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh






gsutil mb gs://$DEVSHELL_PROJECT_ID

bq mk $DATASET_NAME

bq mk --table \
$DEVSHEL_PROJECT_ID:$DATASET_NAME.$TABLE_NAME \
data:string

gcloud pubsub topics create $TOPIC_NAME

gcloud pubsub subscriptions create $TOPIC_NAME-sub --topic=$TOPIC_NAME

gcloud dataflow flex-template run $JOB_NAME --template-file-gcs-location gs://dataflow-templates-$REGION/latest/flex/PubSub_to_BigQuery_Flex --region $REGION --temp-location gs://$DEVSHELL_PROJECT_ID/temp/ --parameters outputTableSpec=$DEVSHELL_PROJECT_ID:$DATASET_NAME.$TABLE_NAME,inputTopic=projects/$DEVSHELL_PROJECT_ID/topics/$TOPIC_NAME,outputDeadletterTable=$DEVSHELL_PROJECT_ID:$DATASET_NAME.$TABLE_NAME,javascriptTextTransformReloadIntervalMinutes=0,useStorageWriteApi=false,useStorageWriteApiAtLeastOnce=false,numStorageWriteApiStreams=0


while true; do
    STATUS=$(gcloud dataflow jobs list --region="$REGION" --format='value(STATE)' | grep Running)
    
    if [ "$STATUS" == "Running" ]; then
        # Run the next code here
        echo "The Dataflow job is running. Proceeding with the next code."
        # Add your next code here

        sleep 20
        gcloud pubsub topics publish $TOPIC_NAME --message='{"data": "73.4 F"}'

        bq query --nouse_legacy_sql "SELECT * FROM \`$DEVSHELL_PROJECT_ID.$DATASET_NAME.$TABLE_NAME\`"
        break  # exit the loop since the job is running
    else
        # Wait for a certain amount of time before checking again
        sleep 30  # you can adjust the sleep duration based on your needs
        echo "The Dataflow job is not running. Waiting for it to start..."
        echo "Meantime Like Share & Subscribe to CloudHustlers[https://www.youtube.com/@CloudHustlers]..."
        # Continue to the next iteration of the loop
    fi
done




gcloud pubsub topics publish $TOPIC_NAME --message='{"data": "73.4 F"}'

bq query --nouse_legacy_sql "SELECT * FROM \`$DEVSHELL_PROJECT_ID.$DATASET_NAME.$TABLE_NAME\`"



gcloud dataflow jobs run $JOB_NAME-hustler --gcs-location gs://dataflow-templates-$REGION/latest/PubSub_to_BigQuery --region $REGION --staging-location gs://$DEVSHELL_PROJECT_ID/temp --parameters inputTopic=projects/$DEVSHELL_PROJECT_ID/topics/$TOPIC_NAME,outputTableSpec=$DEVSHELL_PROJECT_ID:$DATASET_NAME.$TABLE_NAME


while true; do
    STATUS=$(gcloud dataflow jobs list --region="$REGION" --filter="NAME:$JOB_NAME-hustler AND STATE:Running" --format='value(STATE)')

    
    if [ "$STATUS" == "Running" ]; then
        # Run the next code here 
        echo "The Dataflow job is running. Proceeding with the next code."
        # Add your next code here

        sleep 20
        gcloud pubsub topics publish $TOPIC_NAME --message='{"data": "73.4 F"}'

        bq query --nouse_legacy_sql "SELECT * FROM \`$DEVSHELL_PROJECT_ID.$DATASET_NAME.$TABLE_NAME\`"
        break  # exit the loop since the job is running
    else
        # Wait for a certain amount of time before checking again
        sleep 30  # you can adjust the sleep duration based on your needs
        echo "The Dataflow job is not running. Waiting for it to start..."
        echo "Meantime Like Share & Subscribe to CloudHustlers[https://www.youtube.com/@CloudHustlers]..."
        # Continue to the next iteration of the loop
    fi
done


curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
