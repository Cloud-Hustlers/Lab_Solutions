curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
#!/bin/bash

# Set the base directory
BASE_DIR="/home/iam-abhiraj/Labs_solutions/"

# Find all .sh files with "hustler" in their name under BASE_DIR
find "$BASE_DIR" -type f -name "*hustler*.sh" | while read -r file; do
  dir_name="$(dirname "$file")"
  base_name="$(basename "$file")"
  new_base_name="${base_name//hustler/hustler}"
  new_file_path="$dir_name/$new_base_name"

  echo "Renaming: $file -> $new_file_path"
  mv "$file" "$new_file_path"
done


curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
