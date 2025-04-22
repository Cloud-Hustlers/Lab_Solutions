curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


gcloud auth list

git clone https://github.com/GoogleCloudPlatform/terraform-google-lb
cd ~/terraform-google-lb/examples/basic

export GOOGLE_PROJECT=$(gcloud config get-value project)


sed -i 's/us-central1/'"$REGION"'/g' variables.tf


export TF_VAR_project_id=$DEVSHELL_PROJECT_ID

terraform init
terraform plan
yes | terraform apply --auto-approve


curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
