cd dedupe
#docker run -it -v ./output:/app:ro rockylinux:8.9 /bin/bash
# Stupid window fix below
docker run -it -v .\output\:/app/foo:ro rockylinux:8.9 /bin/bash

dnf install -y epel-release
dnf install -y fdupes

# Size pre dedupe (7,239,936 including vscode-server-linux-x64.tar.gz)
du --summarize /app/ > du_report_pre_dedupe # 5,470,084
# Below not work, app dir mount issue?
fdupes -r /app/
#  44,085 files including vscode-server-linux-x64.tar.gz
fdupes --recurse --size /app/ > dedupe_report.txt

# fdupes on RHEL doesn't support hardlinking and deleting dupes, try rdfind
# Deduplicate recursively, delete duplicates, keep first copy (non-interactive)
#fdupes -rdN /app/
#fdupes --recurse --delete --noprompt
# Insall rdfind
sudo dnf install -y git gcc make automake autoconf libtool
cd /tmp/
git clone https://github.com/pauldreik/rdfind.git
cd rdfind
sudo dnf install -y gcc-c++
./bootstrap.sh
sudo dnf install -y nettle-devel
./configure # configure the build
CXXFLAGS='-std=c++17' ./configure # Run config passing in required C++17 flags
make # make the binary
sudo make install
cd # to wherever "dedupe" folder is
rdfind --version
rdfind -dryrun true ./ # creates "results.txt", shows 4GiB reduction, 42,153 files not unique
rdfind -makehardlinks true ./
du --summarize # 1,448,992
find ./ -type f -links +1 -printf '%i %p\n' | sort | uniq -w 10 -D # Find hardlinked files

