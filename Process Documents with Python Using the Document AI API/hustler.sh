curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
gsutil cp gs://cloud-training/gsp925/*.ipynb .
python -m pip install --upgrade google-cloud-core google-cloud-documentai google-cloud-storage prettytable --user
gsutil cp gs://cloud-training/gsp925/health-intake-form.pdf form.pdf

export PROJECT_ID="$(gcloud config get-value core/project)"
export BUCKET="${PROJECT_ID}"_doc_ai_async
gsutil mb gs://${BUCKET}
gsutil -m cp gs://cloud-training/gsp925/async/*.* gs://${BUCKET}/input

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
