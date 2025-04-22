curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



gcloud config set project $DEVSHELL_PROJECT_ID

gcloud firestore databases create --location=nam5

git clone https://github.com/rosera/pet-theory

cd pet-theory/lab01

npm install @google-cloud/firestore

npm install @google-cloud/logging


curl https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/master/Importing%20Data%20to%20a%20Firestore%20Database/importTestData.js > importTestData.js

npm install faker@5.5.3

curl https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/master/Importing%20Data%20to%20a%20Firestore%20Database/createTestData.js > createTestData.js 


node createTestData 1000

node importTestData customers_1000.csv

npm install csv-parse

node createTestData 20000
node importTestData customers_20000.csv





curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
