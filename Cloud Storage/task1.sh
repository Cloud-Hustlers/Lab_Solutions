curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


export REGION="${ZONE%-*}"

gsutil mb -p $DEVSHELL_PROJECT_ID -c STANDARD -l $REGION -b on gs://$DEVSHELL_PROJECT_ID

gsutil uniformbucketlevelaccess set off gs://$DEVSHELL_PROJECT_ID


export BUCKET_NAME_1=$DEVSHELL_PROJECT_ID

curl \
https://hadoop.apache.org/docs/current/\
hadoop-project-dist/hadoop-common/\
ClusterSetup.html > setup.html

cp setup.html setup2.html
cp setup.html setup3.html

gcloud storage cp setup.html gs://$BUCKET_NAME_1/

gsutil acl get gs://$BUCKET_NAME_1/setup.html  > acl.txt
cat acl.txt


gsutil acl set private gs://$BUCKET_NAME_1/setup.html
gsutil acl get gs://$BUCKET_NAME_1/setup.html  > acl2.txt
cat acl2.txt


gsutil acl ch -u AllUsers:R gs://$BUCKET_NAME_1/setup.html
gsutil acl get gs://$BUCKET_NAME_1/setup.html  > acl3.txt
cat acl3.txt

rm setup.html

gcloud storage cp gs://$BUCKET_NAME_1/setup.html setup.html


# Store the generated key in a variable
CSEK_KEY=$(python3 -c 'import base64; import os; print(base64.encodebytes(os.urandom(32)).decode("utf-8").strip())')

# Print the value to verify
echo "Generated CSEK Key: $CSEK_KEY"

gsutil config -n

sed -i "324c\encryption_key=$CSEK_KEY" .boto




gsutil cp setup2.html gs://$BUCKET_NAME_1/
gsutil cp setup3.html gs://$BUCKET_NAME_1/

rm setup*

gsutil cp gs://$BUCKET_NAME_1/setup* ./

cat setup.html
cat setup2.html
cat setup3.html


sed -i "324c\#encryption_key=$CSEK_KEY" .boto

sed -i "331c\decryption_key1=$CSEK_KEY" .boto


# Store the generated key in a variable
CSEK_KEY=$(python3 -c 'import base64; import os; print(base64.encodebytes(os.urandom(32)).decode("utf-8").strip())')

# Print the value to verify
echo "Generated CSEK Key: $CSEK_KEY"

sed -i "324c\encryption_key=$CSEK_KEY" .boto

gsutil rewrite -k gs://$BUCKET_NAME_1/setup2.html

sed -i "331c\#decryption_key1=$CSEK_KEY" .boto


gsutil cp gs://$BUCKET_NAME_1/setup2.html recover2.html

gsutil cp gs://$BUCKET_NAME_1/setup3.html recover3.html

gsutil lifecycle get gs://$BUCKET_NAME_1


cat > life.json <<'EOF_END'
{
  "rule":
  [
    {
      "action": {"type": "Delete"},
      "condition": {"age": 31}
    }
  ]
}
EOF_END

gsutil lifecycle set life.json gs://$BUCKET_NAME_1

gsutil lifecycle get gs://$BUCKET_NAME_1

gsutil versioning get gs://$BUCKET_NAME_1

gsutil versioning set on gs://$BUCKET_NAME_1

gsutil versioning get gs://$BUCKET_NAME_1

ls -al setup.html

sed -i '5,9d' setup.html

gcloud storage cp -v setup.html gs://$BUCKET_NAME_1

sed -i '5,9d' setup.html

gcloud storage cp -v setup.html gs://$BUCKET_NAME_1

gcloud storage ls -a gs://$BUCKET_NAME_1/setup.html

VARIABLE=$(gcloud storage ls -a gs://$BUCKET_NAME_1/setup.html | head -n 1 | awk '{print $1}')

export VERSION_NAME=$VARIABLE

gcloud storage cp $VERSION_NAME recovered.txt

mkdir firstlevel
mkdir ./firstlevel/secondlevel
cp setup.html firstlevel
cp setup.html firstlevel/secondlevel

gsutil rsync -r ./firstlevel gs://$BUCKET_NAME_1/firstlevel


sleep 30

gcloud compute instances create crossproject --project=$DEVSHELL_PROJECT_ID --zone=$ZONE --machine-type=e2-medium --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default --metadata=enable-oslogin=true --maintenance-policy=MIGRATE --provisioning-model=STANDARD --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --create-disk=auto-delete=yes,boot=yes,device-name=crossproject,image=projects/debian-cloud/global/images/debian-11-bullseye-v20240110,mode=rw,size=10,type=projects/$DEVSHELL_PROJECT_ID/zones/$ZONE/diskTypes/pd-balanced --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --labels=goog-ec-src=vm_add-gcloud --reservation-affinity=any





curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
