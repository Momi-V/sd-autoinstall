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

zypper in -y caddy cifs-utils cron curl git libgthread-2_0-0 Mesa python310 zram-generator

cat <<'EOL' > /etc/systemd/zram-generator.conf
[zram0]

zram-size = ram
compression-algorithm = zstd
EOL

cd /home/admin
curl -O https://raw.githubusercontent.com/HPPinata/sd-autoinstall/main/setup.bash
chmod +x

curl -O https://raw.githubusercontent.com/HPPinata/sd-autoinstall/main/automatic.bash
chown admin:admin
