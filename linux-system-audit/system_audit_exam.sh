
#!/bin/bash

# Define target directory
TARGET_DIR="/home/zahra/Desktop/exam_results/audit"

# Step 1: Setup
mkdir -p "$TARGET_DIR"
touch "$TARGET_DIR/notes.txt"
pwd > "$TARGET_DIR/cwd.txt"

# Step 2: User analysis
awk -F: '{print $1}' /etc/passwd > "$TARGET_DIR/users.txt"
grep '/bin/bash' /etc/passwd |cut -d: -f1 > "$TARGET_DIR/bash_users.txt"
sed 's|/bin/bash|/usr/bin/zsh|' /etc/passwd | head -n 5 > "$TARGET_DIR/shell_preview.txt"

# Step 3: System info
uname -sr > "$TARGET_DIR/sysinfo.txt"
arch >> "$TARGET_DIR/sysinfo.txt"
head -n 3 /etc/group > "$TARGET_DIR/group_summary.txt"
tail -n 2 /etc/group >> "$TARGET_DIR/group_summary.txt"

# Step 4: Config and log files
find /etc -type f -name "*.conf" 2>/dev/null > "$TARGET_DIR/conf_files.txt"
ls -lhS /var/log 2>/dev/null | head -n 10 > "$TARGET_DIR/top_logs.txt"

# Step 5: Permissions
cp /etc/hosts "$TARGET_DIR/hosts.bak"
chmod 600 "$TARGET_DIR/hosts.bak"
ls -l "$TARGET_DIR/hosts.bak" > "$TARGET_DIR/hosts_perm.txt"

# Step 6: Cleanup (delete all .txt except notes.txt and hosts_perm.txt)
find "$TARGET_DIR" -type f -name "*.txt" ! -name "notes.txt" ! -name "hosts_perm.txt" -exec rm {} \;

echo "System audit complete. Files saved in $TARGET_DIR"


