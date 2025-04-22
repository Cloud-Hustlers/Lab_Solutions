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


## Manage Kubernetes in Google Cloud: Challenge Lab

### 

***1. Go to log base metric***

***2 Click Create Metric.***
 
***3. Use the following details to configure your metric:***

***Metric type: ```Counter```***
***Log Metric Name :*** ```pod-image-errors```

***4. Enable Show query and in the Query builder box, add the following query:***
``` 
resource.type="k8s_pod"
severity=WARNING
```
 
***5. Click Create Metric.***



### Make sure to use online notepad which I was using 

```bash
export REPO_NAME=

export CLUSTER_NAME=

export ZONE=

export NAMESPACE=

export INTERVAL=

export SERVICE_NAME=
```


```bash
curl -LO raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/main/NEW%20Manage%20Kubernetes%20in%20Google%20Cloud%20Challenge%20Lab/hustlergsp510.sh
sudo chmod +x hustlergsp510.sh
./hustlergsp510.sh
```


***Wait for to command get execute and make sure laptop will not go for sleep***

### Congratulations !!!
