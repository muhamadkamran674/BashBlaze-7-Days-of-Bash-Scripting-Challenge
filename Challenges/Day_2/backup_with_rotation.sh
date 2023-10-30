
#!/bin/bash

# Check if the user provided a directory path as an argument
if [ $# -ne 1 ]; then # $# is a special variable in Bash that represents the number of command-line arguments passed to the script or function
  echo "Usage: $0 <directory>" # directory is /home/master/Desktop/Bash_7_Days_Challenge
  exit 1
fi

# Get the current timestamp in YYYY-MM-DD-HHMMSS format
timestamp=$(date +'%Y-%m-%d-%H%M%S')



# Define the backup directory path
backup_dir="/home/master/Desktop/Backup"

# Check if the backup directory exists, create it if not
if [ ! -d "$backup_dir" ]; then
  mkdir -p "$backup_dir"
fi

# Create a new backup folder with the timestamp
backup_folder="$backup_dir/$timestamp"
mkdir "$backup_folder"

# Copy all files from the specified directory to the backup folder
cp -r "$1"/* "$backup_folder"

# List all backup folders, sort them by name (oldest first), and keep the last 3
backup_list=$(find "$backup_dir" -type d -name '[0-9]*' | sort)
num_backups=$(echo "$backup_list" | wc -l)

if [ $num_backups -gt 3 ]; then
  num_to_delete=$((num_backups - 3))
  backups_to_delete=$(echo "$backup_list" | head -n $num_to_delete)

  for backup_to_delete in $backups_to_delete; do
    rm -rf "$backup_to_delete"
  done
fi

echo "Backup completed: $timestamp"
