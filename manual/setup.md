### Dependencies:
```
zypper in -y caddy curl git libgthread-2_0-0 Mesa python310 screen
```

### Firewall:
```
firewall-cmd --permanent --add-service=ssh --add-service=http --add-service=https
systemctl restart firewalld
```

### Proxy:
Customize Variables:
```
set +H
uname=user
phash=$(caddy hash-password --plaintext password)
hname=diffusion
domain=diffusion.local
```
```
systemctl enable --now caddy

cat <<EOL > /etc/caddy/Caddyfile
{
  local_certs
}

$hname, diffusion.$domain {
  basicauth * {
    $uname $phash
  }
  reverse_proxy localhost:7860
}

focus.$domain {
  basicauth * {
    $uname $phash
  }
  reverse_proxy localhost:7865
}
EOL
cat /etc/caddy/Caddyfile

systemctl restart caddy
```
