# sd-autoinstall
```
dnf upgrade -y && dnf autoremove -y
dnf install -y xorg-x11-drivers libSM
```
```
firewall-cmd --permanent --add-port=9000/tcp
systemctl reload firewalld
```
```
wget https://github.com/cmdr2/stable-diffusion-ui/releases/download/v2.16/stable-diffusion-ui-linux.tar.xz
tar -xJvf stable-diffusion-ui-linux.tar.xz
cd stable-diffusion-ui
```
```
VAR=$(cat <<'EOL'
logging.set_verbosity_error()

import multiprocessing
cpu_count = multiprocessing.cpu_count()

torch.set_num_threads(cpu_count)
torch.set_num_interop_threads(cpu_count)

cpu_count = str(cpu_count)

os.environ["OMP_NUM_THREADS"] = cpu_count
os.environ["OPENBLAS_NUM_THREADS"] = cpu_count
os.environ["MKL_NUM_THREADS"] = cpu_count
os.environ["VECLIB_MAXIMUM_THREADS"] = cpu_count
os.environ["NUMEXPR_NUM_THREADS"] = cpu_count
EOL
)
VAR=$(VAR=${VAR@Q}; echo "${VAR:2:-1}")
```
```
sed -i "s+logging.set_verbosity_error()+$VAR+g" ./ui/sd_internal/runtime.py
cat ./ui/sd_internal/runtime.py
```
