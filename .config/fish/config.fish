if status is-interactive
    fastfetch
    zoxide init fish | source
    set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
    starship init fish | source
end

alias voterm 'OLLAMA_HOST=100.96.57.93:11435 oterm'
alias period-tracker 'cd ~/cycle-tracker; and npm run dev'
alias cx 'claude --permission-mode bypassPermissions'

# Modern CLI tools
alias cat bat
alias ls eza
alias ll 'eza -la'
alias lt 'eza --tree'
