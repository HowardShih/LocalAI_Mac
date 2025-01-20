# **LocalAI_Mac**   
 A step-by-step guide to set up local AI tools on Mac, including detailed instructions for installing and configuring Ollama, Homebrew, Conda, Open WebUI, and Stable Diffusion.



## **Chapter 1: Setting Up Ollama**   

1. **Download and Install Ollama**  
   - Visit the official website to download: [ollama.com](https://ollama.com/)

2. **Run Ollama**  
   - Open Terminal and execute the following command to start a model:

     ```bash
     ollama run llama3.2:3b
     ```

3. **Test Ollama**  
   - Enter a message in the terminal to test functionality:

     ```text
     Hello!
     ```

---

## **Chapter 2: Installing Homebrew**

1. **Install Homebrew**  
   Run the following command in Terminal:

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Add Homebrew to Your System Path**  
   Append Homebrew's path to your shell profile (e.g., `.zprofile` for Zsh):

   ```bash
   echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
   ```

3. **Restart Terminal and Verify Installation**  
   - Close and reopen Terminal.  
   - Run this command to verify Homebrew installation:

     ```bash
     brew --help
     ```

---

## **Chapter 3: Installing Conda**

1. **Download Miniforge3**  
   - Get the installer for macOS (ARM64):  
     [Miniforge3 for MacOS ARM64](https://github.com/conda-forge/miniforge/releases)

2. **Run the Installer**  
   - Navigate to the download directory and execute the script:

     ```bash
     cd Downloads
     sh Miniforge3-MacOSX-arm64.sh
     ```

3. **Activate Conda**  
   - Add Conda to your shell by running:

     ```bash
     eval "$($(conda info --base)/bin/conda shell.zsh hook)"
     ```

4. **Verify Installation**  
   - Run this command to check Python version:

     ```bash
     python --version
     ```

---

## **Chapter 4: Installing and Running Open WebUI**

1. **Install Open WebUI**  
   Use `pip` to install Open WebUI:

   ```bash
   pip install open-webui
   ```

2. **Start Open WebUI**

   ```bash
   open-webui serve
   ```

3. **Access the Interface**  
   - Open your browser and navigate to: `localhost:8080`.  
   - Complete the registration process.

---

## **Chapter 5: Setting Up Stable Diffusion**

1. **Create a Conda Environment**

   ```bash
   conda create -n stable python=3.10.6
   conda activate stable
   ```

2. **Clone the Stable Diffusion Repository**  
   - Create a working directory and clone the repository:

     ```bash
     mkdir stable-diffusion
     cd stable-diffusion
     git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
     cd stable-diffusion-webui
     ```

3. **Download the Stable Diffusion Model**  
   - Get the model file (e.g., [v1.5 Model](https://huggingface.co/stable-diffusion-v1-5/stable-diffusion-v1-5/blob/main/v1-5-pruned.safetensors)) and place it in:

     ```text
     models/stable-diffusion
     ```

4. **Run the WebUI Script**

   ```bash
   sh webui.sh
   ```

5. **Generate Images**  
   - Open the interface in a browser, select the model file, and enter prompts to generate images.

---

## **Chapter 6: Linking Stable Diffusion to Open WebUI**

1. **Configure Open WebUI**  
   - Go to **Settings > Admin Settings > Images**.  
   - Set the **Image Generation Engine** to **AUTOMATIC1111**.  
   - Input the following URL:

     ```text
     http://127.0.0.1:7860
     ```

2. **Start Stable Diffusion with API Mode**

   ```bash
   sh webui.sh --listen --api
   ```

3. **Test the Connection**  
   - In Open WebUI, click **Refresh** under Image Settings and save the configuration.

---

## **Chapter 7: Automating Setup with AI_Start.sh**

To simplify the startup and configuration process for Open WebUI and Stable Diffusion, use the provided **`AI_Start.sh`** script. This script automates:
- Starting Open WebUI and initializing the Conda environment.
- Guiding users through necessary configurations (e.g., setting up the image generation engine).
- Launching the Stable Diffusion WebUI and enabling API mode.

### **Instructions**

1. **Download the Script**  
   Place `AI_Start.sh` in your home directory or another convenient location.

2. **Grant Execute Permission**

   ```bash
   chmod +x AI_Start.sh
   ```

3. **Run the Script**

   ```bash
   ./AI_Start.sh
   ```

4. **Follow the Prompts**  
   - The script will prompt you at key steps, such as configuring the image generation engine in Open WebUI.  
   - Complete each step and press Enter to proceed.

### **Script Details**
- **Automated Conda Initialization**: Ensures dependencies run in the correct environment.
- **Multi-Window Management**: Runs Open WebUI in a new terminal window for easier process handling.
- **Stable Diffusion Automation**: Eliminates manual steps for starting the WebUI and enabling API.

---

## **Final Testing**

1. **Generate Images from Open WebUI**  
   - Enter a text prompt and click the **Image Icon** under the response.

2. **Verify Results**  
   - Wait for the image to be generated and check the output.

---

This guide is designed to help anyone set up a fully functional local AI environment on macOS. Contributions and improvements are free to open a pull request! 😻😻
