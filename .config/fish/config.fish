set fish_greeting

# pnpm
set -gx PNPM_HOME "~/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
