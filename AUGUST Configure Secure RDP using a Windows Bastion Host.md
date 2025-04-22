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


# Configure Secure RDP using a Windows Bastion Host

Click Activate Cloud Shell Activate Cloud Shell icon at the top of the Google Cloud console.

## EXPORT "ZONE"



## 



```bash
export ZONE=
```

## 



```bash
REGION="${ZONE%-*}"

gcloud compute networks create securenetwork --project=$DEVSHELL_PROJECT_ID --subnet-mode=custom --mtu=1460 --bgp-routing-mode=regional && gcloud compute networks subnets create securenetwork-subnet --project=$DEVSHELL_PROJECT_ID --range=10.0.0.0/24 --stack-type=IPV4_ONLY --network=securenetwork --region=$REGION

gcloud compute --project=$DEVSHELL_PROJECT_ID firewall-rules create secuer-firewall --direction=INGRESS --priority=1000 --network=securenetwork --action=ALLOW --rules=tcp:3389 --source-ranges=0.0.0.0/0 --target-tags=allow-rdp-traffic

gcloud compute instances create vm-securehost --project=$DEVSHELL_PROJECT_ID --zone=$ZONE --machine-type=e2-small --network-interface=stack-type=IPV4_ONLY,subnet=securenetwork-subnet,no-address --network-interface=stack-type=IPV4_ONLY,subnet=default,no-address --metadata=enable-oslogin=true --maintenance-policy=MIGRATE --provisioning-model=STANDARD --tags=allow-rdp-traffic --create-disk=auto-delete=yes,boot=yes,device-name=vm-securehost,image=projects/windows-cloud/global/images/windows-server-2016-dc-v20230510,mode=rw,size=150,type=projects/$DEVSHELL_PROJECT_ID/zones/$ZONE/diskTypes/pd-standard --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --labels=goog-ec-src=vm_add-gcloud --reservation-affinity=any

gcloud compute instances create vm-bastionhost --project=$DEVSHELL_PROJECT_ID --zone=$ZONE --machine-type=e2-standard-2 --network-interface=subnet=securenetwork-subnet --network-interface=subnet=default,no-address --tags=allow-rdp-traffic --image=projects/windows-cloud/global/images/windows-server-2016-dc-v20220513
```

##

### Reset the password of vm-bastionhost 


```bash
gcloud compute reset-windows-password vm-securehost --user app_admin --zone $ZONE --quiet
```

##

##

## Congratulation!!!
