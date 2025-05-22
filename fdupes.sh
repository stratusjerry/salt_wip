cd dedupe
docker run -it -v ./output:/app:ro rockylinux:8.9 /bin/bash

dnf install -y epel-release
dnf install -y fdupes

# Below not work, app dir mount issue?
fdupes -r /app/

# Deduplicate recursively, delete duplicates, keep first copy (non-interactive)
fdupes -rdN /app/
