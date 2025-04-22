curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh








export REGION="${ZONE%-*}"


gcloud container clusters get-credentials hello-demo-cluster --zone $ZONE

kubectl scale deployment hello-server --replicas=2

gcloud container clusters resize hello-demo-cluster --node-pool my-node-pool \
    --num-nodes 3 --zone $ZONE --quiet

gcloud container node-pools create larger-pool \
  --cluster=hello-demo-cluster \
  --machine-type=e2-standard-2 \
  --num-nodes=1 \
  --zone=$ZONE

gcloud container node-pools delete my-node-pool --cluster hello-demo-cluster --zone $ZONE --quiet

gcloud container clusters create regional-demo --region=$REGION --num-nodes=1

cat << EOF > pod-1.yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-1
  labels:
    security: demo
spec:
  containers:
  - name: container-1
    image: wbitt/network-multitool
EOF

kubectl apply -f pod-1.yaml

cat << EOF > pod-2.yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-2
spec:
  affinity:
    podAntiAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
      - labelSelector:
          matchExpressions:
          - key: security
            operator: In
            values:
            - demo
        topologyKey: "kubernetes.io/hostname"
  containers:
  - name: container-2
    image: gcr.io/google-samples/node-hello:1.0
EOF

kubectl apply -f pod-2.yaml

sleep 30

kubectl get pod pod-1 pod-2 --output wide













curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
