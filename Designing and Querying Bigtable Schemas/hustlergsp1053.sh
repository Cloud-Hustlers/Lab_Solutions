curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


echo project = `gcloud config get-value project` \
    >> ~/.cbtrc

cbt listinstances

echo instance = personalized-sales \
    >> ~/.cbtrc


cat ~/.cbtrc

cbt createtable test-sessions

cbt createfamily test-sessions Interactions

cbt createfamily test-sessions Sales

cbt ls test-sessions


cbt read test-sessions


curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
