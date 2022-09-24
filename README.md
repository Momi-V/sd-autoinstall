# sd-autoinstall
```
dnf upgrade -y && dnf autoremove -y
dnf install -y xorg-x11-drivers libSM
```
```
wget https://github.com/cmdr2/stable-diffusion-ui/releases/download/v2.05/stable-diffusion-ui-linux.tar.xz
tar -xJvf stable-diffusion-ui-linux.tar.xz
cd stable-diffusion-ui
```
```
firewall-cmd --permanent --add-port=9000/tcp
systemctl reload firewalld
```
```
VAR=$(cat <<'EOL'
logging.set_verbosity_error()

torch.set_num_threads(20)

os.environ["OMP_NUM_THREADS"] = "20"
os.environ["OPENBLAS_NUM_THREADS"] = "20"
os.environ["MKL_NUM_THREADS"] = "20"
os.environ["VECLIB_MAXIMUM_THREADS"] = "20"
os.environ["NUMEXPR_NUM_THREADS"] = "20"
EOL
)
VAR=$(VAR=${VAR@Q}; echo "${VAR:2:-1}")
```
```
sed -i "s+logging.set_verbosity_error()+VAR+g" ./ui/sd_internal/runtime.py
cat ./ui/sd_internal/runtime.py
```
