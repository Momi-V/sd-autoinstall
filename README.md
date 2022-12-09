## cmdr2
```
zypper in -y libgthread-2_0-0
zypper in -y libgthread-2_0-0 wget unzip tar bzip2 which nano #container

firewall-cmd --permanent --new-service diffusion
firewall-cmd --permanent --service diffusion --add-port 9000/tcp
firewall-cmd --permanent --add-service diffusion
systemctl restart firewalld

wget https://github.com/cmdr2/stable-diffusion-ui/releases/download/v2.4.13/stable-diffusion-ui-linux.zip
unzip stable-diffusion-ui-linux.zip
./stable-diffusion-ui/start.sh
```

## 1111
```
zypper in -y libgthread-2_0-0
zypper in -y wget git python3

firewall-cmd --permanent --new-service diffusion
firewall-cmd --permanent --service diffusion --add-port 7860/tcp
firewall-cmd --permanent --add-service diffusion
systemctl restart firewalld

git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
cd stable-diffusion-webui
wget https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4.ckpt
mv sd-v1-4.ckpt models/Stable-diffusion/
#wget https://huggingface.co/stabilityai/stable-diffusion-2/resolve/main/768-v-ema.ckpt
#mv 768-v-ema.ckpt models/Stable-diffusion/
#wget https://raw.githubusercontent.com/Stability-AI/stablediffusion/main/configs/stable-diffusion/v2-inference-v.yaml
#mv v2-inference-v.yaml models/Stable-diffusion/768-v-ema.yaml

./webui.sh --use-cpu all --no-half --skip-torch-cuda-test --listen
```

### Inspiration
```
VAR="$(wget -qO- http://example.com)"
IFS=$'\n'
for c in $(echo "$VAR" | jq '.[].category'); do
  { echo "$VAR" | jq ".[] | select (.category==$c).modifiers[].modifier" } > "$c".txt
done
```
