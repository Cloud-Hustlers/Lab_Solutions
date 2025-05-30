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


# ```Ingesting FHIR Data with the Healthcare API```

### First, exports all the values from task 1 as showed.

```
curl -LO raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/main/Ingesting%20FHIR%20Data%20with%20the%20Healthcare%20API/hustlergsp457.sh

sudo chmod +x hustlergsp457.sh

./hustlergsp457.sh
```

### FHIR Data De-identification and Export to BigQuery

### 🚀 FHIR Data De-identification

1. **Click** the **Actions** button for `fhirstore1`.
2. **From the dropdown**, select **De-identify**.
3. **Select** `dataset1` as the dataset and `de_id` as the destination data store.
4. **Click** **Append** for the pop-up.
5. **Click** **Next**.
6. **Click** **De-identify**.
7. You can view progress in the **Operations tab** in the Console.
8. **Click** on the **Data Stores** tab to view the datastores again once the operation is complete.

    ⏳ **Wait for this operation to complete before moving to the next step.**

## 📤 FHIR Bulk Export

Using **Cloud Shell**, bulk export the FHIR data in `de_id` to the second BigQuery dataset created earlier. 

Before running, ensure that the previous bulk export has completed.

```bash
gcloud healthcare fhir-stores export bq de_id \
  --dataset=$DATASET_ID \
  --location=$LOCATION \
  --bq-dataset=bq://$PROJECT_ID.de_id \
  --schema-type=analytics
```


### 🔍 Exploring Data in BigQuery

1. In the **Cloud Console**, use the **Navigation menu** to open **BigQuery**.
2. In the left pane, under **Resources**, select your **Project ID** and expand the drop-down. You should see the two recently created datasets named `dataset1` and `de_id`.
3. Select `dataset1` and expand the drop-down.
4. Navigate to the **Patient** table and preview the **Schema**.
5. Click the **+ icon** to open a new **Query Editor** tab, then add the following SQL command to view patient data exported from the FHIR stores:

    ```sql
    SELECT
      id AS patient_id,
      name[safe_offset(0)].given AS given_name,
      name[safe_offset(0)].family AS family,
      birthDate AS birth_date
    FROM dataset1.Patient
    LIMIT 10;
    ```

6. **Run** the query to see the results.


## ```Congratulation !!! ```
