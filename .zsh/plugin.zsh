### Added by Zinit's installer
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod go-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://wiki.zshell.dev/ecosystem/category/-annexes
zicompinit # <- https://wiki.zshell.dev/docs/guides/commands

### End of Zinit's installer chunk

zi ice blockf wait lucid depth"1"
zi light zsh-users/zsh-completions

zi ice wait lucid depth"1"
zi light zsh-users/zsh-syntax-highlighting

zi ice lucid depth"1"
zi light jocelynmallon/zshmarks

zi ice wait lucid depth"1"
zi light zsh-users/zsh-autosuggestions

zi ice wait lucid depth"1"
zi light jonmosco/kube-ps1

zi ice lucid depth"1"
zi light zdharma/history-search-multi-word