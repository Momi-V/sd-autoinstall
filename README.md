## cmdr2
```
zypper in -y libgthread-2_0-0
wget https://github.com/cmdr2/stable-diffusion-ui/releases/download/v2.3.5/stable-diffusion-ui-linux.zip
unzip stable-diffusion-ui-linux.zip
./stable-diffusion-ui/start.sh
```

## 1111
```
zypper in -y wget git python3
bash <(wget -qO- https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh) --cpu all --no-half --skip-torch-cuda-test
```
