function with-hf --description 'Run one command with HF_TOKEN set (for tools that only read the env var, e.g. odysseus)'
    set -l token_file ~/.config/secrets/hf_token
    if not test -r $token_file
        echo "with-hf: $token_file is not readable" >&2
        return 1
    end
    # set -lx keeps the token out of argv (visible in ps) and out of the calling shell
    set -lx HF_TOKEN (cat $token_file)
    $argv
end
