#!/bin/bash

# Download memfix.zip

curl -Lo memfix.zip https://github.com/nolanaatama/sd-webui/raw/main/memfix.zip

# Unzip memfix.zip

unzip memfix.zip

# Install libunwind8-dev

apt install -qq libunwind8-dev

# Install dpkg packages

dpkg -i *.deb

# Upgrade FastAPI

pip install --upgrade fastapi==0.90.1

# Install PyTorch

pip install torch==1.13.1+cu116 torchvision==0.14.1+cu116 torchaudio==0.13.1 torchtext==0.14.1 torchdata==0.5.1 --extra-index-url https://download.pytorch.org/whl/cu116 -U

# Download sd-webui.zip

curl -Lo sd-webui.zip https://huggingface.co/nolanaatama/webui/resolve/main/sd-webui.zip

# Unzip sd-webui.zip

unzip sd-webui.zip

# Clone sd-webui-tunnels

git clone https://github.com/nolanaatama/sd-webui-tunnels /content/sd-webui/extensions/sd-webui-tunnels

# Clone sd-webui-controlnet

git clone https://github.com/nolanaatama/sd-webui-controlnet /content/sd-webui/extensions/sd-webui-controlnet

# Clone posex

git clone https://github.com/hnmr293/posex /content/sd-webui/extensions/posex

# Download sd-webui-images-browser.zip

curl -Lo /content/sd-webui/extensions/sd-webui-images-browser.zip https://huggingface.co/nolanaatama/webui/resolve/main/sd-webui-images-browser.zip

# Unzip sd-webui-images-browser.zip

unzip /content/sd-webui/extensions/sd-webui-images-browser.zip

# Download model files

curl -Lo /content/sd-webui/models/Stable-diffusion/anythingv4.5.ckpt https://huggingface.co/andite/anything-v4.0/resolve/main/anything-v4.5-pruned.ckpt

curl -Lo /content/sd-webui/models/Stable-diffusion/anythingv4.5.vae.pt https://huggingface.co/andite/anything-v4.0/resolve/main/anything-v4.0.vae.pt

# Remove unnecessary files

rm memfix.zip

rm sd-webui.zip

# Clone additional repositories

cd /content/sd-webui/extensions

git clone https://huggingface.co/nolanaatama/embeddings

cd /content/sd-webui/models

git clone https://huggingface.co/nolanaatama/ESRGAN

cd /content/sd-webui/extensions/sd-webui-controlnet

git clone https://huggingface.co/nolanaatama/models

cd /content/sd-webui

# Launch Web UI tunnel

python launch.py

