curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



sudo du -a /home | sort -n -r | head -n 5

sudo rm /home/lab/storage/ultra_mega_large.txt


cd /home/lab
sudo rm corrupted_file

echo Y | sudo apt-get install -f 


# Search for malicious processes and extract their PIDs
malicious_pids=$(ps -ef | grep '[t]otally_not_malicious' | awk '{print $2}')

if [ -z "$malicious_pids" ]; then
  echo "No malicious processes found."
  exit 0
fi

for pid in $malicious_pids; do
  echo "Terminating process with PID: $pid"
  sudo kill -9 $pid
done

echo "All identified malicious processes have been terminated."

sudo chmod 777 super_secret_file.txt


curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
