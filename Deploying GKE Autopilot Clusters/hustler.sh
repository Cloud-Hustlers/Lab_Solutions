curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


export REGION=$(gcloud compute project-info describe \
--format="value(commonInstanceMetadata.items[google-compute-default-region])")

export ZONE=$(gcloud compute project-info describe \
--format="value(commonInstanceMetadata.items[google-compute-default-zone])")

PROJECT_ID=`gcloud config get-value project`



export my_region=$REGION

export my_cluster=autopilot-cluster-1


gcloud container clusters create-auto $my_cluster --region $my_region

gcloud container clusters get-credentials $my_cluster --region $my_region

kubectl config view

kubectl cluster-info

kubectl config current-context

kubectl config get-contexts

kubectl config use-context gke_${DEVSHELL_PROJECT_ID}_us-central1_autopilot-cluster-1


kubectl create deployment nginx-1 --image=nginx:latest



curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
