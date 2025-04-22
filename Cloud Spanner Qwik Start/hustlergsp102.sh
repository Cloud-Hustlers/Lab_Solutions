curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



gcloud spanner instances create test-instance \
  --config=regional-$REGION \
  --description="Test Instance" \
  --nodes=1


gcloud spanner databases create example-db --instance=test-instance

gcloud spanner databases ddl update example-db --instance=test-instance \
  --ddl="CREATE TABLE Singers (
    SingerId INT64 NOT NULL,
    FirstName STRING(1024),
    LastName STRING(1024),
    SingerInfo BYTES(MAX),
    BirthDate DATE,
    ) PRIMARY KEY(SingerId);"

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
