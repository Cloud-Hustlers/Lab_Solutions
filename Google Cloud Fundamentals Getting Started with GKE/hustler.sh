curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh




echo ""
echo ""

read -p "MY_ZONE: " MY_ZONE

gcloud container clusters create webfrontend --zone $MY_ZONE --num-nodes 2

kubectl create deploy nginx --image=nginx:1.17.10

kubectl get pods

kubectl expose deployment nginx --port 80 --type LoadBalancer

kubectl scale deployment nginx --replicas 3

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
