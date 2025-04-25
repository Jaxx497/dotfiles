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
    # Download with error checking
    if ! curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz; then
        echo "Download failed"
        return 1
    fi
    echo "Downloaded latest nightly version"
    
    # Remove old installation and extract new one
    sudo rm -rf /opt/nvim
    if ! sudo tar -C /opt -xzvf ./nvim-linux-x86_64.tar.gz; then
        echo "Extraction failed"
        return 1
    fi
    echo "Extracted contents to /opt"
    
    # Clean up downloaded archive
    rm -f nvim-linux-x86_64.tar.gz
    echo "Cleaned up download"
    
    # Show version
    echo -n "Version: " && nvim --version | grep NVIM
}


udns () {
    # Download with error checking
    if ! curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz; then
        echo "Download failed"
        return 1
    fi
    echo "Downloaded latest stable version"
    
    # Remove old installation and extract new one
    sudo rm -rf /opt/nvim
    if ! sudo tar -C /opt -xzvf ./nvim-linux-x86_64.tar.gz; then
        echo "Extraction failed"
        return 1
    fi
    echo "Extracted contents to /opt"
    
    # Clean up downloaded archive
    rm -f nvim-linux-x86_64.tar.gz
    echo "Cleaned up download"
    
    # Show version
    echo -n "Version: " && nvim --version | grep NVIM
}
