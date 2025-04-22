curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

gcloud services enable appengine.googleapis.com

sleep 10

git clone https://github.com/GoogleCloudPlatform/java-docs-samples.git

cd java-docs-samples/appengine-java8/helloworld

mvn clean
mvn package

timeout 30 mvn appengine:run &

sleep 30

gcloud app create --region=$REGION

sed -i "s/myProjectId/$DEVSHELL_PROJECT_ID/g" pom.xml

mvn package appengine:deploy

gcloud app browse

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
