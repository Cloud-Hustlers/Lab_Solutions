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



# Integrating Cloud Functions with Firestore


### Set up Firestore

- Navigation **Firestore**
- Click **Create Database**
- Click **Native mode (recommended)**, and then click **Continue**
- Choose **Region** from lab
- For Secure rules, select **Test** rules

### Create and Save a Collection

1. **Click** `Start collection`.

2. **Fill in the details** as follows, then click **Save**:

   - **Collection ID**: `customers`
   - **Document ID**: **`Randomly Genarate`**

3. **Add Fields** to the collection:

   - **Field name**: `firstname`
     - **Field type**: `string`
     - **Field value**: `Lucas`

   - Click the **Add a Field (+)** button to add another field:

     - **Field name**: `lastname`
       - **Field type**: `string`
       - **Field value**: `Sherman`


4. **Click Save** to finalize the collection.

---
#

Open the **Cloud Shell** terminal window.

```
export REGION=
```

```bash
curl -LO raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/main/Integrating%20Cloud%20Functions%20with%20Firestore/hustler.sh
sudo chmod +x hustler.sh
./hustler.sh
```

---

## Wait for command to execute. 

### Now Delete the old field and again create the same.

 **Field name**: `lastname`
 - **Field type**: `string`
 - **Field value**: `Sherman`


---

## 🎉 Congratulations !!!

---

