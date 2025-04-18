
## Issue: Several `salt-ssh` modules do not work on newer `3006` versions
Salt targets Python `3.10`, but `salt-ssh` before the [`--relenv` flag](https://github.com/saltstack/salt/pull/66878) was added uses the system version of Python.

The salt `3006.x` branch does not have the `--relenv` feature added and contributions to newer 3006 versions are not compatible with the RockyLinux and RHEL 8 have Python system version `3.6`

Short list of modules not working via `salt-ssh` on `RHEL 8`

| Salt Version | Module | Error | Code | Github Issue |
|-             |-       |-      |-     |-             |
| `3006.9`     | yumpkg |       | https://github.com/saltstack/salt/blob/v3006.9/salt/modules/yumpkg.py#L1427 | https://github.com/saltstack/salt/issues/67091 |


### Solution: Cherry-Pick/Backport `relenv` into `3006.x` branch
TODO: Document Attempt

## Setup a `salt-ssh` test environment
```bash
docker run -it rockylinux:8.9 /bin/bash
#Set our base directory
basedir="/local"
yum install -y wget
# Create the directory for our salt-ssh binary
mkdir -p ${basedir}/bin
cd ${basedir}/bin
wget https://packages.broadcom.com/artifactory/saltproject-generic/onedir/3006.10/salt-3006.10-onedir-linux-x86_64.tar.xz --directory-prefix=${basedir}/bin
yum install -y xz
tar -xvf salt-3006.10-onedir-linux-x86_64.tar.xz --strip-components=1
yum install -y git openssh-server
# Verify salt-ssh works
${basedir}/bin/salt-ssh --version
# Generate Server host keys RSA, ECDSA, ED25519
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ""
ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ""
ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""
# Generate User SSH Keys
mkdir -p ~/.ssh
ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -q -N ""
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
#rm -f /run/nologin
# Start SSH Server
/usr/sbin/sshd
# Test login (need to 'exit', if success)
#ssh -o StrictHostKeyChecking=accept-new localhost
# Create salt config file(s)
mkdir -p ${basedir}/salt/
cat <<EOF > ${basedir}/salt/roster
mytest:
  host: localhost
  priv: /root/.ssh/id_rsa
EOF
# Test salt-ssh minion connectivity
${basedir}/bin/salt-ssh --ignore-host-keys --verbose --roster-file=${basedir}/salt/roster "mytest" --ssh-option="StrictHostKeyChecking=no" test.ping

```

Some convenience/debug commands
```bash
alias ll='ls -lh'
# Cleanup salt-ssh directory
rm -rf /var/tmp/.root_*salt
```


### Other Documentation
[salt-ssh-flags](./salt-ssh-flags.md)
