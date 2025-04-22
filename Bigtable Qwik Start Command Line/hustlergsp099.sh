curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


gcloud services enable bigtable.googleapis.com bigtableadmin.googleapis.com

sleep 10

gcloud bigtable instances create quickstart-instance \
    --display-name="Quickstart instance" \
    --cluster-storage-type=SSD \
    --cluster-config=id=quickstart-instance-c1,zone=$ZONE,nodes=1


echo project = `gcloud config get-value project` > ~/.cbtrc

echo instance = quickstart-instance >> ~/.cbtrc


cbt createtable my-table

cbt ls

cbt createfamily my-table cf1

cbt ls my-table

cbt set my-table r1 cf1:c1=test-value

cbt read my-table

cbt deletetable my-table



curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
