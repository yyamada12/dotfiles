export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew
export PATH=/usr/local/var/nodebrew/current/bin:$PATH

function length()
{
  echo -n ${#1}
}

function init-prompt-git-branch()
{
  git symbolic-ref HEAD 2>/dev/null >/dev/null &&
  echo "($(git symbolic-ref HEAD 2>/dev/null | sed 's/^refs\/heads\///'))"
}

if which git 2>/dev/null >/dev/null
then
  export PS1_GIT_BRANCH='\[\e[$[COLUMNS]D\]\[\e[1;31m\]\[\e[$[COLUMNS-$(length $(init-prompt-git-branch))]C\]$(init-prompt-git-branch)\[\e[$[COLUMNS]D\]\[\e[0m\]'
else
  export PS1_GIT_BRANCH=
fi
export PS1="\[\033[37m\]\w \[\033[0m\]$PS1_GIT_BRANCH\n\[\e[36;1m\]\t \[\e[0m\]\$ "


export DYLD_LIBRARY_PATH=/usr/local/opt/capstone/lib/:$DYLD_LIBRARY_PATH
export PATH="$PATH:/usr/local/Cellar/dex2jar/2.0/bin"

source $HOME/.bashrc
