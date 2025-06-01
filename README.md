  ## **Guide: Using Multiple Neovim Configs with Distrobox**
  
  ---
  
  **Prerequisites:**
  
  * You must have `distrobox` installed.
  * You must have `neovim` installed, with LazyVim setup as your default config.
  
  ---
  
  **Step 1: Create a Distrobox Container for Each Language**
  
  Use this naming convention for containers: `{language}-os`. For example:
  
  ```bash
  distrobox-create --name php-os --image docker.io/library/ubuntu:latest
  ```
  
  Replace `php` with any language or stack name you need, such as `node-os`, `python-os`, etc.
  
  ---
  
  **Step 2: Add Dynamic NVIM\_APPNAME Logic**
  
  Paste the following function into your shell configuration file (`~/.bashrc`, `~/.zshrc`, or any other shell init script you use):
  
  ```bash
  _dynamic_nvim_config() {
    if [[ -n "$CONTAINER_ID" ]]; then
      container_name="${(L)CONTAINER_ID}" # lowercase
      language="${container_name%-os}"
      config_path="nvim-${language}"
  
      if [[ -d "$XDG_CONFIG_HOME/$config_path" || -d "$HOME/.config/$config_path" ]]; then
        export NVIM_APPNAME="$config_path"
      else
        echo "Config path $config_path not found, falling back to default nvim config."
        export NVIM_APPNAME="nvim"
      fi
    else
      export NVIM_APPNAME="nvim"
    fi
  }
  
  _dynamic_nvim_config
  ```
  
  This function dynamically sets the Neovim config directory based on the container name.
  
  ---
  
  **Step 3: Create Neovim Config Folders for Each Language**
  
  In your configuration directory (typically `~/.config/`), create a folder using this pattern: `nvim-{language}`.
  
  Example:
  
  ```bash
  mkdir -p ~/.config/nvim-php
  ```
  
  Copy your LazyVim config into this folder, then just launch `nvim` and LazyVim will automatically install itself.
  
  ---
  
  **Notes:**
  
  * Folder name must match `nvim-{language}` format exactly.
  * If the folder doesn’t exist, it will fallback to the default `nvim` config.
  * Avoid using icons or special characters in folder or container names.
  
  ---
  
  **Usage Example:**
  
  1. Enter your `php-os` container:
     `distrobox-enter php-os`
  2. Run Neovim normally:
     `nvim`
  3. The system will detect `nvim-php` and apply that config.
