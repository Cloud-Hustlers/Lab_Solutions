curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

gcloud auth list

git clone https://github.com/GoogleCloudPlatform/terraform-google-lb-http.git

cd ~/terraform-google-lb-http/examples/multi-backend-multi-mig-bucket-https-lb

rm -rf main.tf

wget https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/master/HTTPS%20Content-Based%20Load%20Balancer%20with%20Terraform/main.tf


terraform init 

echo $DEVSHELL_PROJECT_ID | terraform plan 

echo $DEVSHELL_PROJECT_ID | terraform apply -auto-approve


EXTERNAL_IP=$(terraform output | grep load-balancer-ip | cut -d = -f2 | xargs echo -n)
echo http://${EXTERNAL_IP}

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
