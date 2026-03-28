if status is-interactive
    # Commands to run in interactive sessions can go here
    fastfetch
end
alias voterm='OLLAMA_HOST=100.96.57.93:11435 oterm'

# Modern CLI tools
zoxide init fish | source
alias cat bat
alias ls eza
alias ll "eza -la"
alias lt "eza --tree"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
starship init fish | source
