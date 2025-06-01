curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


gcloud services enable fitness.googleapis.com

cat > values.json <<EOF_END
{  "name": "$DEVSHELL_PROJECT_ID-bucket",
   "location": "us",
   "storageClass": "multi_regional"
}
EOF_END


OAUTH2_TOKEN=$(gcloud auth print-access-token)
export PROJECT_ID=$(gcloud config get-value project)
curl -X POST --data-binary @values.json \
    -H "Authorization: Bearer $OAUTH2_TOKEN" \
    -H "Content-Type: application/json" \
    "https://www.googleapis.com/storage/v1/b?project=$PROJECT_ID"

#TASK 5


wget https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/main/Extract%20Analyze%20and%20Translate%20Text%20from%20Images%20with%20the%20Cloud%20ML%20APIs/sign.jpg


mv sign.jpg demo-image.png

export OBJECT==$(realpath demo-image.png)

export BUCKET_NAME=$DEVSHELL_PROJECT_ID-bucket 

curl -X POST --data-binary @$OBJECT \
    -H "Authorization: Bearer $OAUTH2_TOKEN" \
    -H "Content-Type: image/png" \
    "https://www.googleapis.com/upload/storage/v1/b/$BUCKET_NAME/o?uploadType=media&name=demo-image"

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
