# sd-autoinstall
```
dnf install -y xorg-x11-drivers libSM #Fedora
zypper in -y libgthread-2_0-0 #openSUSE
```
```
firewall-cmd --permanent --add-port=9000/tcp
systemctl reload firewalld
```
```
wget https://github.com/cmdr2/stable-diffusion-ui/releases/download/v2.3.5/stable-diffusion-ui-linux.zip
unzip stable-diffusion-ui-linux.zip
cd stable-diffusion-ui
./start.sh
```
