curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

echo ""
echo ""
echo "Please export the values."


# Prompt user to input three regions
read -p "Enter REGION: " REGION


gsutil cp gs://spls/gsp499/user-authentication-with-iap.zip .

unzip user-authentication-with-iap.zip

cd user-authentication-with-iap

cd 1-HelloWorld

sed -i 's/python37/python39/g' app.yaml

gcloud app create --region=$REGION


deploy_function() {
  yes | gcloud app deploy
}

deploy_success=false

while [ "$deploy_success" = false ]; do
  if deploy_function; then
    echo "Function deployed successfully."
    deploy_success=true
  else
    echo "While Waiting Subscribe to CloudHustlers[https://www.youtube.com/@CloudHustlers]"
    sleep 10
  fi
done

cd ~/user-authentication-with-iap/2-HelloUser

sed -i 's/python37/python39/g' app.yaml

deploy_function() {
  yes | gcloud app deploy
}

deploy_success=false

while [ "$deploy_success" = false ]; do
  if deploy_function; then
    echo "Function deployed successfully."
    deploy_success=true
  else
    echo "While Waiting Subscribe to CloudHustlers[https://www.youtube.com/@CloudHustlers]"
    sleep 10
  fi
done

cd ~/user-authentication-with-iap/3-HelloVerifiedUser

sed -i 's/python37/python39/g' app.yaml

deploy_function() {
  yes | gcloud app deploy
}

deploy_success=false

while [ "$deploy_success" = false ]; do
  if deploy_function; then
    echo "Function deployed successfully."
    deploy_success=true
  else
    echo "While Waiting Subscribe to CloudHustlers[https://www.youtube.com/@CloudHustlers]"
    sleep 10
  fi
done


# ANSI escape codes for bold and green
BOLD_GREEN="\033[1;32m"
BOLD_RED="\033[1;31m"
RESET="\033[0m"

# Print the URL in bold and green
echo -e "${BOLD_RED}OAuth consent screen: ${BOLD_GREEN}https://console.cloud.google.com/apis/credentials/consent?${RESET}"

# Print the URL in bold and green
echo -e "${BOLD_RED}Identity-Aware Proxy: ${BOLD_GREEN}https://console.cloud.google.com/security/iap?${RESET}"

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
