curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
gcloud config set compute/region $REGION
export PROJECT_ID=$(gcloud config get-value project)


mkdir hustler && cd hustler

cat > index.js <<'EOF_END'
const functions = require('@google-cloud/functions-framework');

// Register an HTTP function with the Functions Framework that will be executed
// when you make an HTTP request to the deployed function's endpoint.
functions.http('helloGET', (req, res) => {
  res.send('Subscribe to CloudHustlers!');
});
EOF_END

cat > package.json <<EOF_END
"dependencies": {
  "@google-cloud/functions-framework": "^3.1.0"
}

EOF_END

gcloud functions deploy cf-demo \
  --gen2 \
  --runtime=nodejs20 \
  --region=$REGION \
  --source=. \
  --entry-point=helloGET \
  --trigger-http \
  --allow-unauthenticated \
  --quiet


curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
