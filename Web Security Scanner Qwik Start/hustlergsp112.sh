curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



gsutil -m cp -r gs://spls/gsp067/python-docs-samples .

cd python-docs-samples/appengine/standard_python3/hello_world

cat > requirements.txt <<EOF_END
Flask==1.1.2
itsdangerous==2.0.1
Jinja2==3.0.3
werkzeug==2.0.1
EOF_END

cat > app.yaml <<EOF_END
runtime: python39
EOF_END

gcloud app create --region=$REGION

gcloud app deploy --quiet

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
