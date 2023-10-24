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
```
cd automatic/extensions
git clone https://github.com/HPPinata/PromptGallery-stable-diffusion-webui.git
cd ../..
```

### Start:
```
screen -dmS server bash -c 'python_cmd=python3.10 ./automatic/webui.sh --cors-origins=http://localhost:5173 --theme dark'
```
