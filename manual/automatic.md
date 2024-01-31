### Repository:
```
#git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git automatic #Old Automatic1111 Repo
git clone https://github.com/vladmandic/automatic automatic
```

### Download:
```
cd automatic
curl -LO https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt
curl -LO https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.ckpt
mkdir models/Stable-diffusion/
mkdir models/VAE/
mv v1-5-pruned-emaonly.ckpt models/Stable-diffusion/
mv vae-ft-mse-840000-ema-pruned.ckpt models/VAE/
cd ..
```

#### Download_Alt:
Optional:
```
cd automatic
curl -LO https://huggingface.co/stabilityai/stable-diffusion-2-1/blob/main/v2-1_768-ema-pruned.safetensors
curl -LO https://raw.githubusercontent.com/Stability-AI/stablediffusion/main/configs/stable-diffusion/v2-inference-v.yaml
mv v2-1_768-ema-pruned.safetensors models/Stable-diffusion/
mv v2-inference-v.yaml models/Stable-diffusion/v2-1_768-ema-pruned.yaml
cd ..
```

### Extensions:
Optional:
```
cd automatic/extensions
#git clone https://github.com/AlUlkesh/stable-diffusion-webui-images-browser.git #included in vladmandic
git clone https://github.com/HPPinata/PromptGallery-stable-diffusion-webui.git
git clone https://github.com/Gerschel/sd_web_ui_preset_utils.git
cd ../..
```

### Start:
```
#screen -dmS server bash -c 'PYTHON=python3.10 ./automatic/webui.sh --use-cpu all --no-half --skip-torch-cuda-test --cors-origins=http://localhost:5173 --theme dark' #no GPU Version
screen -dmS server bash -c 'PYTHON=python3.10 ./automatic/webui.sh --cors-origins=http://localhost:5173 --theme dark'
```

### Fooocus:
```
git clone https://github.com/lllyasviel/Fooocus.git
cd Fooocus
python3.10 -m venv fooocus_env
source fooocus_env/bin/activate
pip install -r requirements_versions.txt
deactivate
```

### Start:
```
screen -dmS focus bash -c 'cd Fooocus; source fooocus_env/bin/activate; pip install -r requirements_versions.txt; python entry_with_update.py'
```
