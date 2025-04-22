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



## 🚀 Analyzing Network Traffic with VPC Flow Logs | [Lab Link](https://www.cloudskillsboost.google/focuses/45798?parent=catalog)

### 🔗 **Solution Video:** [Watch Here](https://www.youtube.com/@CloudHustlers/videos)

---

## ⚠️ **Disclaimer:**
This script and guide are provided for educational purposes to help you understand the lab process. Before using the script, I encourage you to open and review it to understand each step. Please make sure you follow Qwiklabs' terms of service and YouTube’s community guidelines. The goal is to enhance your learning experience, not to bypass it.


## 🌐 **Quick Start Guide:**

**Launch Cloud Shell:**
Start your Google CloudShell session by [clicking here](https://console.cloud.google.com/home/dashboard?project=&pli=1&cloudshell=true).


```bash
export ZONE=
```
- This command sets the zone for your cloud resources. Replace 'ZONE' with the region you want to use, based on the lab instructions.


```bash
curl -LO raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/master/Analyzing%20Network%20Traffic%20with%20VPC%20Flow%20Logs/hustler.sh
```
- This command downloads the setup script from GitHub. The script will help configure the environment and perform necessary setup steps.


```bash
sudo chmod +x hustler.sh
```
- This command gives execution permission to the script so that it can run.

```bash
./hustler.sh
```
- This runs the script to set up your environment for the lab. It will provision resources and configure them as needed.

- Access the web-server 50 times from Cloud Shell:


```bash
export MY_SERVER=$(gcloud compute instances describe web-server --zone "$ZONE" --format='get(networkInterfaces[0].accessConfigs[0].natIP)')
for ((i=1;i<=50;i++)); do curl $MY_SERVER; done
```

---

---

## 🎉 **Lab Completed!**

You've successfully completed the lab! Great job on working through the process.

### 🌟 **Stay Connected!**

- 🔔 **Join our [Telegram Channel](https://t.me/Cloud_Hustlers)** for the latest updates.
- 🗣 **Participate in the [Discussion Group](https://t.me/Cloud_Hustlers)** to engage with other learners.
- 💬 **Join our [Discord Server](https://discord.gg/STKYdjyv)** for more interactive discussions.
- 💼 **Follow us on [LinkedIn](https://www.linkedin.com/company/hustler-linkedin/)** for news and opportunities.
📸 **Follow us on [Instagram](https://www.instagram.com/cloud_hustlers/)** for the latest updates.


---
---


