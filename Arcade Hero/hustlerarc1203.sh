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



users=($(gcloud projects get-iam-policy $PROJECT_ID --format=json | jq -r '.bindings[] | select(.role=="roles/viewer") | .members[]' | sed 's/user://g'))

# Assign each user to a separate variable dynamically
for i in "${!users[@]}"; do
    eval "USER$((i+1))=${users[i]}"
done

# # Print all stored users
# echo "Users with Viewer role:"
# for i in "${!users[@]}"; do
#     eval "echo User$((i+1)): \$USER$((i+1))"
# done


gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="user:$USER3" \
    --role="roles/editor"

sleep 20

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="user:$USER1" \
    --role="roles/compute.admin"

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
