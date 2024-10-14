# Compile and run C files
cx(){
   if [ -z "$1" ]; then
        echo "Usage: cx <c_or_cpp_file>"
        return 1
    fi
    
    # Determine compiler based on file extension
    local compiler
    case "$1" in
        *.cpp|*.cc|*.cxx|*.C)
            compiler="g++"
            ;;
        *.c)
            compiler="gcc"
            ;;
        *)
            echo "Error: File must have .c, .cpp, .cc, .cxx, or .C extension"
            return 1
            ;;
    esac
    
    $compiler "$1" -o temp_out && ./temp_out
    local exit_status=$?
    rm -f temp_out
    return $exit_status
}

# Usage: udnv [nightly|stable]  (defaults to nightly)
udnv() {
    local version="${1:-nightly}"
    
    # Validate version argument
    if [[ "$version" != "nightly" && "$version" != "stable" ]]; then
        echo "Usage: udnv [nightly|stable]"
        echo "Error: Version must be 'nightly' or 'stable'"
        return 1
    fi
    
    local url="https://github.com/neovim/neovim/releases/download/${version}/nvim-linux-x86_64.tar.gz"
    
    # Download with error checking
    if ! curl -LO "$url"; then
        echo "Download failed"
        return 1
    fi
    echo "Downloaded latest ${version} version"
    
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


# ripgrep->fzf->vim [QUERY]
rfv() {
(RELOAD='reload:rg --column --color=always --smart-case {q} || :'
 fzf --disabled --ansi \
     --bind "start:$RELOAD" --bind "change:$RELOAD" \
     --bind 'enter:become:nvim {1} +{2}' \
     --bind 'ctrl-o:execute:nvim {1} +{2}' \
     --delimiter : \
     --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
     --preview-window '~4,+{2}+4/3,<80(up)')
 }
