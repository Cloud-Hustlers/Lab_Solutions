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

# ```Analyze and activate your data with Looker Enterprise```

### First, on the bottom left of the Looker User Interface, click the toggle button to enter Development mode.

![Alt text](https://cdn.qwiklabs.com/uUCbNuedSCOYQmL%2BIubjqvusmGAeS7Wjj3f6xByL174%3D)


***Click the Develop tab and then select the fintech.***

***Now Open fintech.model file and paste the below code.***

```


# Place in `fintech` model
explore: +loan_details {
    query: hustler_task_2 {
      measures: [loan.outstanding_loans_amount]
    }
}



# Place in `fintech` model
explore: +loan_details {
    query: hustler_task_3 {
      dimensions: [loan.loan_status]
      measures: [loan.outstanding_loans_amount]
    }
}




# Place in `fintech` model
explore: +loan_details {
    query: hustler_task_4 {
      dimensions: [loan.state]
      measures: [loan.outstanding_count]
    }
}


# Place in `fintech` model
explore: +loan_details {
    query: hustler_task_5 {
      dimensions: [
        customer.address_state,
        customer.annual_income,
        customer.customer_id,
        customer.home_ownership,
        loan.interest_rate,
        loan.loan_status
      ]
    }
}

```
### Task 2 📊
- **Edit Visualization**: In the Visualization bar, click Edit.
- **Formatting**: In the Edit dropdown menu, select the Formatting tab.
- **Conditional Formatting**: Slide the Enable Conditional Formatting toggle to enable conditional formatting.
- **Add Rule**: In the Rules section, add a rule to change the background color to red if the value is greater than `3000000000`.
- **Run**: Click Run.
- **Save**: Click on Save.
- **Create Dashboard**: In the Create Dashboard dialog, for Name enter `Loan Insights`.
- **Title**: In the Title bar under Edit Tile, enter the following title for the visualization: `Total Amount of Outstanding Loans`.

### Task 3 🥧
- **Visualization Type**: A pie chart.
- **Title**: The visualization should have the title: `Percentage of Outstanding Loans`.

### Task 4 📊
- **Row Limit**: 10.
- **Visualization Type**: A bar chart.
- **Title**: The visualization should have the title: `Total Count of Outstanding Loans`.

### Task 5 📋
- **Row Limit**: 10.
- **Visualization Type**: A table.
- **Annual Income type**: Descending ⬇️
- **Title**: The visualization should have the title: `Top 10 Customers by Highest Income`.

##         ```     Congratulation!!!```
