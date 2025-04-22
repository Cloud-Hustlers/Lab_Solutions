![API Gateway Banner](https://raw.githubusercontent.com/Cloud-Hustlers/content/f9a8642976ea21cd234c91239431e41f05264842/gif/12.gif)

<div align="center">
  
# Connect with Cloud Hustlers Community
</div>

<p align="center">
  <a href="https://whatsapp.cloudhustlers.in" target="_blank">
    <img src="https://raw.githubusercontent.com/Cloud-Hustlers/content/main/gif/whatsapp.gif" alt="WhatsApp" width="80">
  </a>
  <a href="https://in.linkedin.com/company/cloud-hustlers" target="_blank">
    <img src="https://raw.githubusercontent.com/Cloud-Hustlers/content/main/gif/linkedin%20gif.gif" alt="LinkedIn" width="80">
  </a>
  <a href="https://www.youtube.com/@CloudHustlers" target="_blank">
    <img src="https://raw.githubusercontent.com/Cloud-Hustlers/content/main/gif/youtube.png" alt="Youtube" width="80">
  </a>
  <a href="https://instagram.com/cloud_hustlers" target="_blank">
    <img src="https://raw.githubusercontent.com/Cloud-Hustlers/content/main/gif/insta.gif" alt="Instagram" width="80">
  </a>
  <a href="https://discord.gg/MdbVq7BJNd" target="_blank">
    <img src="https://raw.githubusercontent.com/Cloud-Hustlers/content/main/gif/discord.gif" alt="GitHub" width="80">
  </a>
</p>

##  Work with Python Scripts



```bash
cd scripts

sudo chmod +x health_checks.py

./health_checks.py
```

###  Check the score for task 1.

###

```bash
cat > health_checks.py <<EOF_END
#!/usr/bin/env python3

import shutil
import psutil

def check_disk_usage(disk):
  """Verifies that there's enough free space on disk"""
  du = shutil.disk_usage(disk)
  free = du.free / du.total * 100
  return free > 20

def check_cpu_usage():
  """Verifies that there's enough unused CPU"""
  usage = psutil.cpu_percent(1)
  return usage < 75  # Change '>' to '<' to return True if CPU usage is less than 75%

# If there's not enough disk, or not enough CPU, print an error
if not check_disk_usage('/') or not check_cpu_usage():
  print("ERROR!")
else:
  print("Everything ok")

EOF_END

./health_checks.py
```

###  Check the score for task 2.

###

```bash
sudo apt install python3-requests -y
```
####
```bash
cat > network.py <<EOF_END
#!/usr/bin/env python3

import requests
import socket

def check_localhost():
    localhost = socket.gethostbyname('localhost')
    return localhost == '127.0.0.1'

def check_connectivity():
    try:
        request = requests.get("http://www.google.com")
        return request.status_code == 200
    except requests.ConnectionError:
        return False

if __name__ == "__main__":
    if check_localhost():
        print("Localhost is correctly configured.")
    else:
        print("Localhost is not correctly configured.")

    if check_connectivity():
        print("Internet connectivity is available.")
    else:
        print("No internet connectivity.")

EOF_END
```

###  Check the score for task 3.

###
```bash
cat > health_checks.py <<EOF_END
#!/usr/bin/env python3

import shutil
import psutil
from network import *

def check_disk_usage(disk):
  """Verifies that there's enough free space on disk"""
  du = shutil.disk_usage(disk)
  free = du.free / du.total * 100
  return free > 20

def check_cpu_usage():
  """Verifies that there's enough unused CPU"""
  usage = psutil.cpu_percent(1)
  return usage < 75  # Change '>' to '<' to return True if CPU usage is less than 75%

# If there's not enough disk, or not enough CPU, print an error
if not check_disk_usage('/') or not check_cpu_usage():
  print("ERROR!")
elif check_localhost() and check_connectivity():
    print("Everything ok")
else:
    print("Network checks failed")

EOF_END

./health_checks.py
```
###  Check the score for task 4.

###  Congratulation !!!


