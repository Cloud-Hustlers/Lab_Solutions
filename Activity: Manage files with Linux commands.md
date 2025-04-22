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




##  Activity: Manage files with Linux commands




***Start the lab and run the below commands***


```bash
# Create the 'logs' subdirectory
mkdir /home/analyst/logs

# List the contents of the '/home/analyst' directory
ls /home/analyst



# Remove the 'temp' directory
rm -r /home/analyst/temp

# List the contents of the '/home/analyst' directory to confirm
ls /home/analyst



# Navigate to the /home/analyst/notes directory
cd /home/analyst/notes

# Move the Q3patches.txt file to the /home/analyst/reports directory
mv Q3patches.txt /home/analyst/reports

# List the contents of the /home/analyst/reports directory to confirm
ls /home/analyst/reports



# Remove the tempnotes.txt file from the /home/analyst/notes directory
rm /home/analyst/notes/tempnotes.txt

# List the contents of the /home/analyst/notes directory to confirm
ls /home/analyst/notes



# Use the touch command to create the tasks.txt file in the /home/analyst/notes directory
touch /home/analyst/notes/tasks.txt

# List the contents of the /home/analyst/notes directory to confirm
ls /home/analyst/notes




cat > tasks.txt <<EOF_END
  Completed tasks
  1. Managed file structure in /home/analyst
EOF_END

cat tasks.txt
```

## Congratulations !!!
