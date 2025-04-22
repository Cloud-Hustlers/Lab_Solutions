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

## Debugging Apps on Google Kubernetes Engine

##


### ```Now you have to export the ZONE from Setup and requirements task```

```bash
export ZONE=
```

####

```
gcloud config set compute/zone $ZONE

export PROJECT_ID=$(gcloud info --format='value(config.project)')

gcloud container clusters get-credentials central --zone $ZONE

git clone https://github.com/xiangshen-dk/microservices-demo.git

cd microservices-demo

kubectl apply -f release/kubernetes-manifests.yaml

sleep 30

gcloud logging metrics create Error_Rate_SLI \
  --description="subscribe to hustler" \
  --log-filter="resource.type=\"k8s_container\" severity=ERROR labels.\"k8s-pod/app\": \"recommendationservice\"" 
```




