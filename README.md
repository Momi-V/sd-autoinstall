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
bash <(wget -qO- https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh) --use-cpu all --no-half --skip-torch-cuda-test
```
