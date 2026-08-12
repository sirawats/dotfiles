# fzf shell integration (keybindings + completions)
# Ctrl-R: fuzzy history search
# Ctrl-T: fuzzy file search
# Alt-C:  fuzzy cd
if command -v fzf &>/dev/null; then
    eval "$(fzf --zsh)"
fi
