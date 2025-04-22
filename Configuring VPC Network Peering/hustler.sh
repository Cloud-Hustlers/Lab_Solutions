curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/master/Configuring%20VPC%20Network%20Peering/task1.sh

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/master/Configuring%20VPC%20Network%20Peering/task2.sh

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/master/Configuring%20VPC%20Network%20Peering/task3.sh

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/master/Configuring%20VPC%20Network%20Peering/task4.sh

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/Lab_Solutions/refs/heads/master/Configuring%20VPC%20Network%20Peering/task5.sh

chmod +x task1.sh
chmod +x task2.sh
chmod +x task3.sh
chmod +x task4.sh
chmod +x task5.sh

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
