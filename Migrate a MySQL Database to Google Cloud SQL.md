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


# Migrate a MySQL Database to Google Cloud SQL



Click Activate Cloud Shell Activate Cloud Shell icon at the top of the Google Cloud console.

## EXPORT "ZONE"



## 



```bash
export ZONE=
```

## 



```bash
REGION="${ZONE%-*}"

gcloud sql instances create wordpress --tier=db-n1-standard-1 --activation-policy=ALWAYS --zone $ZONE

gcloud sql users set-password --host % root --instance wordpress --password Password1*

ADDRESS=$(gcloud compute instances describe blog --zone=$ZONE --format="get(networkInterfaces[0].accessConfigs[0].natIP)")/32

gcloud sql instances patch wordpress --authorized-networks $ADDRESS --quiet

gcloud compute ssh "blog" --zone=$ZONE --project=$DEVSHELL_PROJECT_ID --quiet

sudo apt-get update
sudo apt-get install -y mysql-client
```

##

### 


```bash
gcloud auth login --no-launch-browser --quiet

echo 'Password1*' | mysql_config_editor set --login-path=local --host=$MYSQLIP --user=root --password

MYSQLIP=$(gcloud sql instances describe wordpress --format="value(ipAddresses.ipAddress)")

export MYSQL_PWD=Password1*

mysql --host=$MYSQLIP --user=root << EOF
CREATE DATABASE wordpress;
CREATE USER 'blogadmin'@'%' IDENTIFIED BY 'Password1*';
GRANT ALL PRIVILEGES ON wordpress.* TO 'blogadmin'@'%';
FLUSH PRIVILEGES;
EOF

sudo mysqldump -u root -pPassword1* wordpress > wordpress_backup.sql

mysql --host=$MYSQLIP --user=root -pPassword1* --verbose wordpress < wordpress_backup.sql

sudo service apache2 restart

cd /var/www/html/wordpress

EXTERNAL_IP=$(gcloud sql instances describe wordpress --format="value(ipAddresses[0].ipAddress)")

CONFIG_FILE="wp-config.php"

sudo sed -i "s/define('DB_HOST', 'localhost')/define('DB_HOST', '$EXTERNAL_IP')/" $CONFIG_FILE
```

##

##

## Congratulation!!!
