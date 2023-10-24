#!/bin/bash
# combustion: network

growpart /dev/vda 3
btrfs filesystem resize max /
mount -o subvol=@/var /dev/vda3 /var
mount -o subvol=@/home /dev/vda3 /home

echo 'root:HASHchangeME' | chpasswd -e
useradd admin
echo 'admin:HASHchangeME' | chpasswd -e
echo 'diffusion' > /etc/hostname

zypper in -y caddy cifs-utils cron curl git libgthread-2_0-0 Mesa python310 screen zram-generator

zypper -n addrepo https://developer.download.nvidia.com/compute/cuda/repos/opensuse15/x86_64/cuda-opensuse15.repo
zypper --gpg-auto-import-keys refresh
zypper install -ly cuda
usermod -a -G video admin

cat <<'EOL' > /etc/systemd/zram-generator.conf
[zram0]

zram-size = ram
compression-algorithm = zstd
EOL

cd /home/admin
curl -O https://raw.githubusercontent.com/HPPinata/sd-autoinstall/main/scripts/setup.bash
chmod +x setup.bash

curl -O https://raw.githubusercontent.com/HPPinata/sd-autoinstall/main/scripts/automatic.bash
chown admin:admin automatic.bash
