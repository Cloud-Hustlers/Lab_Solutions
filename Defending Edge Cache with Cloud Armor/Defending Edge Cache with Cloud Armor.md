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

# Defending Edge Cache with Cloud Armor

##

```
export REGION=
```


```
curl -LO raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/main/Defending%20Edge%20Cache%20with%20Cloud%20Armor/hustlertask1.sh

sudo chmod +x hustlertask1.sh

./hustlertask1.sh
```

```
LOAD_BALANCER_IP=$(gcloud compute forwarding-rules list --project=$DEVSHELL_PROJECT_ID --format='value(IP_ADDRESS)')

curl -svo /dev/null http://$LOAD_BALANCER_IP/google.png

for i in `seq 1 50`; do curl http://$LOAD_BALANCER_IP/google.png; done

```

### ***```Note: It might take up to 5 minutes to access the HTTP Load Balancer.```*** 

### ```Now Check the score for First 2 Task  & then go ahead with next Commands otherwise you won't get a score.```

##



```
curl -LO raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/main/Defending%20Edge%20Cache%20with%20Cloud%20Armor/hustlertask2.sh

sudo chmod +x hustlertask2.sh

./hustlertask2.sh
```


```
curl -svo /dev/null http://$LOAD_BALANCER_IP/google.png

gcloud logging read 'resource.type="http_load_balancer" AND jsonPayload.@type="type.googleapis.com/google.cloud.loadbalancing.type.LoadBalancerLogEntry" AND severity>=WARNING' --project=$DEVSHELL_PROJECT_ID --format="json"
```

### ***```Note: It might take up to 5 minutes to so the output so just re-run the aboce commands.```*** 

### Congratulation!!!
