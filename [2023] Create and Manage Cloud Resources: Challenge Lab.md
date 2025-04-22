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


## ***Create and Manage Cloud Resources: Challenge Lab***

### Export all the values carefully

```bash
export INSTANCE_NAME=

export ZONE=

export REGION=

export PORT=

export FIREWALL_NAME=
```
###
###

### ***NOW JUST COPY THE CODE AND PASTE ON YOUR CLOUD SHELL***
###
###

```bash
gcloud compute networks create nucleus-vpc --subnet-mode=auto

gcloud compute instances create $INSTANCE_NAME \
          --network nucleus-vpc \
          --zone $ZONE  \
          --machine-type e2-micro  \
          --image-family debian-10  \
          --image-project debian-cloud 

 
gcloud container clusters create nucleus-backend \
--num-nodes 1 \
--network nucleus-vpc \
--zone $ZONE
 
 
gcloud container clusters get-credentials nucleus-backend \
--zone $ZONE
 
 
kubectl create deployment hello-server \
--image=gcr.io/google-samples/hello-app:2.0
  
kubectl expose deployment hello-server \
--type=LoadBalancer \
--port $PORT
 
  
cat << EOF > startup.sh
#! /bin/bash
apt-get update
apt-get install -y nginx
service nginx start
sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
EOF

 
gcloud compute instance-templates create web-server-template \
--metadata-from-file startup-script=startup.sh \
--network nucleus-vpc \
--machine-type g1-small \
--region $ZONE
 
 
gcloud compute target-pools create nginx-pool --region=$REGION
 
 
gcloud compute instance-groups managed create web-server-group \
--base-instance-name web-server \
--size 2 \
--template web-server-template \
--region $REGION
 
 
gcloud compute firewall-rules create $FIREWALL_NAME \
--allow tcp:80 \
--network nucleus-vpc
 
 
gcloud compute http-health-checks create http-basic-check
gcloud compute instance-groups managed \
set-named-ports web-server-group \
--named-ports http:80 \
--region $REGION
 
 
gcloud compute backend-services create web-server-backend \
--protocol HTTP \
--http-health-checks http-basic-check \
--global
 
 
gcloud compute backend-services add-backend web-server-backend \
--instance-group web-server-group \
--instance-group-region $REGION \
--global
 
 
gcloud compute url-maps create web-server-map \
--default-service web-server-backend
 
 
gcloud compute target-http-proxies create http-lb-proxy \
--url-map web-server-map
 
 
 
gcloud compute forwarding-rules create http-content-rule \
--global \
--target-http-proxy http-lb-proxy \
--ports 80
 
 
gcloud compute forwarding-rules create $FIREWALL_NAME \
--global \
--target-http-proxy http-lb-proxy \
--ports 80
gcloud compute forwarding-rules list
```

### IF score is not updated wait for 5-10 minutes 

### ***Congratulations!!!!***
 
