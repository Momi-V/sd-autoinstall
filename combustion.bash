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
systemctl enable caddy

cat <<'EOL' > /etc/systemd/zram-generator.conf
[zram0]

zram-size = ram
compression-algorithm = zstd
EOL

cat <<'EOF' > /root/setup.bash
uname=user
set +H
phash=$(caddy hash-password --plaintext password)
hname=diffusion
domain=diffusion.local

cat <<EOL > /etc/caddy/Caddyfile
{
  local_certs
}

$hname, $domain {
  basicauth * {
    $uname $phash
  }
  reverse_proxy localhost:7860
}
EOL
cat /etc/caddy/Caddyfile

systemctl restart caddy
EOF
