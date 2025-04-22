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


# ```Cloud SQL with Cloud Run [APPRUN]```



```bash
export REGION=
```

```bash
gcloud services enable run.googleapis.com

gcloud config set compute/region $REGION

gcloud sql instances create poll-database \
    --database-version=POSTGRES_13 \
    --tier=db-custom-6-32768 \
    --region=$REGION \
    --root-password=secretpassword

gcloud sql connect poll-database --user=postgres --database=postgres 
```

***Enter the Cloud SQL password when requested :-*** ```secretpassword```

```
CREATE TABLE IF NOT EXISTS votes
( vote_id SERIAL NOT NULL, time_cast timestamp NOT NULL,
candidate VARCHAR(6) NOT NULL, PRIMARY KEY (vote_id) );


CREATE TABLE IF NOT EXISTS totals
( total_id SERIAL NOT NULL, candidate VARCHAR(6) NOT NULL,
num_votes INT DEFAULT 0, PRIMARY KEY (total_id) );

INSERT INTO totals (candidate, num_votes) VALUES ('TABS', 0);


INSERT INTO totals (candidate, num_votes) VALUES ('SPACES', 0);
```


***To exit from the Cloud SQL Instance type:-*** ```\q```




```
CLOUD_SQL_CONNECTION_NAME=$(gcloud sql instances describe poll-database --format='value(connectionName)')

gcloud beta run deploy poll-service \
   --image gcr.io/qwiklabs-resources/gsp737-tabspaces \
   --region $REGION \
   --allow-unauthenticated \
   --add-cloudsql-instances=$CLOUD_SQL_CONNECTION_NAME \
   --set-env-vars "DB_USER=postgres" \
   --set-env-vars "DB_PASS=secretpassword" \
   --set-env-vars "DB_NAME=postgres" \
   --set-env-vars "CLOUD_SQL_CONNECTION_NAME=$CLOUD_SQL_CONNECTION_NAME"

POLL_APP_URL=$(gcloud run services describe poll-service --platform managed --region $REGION --format="value(status.address.url)")
```


