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


# Streaming Data Processing: Streaming Data Pipelines into Bigtable



Open the SSH terminal and connect to the training VM

Navigation menu ( Navigation menu icon), click Compute Engine > VM instances.

 click on SSH to open a terminal window. Then click Connect.
## 

## Run these command on 1st connection

```bash
git clone https://github.com/GoogleCloudPlatform/training-data-analyst

source /training/project_env.sh

cd ~/training-data-analyst/courses/streaming/process/sandiego
./install_quickstart.sh

/training/sensor_magic.sh
```


## Open a second SSH terminal and connect to the training VM

In the upper right corner of the training-vm SSH terminal, click on the gear-shaped button (Settings icon), and select New Connection from the drop-down menu. A new terminal window will open.


## Run these command on 2nd  connection

```bash
export ZONE=
```


```bash
export REGION="${ZONE%-*}"
source /training/project_env.sh

gcloud services disable dataflow.googleapis.com --force
gcloud services enable dataflow.googleapis.com

cd ~/training-data-analyst/courses/streaming/process/sandiego

cd ~/training-data-analyst/courses/streaming/process/sandiego
./create_cbt.sh

cd ~/training-data-analyst/courses/streaming/process/sandiego
./run_oncloud.sh $DEVSHELL_PROJECT_ID $BUCKET CurrentConditions --bigtable
```



### Now just wait for 5 minutes score will update automatically
