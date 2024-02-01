#!/bin/bash

### Repository:
git clone https://github.com/vladmandic/automatic automatic

### Download:
cd automatic
curl -LO https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt
curl -LO https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.ckpt
mkdir models/Stable-diffusion/
mkdir models/VAE/
mv v1-5-pruned-emaonly.ckpt models/Stable-diffusion/
mv vae-ft-mse-840000-ema-pruned.ckpt models/VAE/
cd ..

### Extensions:
cd automatic/extensions
git clone https://github.com/HPPinata/PromptGallery-stable-diffusion-webui.git
cd ../..

### Start:
screen -dmS server bash -c 'PYTHON=python3.10 ./automatic/webui.sh --cors-origins=http://localhost:5173 --theme dark'

### Fooocus:
git clone https://github.com/lllyasviel/Fooocus.git
cd Fooocus
python3.10 -m venv fooocus_env
source fooocus_env/bin/activate
pip install -r requirements_versions.txt
deactivate

### Start:
screen -dmS focus bash -c 'cd Fooocus; source fooocus_env/bin/activate; pip install -r requirements_versions.txt; python entry_with_update.py'

### Cron:
cat <<'EOL' | crontab -
SHELL=/bin/bash
BASH_ENV=/etc/profile

@reboot screen -dmS server bash -c 'PYTHON=python3.10 ./automatic/webui.sh --cors-origins=http://localhost:5173 --theme dark'
@reboot screen -dmS focus bash -c 'cd Fooocus; source fooocus_env/bin/activate; pip install -r requirements_versions.txt; python entry_with_update.py'
EOL
crontab -l

