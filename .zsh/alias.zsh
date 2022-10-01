# alias
alias ls='ls -G'
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ll='ls -lh'
alias grep='grep --color=auto'

## git settings
alias g='git'
alias ga='git add'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git status'
alias gp='git push'
alias gb='git branch'
alias gst='git status'
alias gco='git checkout'
alias gf='git fetch'
alias gci='git commit'
alias gcia='git commit --amend'
alias gres='git reset'
alias greb='git rebase'
alias grebc='git rebase --continue'
alias gl='git log'
alias ggr="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

## docker settings
alias d='docker'
alias dp='docker ps'
alias dx='docker exec -it'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcd='docker-compose down'

## k8s settings
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'

## terraform settings
alias t="terraform"
alias tp="terraform plan"
alias ta="terraform apply"

## multipass
alias mp="multipass"

## for safe cp, mv, rm
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

## my aliases
alias ctfup='cd ~/myVagrants/ubu; vagrant up && vagrant ssh'
alias ctfs='cd ~/myVagrants/ubu/work'
alias pwns'cd ~/work/ctf/ctfs/pwn_training2019'

alias jn='jupyter notebook'
alias j='jump'
## fzf settings
cd-fzf-find() {
    local DIR=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m)
    if [ -n "$DIR" ]; then
        cd $DIR
    fi
}
alias fd=cd-fzf-find
alias -g RB='`git branch --all | grep -v HEAD | fzf -m | sed "s/.* //" | sed "s#remotes/[^/]*/##"`'
alias -g B='`git branch | fzf`'
