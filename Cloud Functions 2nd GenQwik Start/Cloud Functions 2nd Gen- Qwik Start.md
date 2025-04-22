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



# Cloud Functions 2nd Gen: Qwik Start 



## IAM & Admin - Audit Logs Configuration

## Steps:

1. Navigate to IAM & Admin > Audit Logs in the Google Cloud Console.

2. Find the Compute Engine API in the list.

3. Click the checkbox next to the Compute Engine API.

4. In the info pane on the right, perform the following actions:

   - Check the box for **Admin Read** log type.
   
   - Check the box for **Data Read** log type.
   
   - Check the box for **Data Write** log type.

5. Click the **Save** button to apply the changes.

## Result:

The Compute Engine API now has Admin Read, Data Read, and Data Write log types enabled in the Audit Logs configuration.

### Export the ***ZONE*** from task 4

```
export ZONE=
```


###
###

```
curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/master/Cloud%20Functions%202nd%20GenQwik%20Start/task1.sh
sudo chmod +x task1.sh
./task1.sh
```

## ``` Now check the score for TASK 6 After that run the below commands ```


```
export REGION="${ZONE%-*}"
cd min-instances/
curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/master/Cloud%20Functions%202nd%20GenQwik%20Start/task2.sh
sudo chmod +x task2.sh
./task2.sh
```

### Follow the Video once you done with above commands

### Congratulations !!!!

