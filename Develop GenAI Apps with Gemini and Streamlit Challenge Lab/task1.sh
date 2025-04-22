curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


PROJECT_ID=`gcloud config get-value project`

export PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format="value(projectNumber)")








gcloud auth list

gcloud services enable run.googleapis.com

git clone https://github.com/GoogleCloudPlatform/generative-ai.git

cd generative-ai/gemini/sample-apps/gemini-streamlit-cloudrun

gsutil cp gs://spls/gsp517/chef.py .

GCP_PROJECT=$PROJECT_ID
GCP_REGION=$REGION

rm -rf Dockerfile chef.py requirements.txt

wget https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/master/Develop%20GenAI%20Apps%20with%20Gemini%20and%20Streamlit%20Challenge%20Lab/Dockerfile.txt

wget https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/master/Develop%20GenAI%20Apps%20with%20Gemini%20and%20Streamlit%20Challenge%20Lab/chef.py

wget https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/master/Develop%20GenAI%20Apps%20with%20Gemini%20and%20Streamlit%20Challenge%20Lab/requirements.txt

mv Dockerfile.txt Dockerfile

gcloud storage cp chef.py gs://$DEVSHELL_PROJECT_ID-generative-ai/



pip install google-cloud-aiplatform


# curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/master/Develop%20GenAI%20Apps%20with%20Gemini%20and%20Streamlit%20Challenge%20Lab/bonustask.sh
# sudo chmod +x bonustask.sh
# ./bonustask.sh

python3 -m venv gemini-streamlit
source gemini-streamlit/bin/activate
python3 -m  pip install -r requirements.txt


streamlit run chef.py \
  --browser.serverAddress=localhost \
  --server.enableCORS=false \
  --server.enableXsrfProtection=false \
  --server.port 8080

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
