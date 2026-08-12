# eza — modern ls replacement with icons and git integration
# https://github.com/eza-community/eza
if command -v "eza" &>/dev/null; then
    alias l='eza -lh --icons=auto' \
        ls='eza -1 --icons=auto' \
        ll='eza -lha --icons=auto --sort=name --group-directories-first' \
        ld='eza -lhD --icons=auto' \
        lt='eza --icons=auto --tree'
fi
