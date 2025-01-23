gx (){
    if [ -z "$1" ]; then
        echo "Usage: gx <cpp_file>"
        return 1
    fi
    
    g++ "$1" -o temp_out && ./temp_out
    local exit_status=$?
    rm -f temp_out
    return $exit_status
}

udnv () {
    download_path="$HOME/Downloads/nvim-linux64.tar.gz"
    
    # Download with error checking
    if ! curl -Lo "$download_path" https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz; then
        echo "Download failed"
        return 1
    fi
    echo "Downloaded latest nightly version to ~/Downloads"
    
    # Remove old installation and extract new one
    sudo rm -rf /opt/nvim
    if ! sudo tar -C /opt -xzf "$download_path"; then
        echo "Extraction failed"
        return 1
    fi
    echo "Extracted contents to /opt"
    
    # Clean up downloaded archive if it exists
    [ -f "$download_path" ] && rm -rf "$download_path"
    echo "Deleted download from ~/Downloads"
    
    # Show version
    echo -n "version: " && nvim --version | grep NVIM
}
