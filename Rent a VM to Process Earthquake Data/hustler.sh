curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


#!/bin/bash

# Update the package list
sudo apt-get update

# Install git
sudo apt-get -y -qq install git

# Install python-mpltoolkits.basemap
sudo apt-get install python-mpltoolkits.basemap -y

# Check Git version
git --version

# Clone the repository
git clone https://github.com/GoogleCloudPlatform/training-data-analyst

# Navigate to the appropriate directory
cd training-data-analyst/CPB100/lab2b

# Run the necessary scripts
bash ingest.sh
bash install_missing.sh
python3 transform.py

# List the files in the directory
ls -l

export DEVSHELL_PROJECT_ID=$(gcloud config get-value project)

# Copy files to Google Cloud Storage
gsutil cp earthquakes.* gs://$DEVSHELL_PROJECT_ID/earthquakes/

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
