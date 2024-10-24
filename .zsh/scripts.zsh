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
