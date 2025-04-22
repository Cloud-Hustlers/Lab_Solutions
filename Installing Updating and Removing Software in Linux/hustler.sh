curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


dpkg -s firefox-esr

dpkg -s gimp

dpkg -s vlc

echo 'Y' | sudo apt-get install -f 

dpkg -s vlc

sudo apt-get update

echo 'Y' | sudo apt-get install firefox-esr

dpkg -s firefox-esr

echo 'Y' | sudo apt-get remove gimp

dpkg -s gimp

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
