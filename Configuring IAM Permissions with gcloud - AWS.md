![API Gateway Banner](https://raw.githubusercontent.com/Cloud-Hustlers/content/f9a8642976ea21cd234c91239431e41f05264842/gif/12.gif)

<div align="center">
  
# Connect with Cloud Hustlers Community
</div>

<p align="center">
  <a href="https://whatsapp.cloudhustlers.in" target="_blank">
    <img src="https://raw.githubusercontent.com/Cloud-Hustlers/content/main/gif/whatsapp.gif" alt="WhatsApp" width="80">
  </a>
  <a href="https://in.linkedin.com/company/cloud-hustlers" target="_blank">
    <img src="https://raw.githubusercontent.com/Cloud-Hustlers/content/main/gif/linkedin%20gif.gif" alt="LinkedIn" width="80">
  </a>
  <a href="https://www.youtube.com/@CloudHustlers" target="_blank">
    <img src="https://raw.githubusercontent.com/Cloud-Hustlers/content/main/gif/youtube.png" alt="Youtube" width="80">
  </a>
  <a href="https://instagram.com/cloud_hustlers" target="_blank">
    <img src="https://raw.githubusercontent.com/Cloud-Hustlers/content/main/gif/insta.gif" alt="Instagram" width="80">
  </a>
  <a href="https://discord.gg/MdbVq7BJNd" target="_blank">
    <img src="https://raw.githubusercontent.com/Cloud-Hustlers/content/main/gif/discord.gif" alt="GitHub" width="80">
  </a>
</p>



### Configuring IAM Permissions with gCloud - AWS

### Open the list of compute instances by going to Navigation Menu > Compute Engine > VM instances.

### On the line with the compute instance named centos-clean, click SSH.




```bash
export ZONE_1=
```
```bash
export ZONE_2=
```

```bash
export SECOND_USER_NAME=
```
```bash
export SECOND_PROJECT_ID=
```



```bash
gcloud --version

gcloud auth login --no-launch-browser --quiet
```

```bash
sudo yum install google-cloud-sdk -y

gcloud config set compute/zone "$ZONE_1"
export ZONE=$(gcloud config get compute/zone)

gcloud config set compute/region "${ZONE_1%-*}"
export REGION=$(gcloud config get compute/region)

gcloud compute instances create lab-1 --zone=$ZONE --machine-type=e2-standard-2
```

```bash
gcloud config set compute/zone "$ZONE_2"
```

### Now check the score for task 1. 
### Untill you get score on task 1 do not move ahead with next commands.

```bash
gcloud init --no-launch-browser
```

### Select option 2, Create a new configuration.

### configuration name: Type ***user2***

### Make sure to choose your 1st project id .

```bash

gcloud config configurations activate default

gcloud config configurations activate user2

echo "export PROJECTID2=$SECOND_PROJECT_ID" >> ~/.bashrc

. ~/.bashrc
gcloud config set project $PROJECTID2 --quiet

gcloud config configurations activate default

sudo yum -y install epel-release
sudo yum -y install jq

echo "export USERID2=$SECOND_USER_NAME" >> ~/.bashrc

. ~/.bashrc
gcloud projects add-iam-policy-binding $PROJECTID2 --member user:$USERID2 --role=roles/viewer


gcloud config configurations activate user2

gcloud config set project $PROJECTID2

gcloud compute instances create lab-2

gcloud config configurations activate default

gcloud iam roles create devops --project $PROJECTID2 --permissions "compute.instances.create,compute.instances.delete,compute.instances.start,compute.instances.stop,compute.instances.update,compute.disks.create,compute.subnetworks.use,compute.subnetworks.useExternalIp,compute.instances.setMetadata,compute.instances.setServiceAccount"

gcloud projects add-iam-policy-binding $PROJECTID2 --member user:$USERID2 --role=roles/iam.serviceAccountUser

gcloud projects add-iam-policy-binding $PROJECTID2 --member user:$USERID2 --role=projects/$PROJECTID2/roles/devops

gcloud config configurations activate user2

gcloud compute instances create lab-2 --zone=$ZONE_2 --machine-type=e2-standard-2

gcloud config configurations activate default

gcloud config set project $PROJECTID2

gcloud iam service-accounts create devops --display-name devops

gcloud iam service-accounts list  --filter "displayName=devops"

SA=$(gcloud iam service-accounts list --format="value(email)" --filter "displayName=devops")

gcloud projects add-iam-policy-binding $PROJECTID2 --member serviceAccount:$SA --role=roles/iam.serviceAccountUser

gcloud projects add-iam-policy-binding $PROJECTID2 --member serviceAccount:$SA --role=roles/compute.instanceAdmin

gcloud compute instances create lab-3 --machine-type=e2-standard-2 --service-account $SA --scopes "https://www.googleapis.com/auth/compute"

gcloud compute instances create lab-2 --zone=$ZONE_2 --machine-type=e2-standard-2
```

