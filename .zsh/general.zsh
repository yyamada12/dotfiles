# Ctrl+Dでログアウトしてしまうことを防ぐ
setopt IGNOREEOF

# 色を使用
autoload -Uz colors
colors

# ctr + s でbck-i-search: を戻せるようにする
stty stop undef

# 補完
autoload -Uz compinit
compinit

## kubectl
source <(kubectl completion zsh)

# 他のターミナルとヒストリーを共有
setopt share_history

# ヒストリーに重複を表示しない
setopt histignorealldups
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

# cdの後lsを入力
function chpwd() { ls }

# コマンドミスを修正
setopt correct

# プロンプトを2行で表示、時刻を表示
PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[cyan]}%m${reset_color}(%*%) %~
%# "

# git設定
# RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# k8s
KUBE_PS1_SYMBOL_COLOR="null"
KUBE_PS1_SYMBOL_USE_IMG=true
RPROMPT=$RPROMPT'$(kube_ps1)'

# incremental search
stty stop undef

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yyamada/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yyamada/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yyamada/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yyamada/google-cloud-sdk/completion.zsh.inc'; fi
