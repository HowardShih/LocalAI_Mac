#!/bin/bash

# Start open-webui serve in a new terminal window with Conda initialization
echo "Starting Open WebUI..."
osascript <<EOF
tell application "Terminal"
    do script "eval \"\$($HOME/miniforge3/bin/conda shell.zsh hook)\" && conda activate base && open-webui serve"
    activate
end tell
EOF

echo "Open WebUI started in new terminal window"
echo ""
echo "Required setup:"
echo "1. Navigate to http://localhost:8080/"
echo "2. Go to Settings > Admin Settings > Images"
echo "3. Set Image Generation Engine to AUTOMATIC1111"
echo "4. Enter http://127.0.0.1:7860/"
read -p "Press Enter to continue after completing setup..."

# Initialize Conda in the current terminal
echo "Initializing Conda..."
eval "$($HOME/miniforge3/bin/conda shell.zsh hook)" || { echo "Conda initialization failed"; exit 1; }

# Activate the Conda environment
echo "Activating environment 'stable'..."
conda activate stable || { echo "Environment activation failed"; exit 1; }

# Navigate to the stable diffusion directory
echo "Navigating to Stable Diffusion directory..."
cd ~/stablediff/ || { echo "Directory change to stablediff failed"; exit 1; }

# Navigate to the stable-diffusion-webui directory
echo "Navigating to WebUI directory..."
cd stable-diffusion-webui/ || { echo "Directory change to stable-diffusion-webui failed"; exit 1; }

echo "Required actions:"
echo "1. Go to Settings > Admin Settings > Images"
echo "2. Click Refresh then Save"
read -p "Press Enter to continue after completing actions..."

# Run the web UI script
echo "Starting Stable Diffusion WebUI..."
./webui.sh --listen --api || { echo "WebUI startup failed"; exit 1; }

echo "Startup complete"
