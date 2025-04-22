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

# **Set Up a Google Cloud Network: Challenge Lab**

### 

```
curl -LO raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/main/Set%20Up%20a%20Google%20Cloud%20Network%3A%20Challenge%20Lab/hustlertask1.sh
sudo chmod +x hustlertask1.sh
./hustlertask1.sh
```
##

```
sudo apt-get update
sudo apt-get install -y postgresql-13-pglogical
sudo su - postgres -c "gsutil cp gs://cloud-training/gsp918/pg_hba_append.conf ."
sudo su - postgres -c "gsutil cp gs://cloud-training/gsp918/postgresql_append.conf ."
sudo su - postgres -c "cat pg_hba_append.conf >> /etc/postgresql/13/main/pg_hba.conf"
sudo su - postgres -c "cat postgresql_append.conf >> /etc/postgresql/13/main/postgresql.conf"
sudo systemctl restart postgresql@13-main
sudo su - postgres
```
##
```
psql
```
##
```
\set user CHANGE_HERE
```
##
```
\c postgres;
```
##
```
CREATE EXTENSION pglogical;
```
###
```
\c orders;
```
##
```
CREATE EXTENSION pglogical;
```
##
```
CREATE DATABASE gmemegen_db;
```
##
```
\c gmemegen_db;
```
##
```
CREATE EXTENSION pglogical;
```
##
```
CREATE USER :user PASSWORD 'DMS_1s_cool!';
GRANT ALL PRIVILEGES ON DATABASE orders TO :user;
ALTER DATABASE orders OWNER TO :user;
ALTER ROLE :user WITH REPLICATION;
```
##

```
\c postgres;
```
##

```
GRANT USAGE ON SCHEMA pglogical TO :user;
GRANT ALL ON SCHEMA pglogical TO :user;
GRANT SELECT ON pglogical.tables TO :user;
GRANT SELECT ON pglogical.depend TO :user;
GRANT SELECT ON pglogical.local_node TO :user;
GRANT SELECT ON pglogical.local_sync_status TO :user;
GRANT SELECT ON pglogical.node TO :user;
GRANT SELECT ON pglogical.node_interface TO :user;
GRANT SELECT ON pglogical.queue TO :user;
GRANT SELECT ON pglogical.replication_set TO :user;
GRANT SELECT ON pglogical.replication_set_seq TO :user;
GRANT SELECT ON pglogical.replication_set_table TO :user;
GRANT SELECT ON pglogical.sequence_state TO :user;
GRANT SELECT ON pglogical.subscription TO :user;
```

##
```
\c orders;
```
##
```
GRANT USAGE ON SCHEMA pglogical TO :user;
GRANT ALL ON SCHEMA pglogical TO :user;
GRANT SELECT ON pglogical.tables TO :user;
GRANT SELECT ON pglogical.depend TO :user;
GRANT SELECT ON pglogical.local_node TO :user;
GRANT SELECT ON pglogical.local_sync_status TO :user;
GRANT SELECT ON pglogical.node TO :user;
GRANT SELECT ON pglogical.node_interface TO :user;
GRANT SELECT ON pglogical.queue TO :user;
GRANT SELECT ON pglogical.replication_set TO :user;
GRANT SELECT ON pglogical.replication_set_seq TO :user;
GRANT SELECT ON pglogical.replication_set_table TO :user;
GRANT SELECT ON pglogical.sequence_state TO :user;
GRANT SELECT ON pglogical.subscription TO :user;
GRANT USAGE ON SCHEMA public TO :user;
GRANT ALL ON SCHEMA public TO :user;
GRANT SELECT ON public.distribution_centers TO :user;
GRANT SELECT ON public.inventory_items TO :user;
GRANT SELECT ON public.order_items TO :user;
GRANT SELECT ON public.products TO :user;
GRANT SELECT ON public.users TO :user;
```
##
```
\c gmemegen_db;
```
##
```
GRANT USAGE ON SCHEMA pglogical TO :user;
GRANT ALL ON SCHEMA pglogical TO :user;
GRANT SELECT ON pglogical.tables TO :user;
GRANT SELECT ON pglogical.depend TO :user;
GRANT SELECT ON pglogical.local_node TO :user;
GRANT SELECT ON pglogical.local_sync_status TO :user;
GRANT SELECT ON pglogical.node TO :user;
GRANT SELECT ON pglogical.node_interface TO :user;
GRANT SELECT ON pglogical.queue TO :user;
GRANT SELECT ON pglogical.replication_set TO :user;
GRANT SELECT ON pglogical.replication_set_seq TO :user;
GRANT SELECT ON pglogical.replication_set_table TO :user;
GRANT SELECT ON pglogical.sequence_state TO :user;
GRANT SELECT ON pglogical.subscription TO :user;
```
##
```
\c orders;
\dt
```
##
```
ALTER TABLE public.distribution_centers OWNER TO :user;
ALTER TABLE public.inventory_items OWNER TO :user;
ALTER TABLE public.order_items OWNER TO :user;
ALTER TABLE public.products OWNER TO :user;
ALTER TABLE public.users OWNER TO :user;
\dt
```
##
```
ALTER TABLE public.inventory_items ADD PRIMARY KEY(id);
\q 
```
## Need to run exit command 2 times
```
exit
```
##
```
curl -LO raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/main/Set%20Up%20a%20Google%20Cloud%20Network%3A%20Challenge%20Lab/hustlerip.sh
sudo chmod +x hustlerip.sh
./hustlerip.sh
```

## Task 2: Update permissions and add IAM roles to users

```
export USER1=

export USER2=

export USER3=
```
##

```
curl -LO raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/main/Set%20Up%20a%20Google%20Cloud%20Network%3A%20Challenge%20Lab/hustlertask2.sh
sudo chmod +x hustlertask2.sh
./hustlertask2.sh
```
##

## Task 3: Create networks and firewalls

## **Switch to 2nd project id as shown in video**
## **Login with CYMBLE OWNER credentials**

```
gcloud auth login --quiet
```
##
```
export VPC_NAME=

export SUBNET1=

export REGION1=

export SUBNET2=

export REGION2=

export RULE_NAME1=

export RULE_NAME2=

export RULE_NAME3=
```
##
```
curl -LO raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/main/Set%20Up%20a%20Google%20Cloud%20Network%3A%20Challenge%20Lab/hustlertask3.sh
sudo chmod +x hustlertask3.sh
./hustlertask3.sh
```
##

## Task 4: Troubleshoot and fix a broken GKE cluster

```
export SINK_NAME=

export USER1=

export USER2=
```
##
```
curl -LO raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/main/Set%20Up%20a%20Google%20Cloud%20Network%3A%20Challenge%20Lab/hustlertask4.sh
sudo chmod +x hustlertask4.sh
./hustlertask4.sh
```

## Now Follow the video and complete the Task 1






### **Congratulations:-)**
