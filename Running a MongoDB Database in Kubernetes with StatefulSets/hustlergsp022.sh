curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh


gcloud config set compute/zone $ZONE

gcloud container clusters create hello-world --num-nodes=2

gsutil -m cp -r gs://spls/gsp022/mongo-k8s-sidecar .

cd ./mongo-k8s-sidecar/example/StatefulSet/

kubectl apply -f googlecloud_ssd.yaml

rm mongo-statefulset.yaml

## add file
curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/master/Running%20a%20MongoDB%20Database%20in%20Kubernetes%20with%20StatefulSets/mongo-statefulset.yaml

kubectl apply -f mongo-statefulset.yaml

kubectl get statefulset

sleep 120

kubectl scale --replicas=5 statefulset mongo

sleep 100

kubectl scale --replicas=3 statefulset mongo

sleep 60

kubectl get pods

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
