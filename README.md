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
```
```
VAR=$(cat <<'EOL'
logging.set_verbosity_error()

import multiprocessing
cpu_count = multiprocessing.cpu_count()

torch.set_num_threads(cpu_count)
torch.set_num_interop_threads(cpu_count)
EOL
)
VAR=$(VAR=${VAR@Q}; echo "${VAR:2:-1}")
```
```
sed -i "s+logging.set_verbosity_error()+$VAR+g" ./ui/sd_internal/runtime.py
cat ./ui/sd_internal/runtime.py
```
