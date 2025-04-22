curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
curl -sL https://firebase.tools | bash

cd ~/my_hugo_site
firebase init

#add screenshot

/tmp/hugo && firebase deploy


git config --global user.name "hugo"
git config --global user.email "hugo@blogger.com"

cd ~/my_hugo_site
echo "resources" >> .gitignore

git add .
git commit -m "Add app to Cloud Source Repositories"
git push -u origin master

cd ~/my_hugo_site
cp /tmp/cloudbuild.yaml .

gcloud builds connections create github cloud-build-connection --project=$PROJECT_ID  --region=$REGION 

gcloud builds connections describe cloud-build-connection --region=$REGION 

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
