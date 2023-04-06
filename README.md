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
set +H
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
#wget https://huggingface.co/stabilityai/stable-diffusion-2-1/blob/main/v2-1_768-ema-pruned.safetensors
#wget https://raw.githubusercontent.com/Stability-AI/stablediffusion/main/configs/stable-diffusion/v2-inference-v.yaml
#mv v2-1_768-ema-pruned.safetensors models/Stable-diffusion/
#mv v2-inference-v.yaml models/Stable-diffusion/v2-1_768-ema-pruned.yaml
```

### Extensions:
```
cd extensions
git clone https://github.com/AlUlkesh/stable-diffusion-webui-images-browser.git
git clone https://github.com/HPPinata/stable-diffusion-webui-inspiration.git
git clone https://github.com/Gerschel/sd_web_ui_preset_utils.git
cd ..
```

### Start:
```
cd ..
#screen -dmS server ./stable-diffusion-webui/webui.sh --use-cpu all --no-half --skip-torch-cuda-test
screen -dmS server ./stable-diffusion-webui/webui.sh
```

### Get_Modifiers:
```
VAR="$(wget -qO- https://github.com/cmdr2/stable-diffusion-ui/raw/main/ui/modifiers.json)"
IFS=$'\n'
for c in $(echo "$VAR" | jq '.[].category'); do
  { echo "$VAR" | jq ".[] | select (.category==$c).modifiers[].modifier" | sed 's+"++g'; } > "$(echo $c | sed 's+"++g')".txt
done
```
