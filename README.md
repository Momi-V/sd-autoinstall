# cmdr2

### Dependencies:
```
zypper in -y libgthread-2_0-0
zypper in -y libgthread-2_0-0 wget unzip tar bzip2 which nano #container
```

### Firewall:
```
firewall-cmd --permanent --new-service diffusion
firewall-cmd --permanent --service diffusion --add-port 9000/tcp
firewall-cmd --permanent --add-service diffusion
systemctl restart firewalld
```

### Repository:
```
wget https://github.com/cmdr2/stable-diffusion-ui/releases/download/v2.4.13/stable-diffusion-ui-linux.zip
unzip stable-diffusion-ui-linux.zip
```

### Start:
```
./stable-diffusion-ui/start.sh
```

# 1111

### Dependencies:
```
zypper in -y wget git python3
zypper in -y libgthread-2_0-0
zypper in -y caddy
zypper in -y Mesa #WSL
```

### Firewall:
```
firewall-cmd --permanent --add-service=ssh --add-service=http --add-service=https
systemctl restart firewalld
```

### Proxy:
```
uname=user
phash=$(caddy hash-password --plaintext password)
hname=diffusion
domain=diffusion.local
```
```
systemctl enable --now caddy

cat <<"EOL" > /etc/caddy/Caddyfile
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
```

### Repository:
```
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
cd stable-diffusion-webui
```

### Download:
```
wget https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt
wget https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.ckpt
mv v1-5-pruned-emaonly.ckpt models/Stable-diffusion/
mv vae-ft-mse-840000-ema-pruned.ckpt models/VAE/
```

#### Download_Alt:
```
#wget https://huggingface.co/stabilityai/stable-diffusion-2/resolve/main/768-v-ema.ckpt
#wget https://raw.githubusercontent.com/Stability-AI/stablediffusion/main/configs/stable-diffusion/v2-inference-v.yaml
#mv 768-v-ema.ckpt models/Stable-diffusion/
#mv v2-inference-v.yaml models/Stable-diffusion/768-v-ema.yaml
```

### Start:
```
cd ..
screen -dmS server ./stable-diffusion-webui/webui.sh --use-cpu all --no-half --skip-torch-cuda-test --listen
```

## Inspiration & Gallery

### Repository:
```
cd extensions
git clone https://github.com/AlUlkesh/stable-diffusion-webui-images-browser
git clone https://github.com/HPPinata/stable-diffusion-webui-inspiration
cd ..
```

### Changes:
```
IFS=$'\n'
for i in $(cat extensions/stable-diffusion-webui-inspiration/scripts/inspiration.py | grep "switch_to_.*2img"); do
sed -i "s+$i+#$i+g" extensions/stable-diffusion-webui-inspiration/scripts/inspiration.py
done
```

### Get_Modifiers:
```
VAR="$(wget -qO- https://github.com/cmdr2/stable-diffusion-ui/raw/main/ui/modifiers.json)"
IFS=$'\n'
for c in $(echo "$VAR" | jq '.[].category'); do
  { echo "$VAR" | jq ".[] | select (.category==$c).modifiers[].modifier" | sed 's+"++g'; } > "$(echo $c | sed 's+"++g')".txt
done
```
