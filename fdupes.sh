cd dedupe
#docker run -it -v ./output:/app:ro rockylinux:8.9 /bin/bash
# Stupid window fix below
docker run -it -v .\output\:/app/foo:ro rockylinux:8.9 /bin/bash

dnf install -y epel-release
dnf install -y fdupes

# Below not work, app dir mount issue?
fdupes -r /app/
# 
fdupes --recurse --size /app/ > dedupe_report.txt
# 44,085 files

# Deduplicate recursively, delete duplicates, keep first copy (non-interactive)
#fdupes -rdN /app/
