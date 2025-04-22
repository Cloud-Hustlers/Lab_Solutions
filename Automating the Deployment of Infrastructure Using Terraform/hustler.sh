curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


gcloud auth list

mkdir tfinfra

cd tfinfra


wget https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/master/Automating%20the%20Deployment%20of%20Infrastructure%20Using%20Terraform/mynetwork.tf

wget https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/master/Automating%20the%20Deployment%20of%20Infrastructure%20Using%20Terraform/provider.tf

wget https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/master/Automating%20the%20Deployment%20of%20Infrastructure%20Using%20Terraform/terraform.tfstate

wget https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/master/Automating%20the%20Deployment%20of%20Infrastructure%20Using%20Terraform/variables.tf


mkdir instance

cd instance

wget https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/master/Automating%20the%20Deployment%20of%20Infrastructure%20Using%20Terraform/instance/main.tf

cd ..

terraform init

terraform fmt

terraform init

echo -e "mynet-us-vm\nmynetwork\n$ZONE" | terraform plan -var="instance_name=$(</dev/stdin)" -var="instance_network=$(</dev/stdin)" -var="instance_zone=$(</dev/stdin)"

echo -e "mynet-us-vm\nmynetwork\n$ZONE" | terraform apply -var="instance_name=$(</dev/stdin)" -var="instance_network=$(</dev/stdin)" -var="instance_zone=$(</dev/stdin)" --auto-approve

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
