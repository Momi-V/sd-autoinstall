## cmdr2
```
dnf install -y xorg-x11-drivers libSM #Fedora
zypper in -y libgthread-2_0-0 #openSUSE
wget https://github.com/cmdr2/stable-diffusion-ui/releases/download/v2.4.13/stable-diffusion-ui-linux.zip
unzip stable-diffusion-ui-linux.zip
./stable-diffusion-ui/start.sh

firewall-cmd --permanent --new-service diffusion
firewall-cmd --permanent --service diffusion --add-port 9000/tcp
firewall-cmd --permanent --add-service diffusion
systemctl restart firewalld
```

## 1111
```
zypper in -y libgthread-2_0-0
zypper in -y wget git python3
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
cd stable-diffusion-webui
#wget https://drive.yerf.org/wl/?id=EBfTrmcCCUAGaQBXVIj5lJmEhjoP1tgl&mode=grid&download=1
#mv sd-v1-4.ckpt models/Stable-diffusion/
./webui.sh --use-cpu all --no-half --skip-torch-cuda-test
```
