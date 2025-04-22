curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

cd ~
/tmp/installhugo.sh

sudo apt-get update -y
sudo apt-get install git -y

cd ~
gcloud source repos create my_hugo_site
gcloud source repos clone my_hugo_site


cd ~
/tmp/hugo new site my_hugo_site --force

cd ~/my_hugo_site
git clone \
  https://github.com/rhazdon/hugo-theme-hello-friend-ng.git themes/hello-friend-ng
echo 'theme = "hello-friend-ng"' >> config.toml

sudo rm -r themes/hello-friend-ng/.git
sudo rm themes/hello-friend-ng/.gitignore 

cd ~/my_hugo_site
/tmp/hugo server -D --bind 0.0.0.0 --port 8080

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
