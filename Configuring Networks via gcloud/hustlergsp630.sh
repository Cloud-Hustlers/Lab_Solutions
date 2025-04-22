curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



export REGION="${ZONE%-*}"

gcloud compute networks create labnet --subnet-mode=custom

gcloud compute networks subnets create labnet-sub \
   --network labnet \
   --region "$REGION" \
   --range 10.0.0.0/28

gcloud compute networks list

gcloud compute firewall-rules create labnet-allow-internal \
	--network=labnet \
	--action=ALLOW \
	--rules=icmp,tcp:22 \
	--source-ranges=0.0.0.0/0

gcloud compute networks create privatenet --subnet-mode=custom


gcloud compute networks subnets create private-sub \
    --network=privatenet \
    --region="$REGION" \
    --range 10.1.0.0/28


gcloud compute firewall-rules create privatenet-deny \
    --network=privatenet \
    --action=DENY \
    --rules=icmp,tcp:22 \
    --source-ranges=0.0.0.0/0

gcloud compute firewall-rules list --sort-by=NETWORK


gcloud compute instances create pnet-vm \
--zone="$ZONE" \
--machine-type=n1-standard-1 \
--subnet=private-sub



gcloud compute instances create lnet-vm \
--zone="$ZONE" \
--machine-type=n1-standard-1 \
--subnet=labnet-sub

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
