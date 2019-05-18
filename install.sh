#!/bin/bash
set -e
DOT_DIRECTORY="${HOME}/dotfiles"
DOT_TARBALL="https://github.com/yyamada12/dotfiles/tarball/master"
REMOTE_URL="https://github.com/yyamada12/dotfiles.git"

# check the command exist
has() {
  type "$1" > /dev/null 2>&1
}

# help
usage() {
  name=`basename $0`
  cat <<EOF
Usage:
  $name [Argument] [Command]
Commands:
  deploy
  initialize
Arguments:
  -f $(tput setaf 1)** warning **$(tput sgr0) Overwrite dotfiles.
  -h Print help (this message)
EOF
  exit 1
}

# options  -f: overwrite -h: help
while getopts :f:h opt; do
  case ${opt} in
    f)
      OVERWRITE=true
      ;;
    h)
      usage
      ;;
  esac
done
shift $((OPTIND - 1))

# download dotfiles
if [ -n "${OVERWRITE}" -o ! -d ${DOT_DIRECTORY} ]; then
  echo "Downloading dotfiles..."
  rm -rf ${DOT_DIRECTORY}
  mkdir ${DOT_DIRECTORY}

  if has "git"; then
    git clone --recursive "${REMOTE_URL}" "${DOT_DIRECTORY}"
  else
    curl -fsSLo ${HOME}/dotfiles.tar.gz ${DOT_TARBALL}
    tar -zxf ${HOME}/dotfiles.tar.gz --strip-components 1 -C ${DOT_DIRECTORY}
    rm -f ${HOME}/dotfiles.tar.gz
  fi

  echo $(tput setaf 2)Download dotfiles complete!. ✔︎$(tput sgr0)
fi

# Deploy
link_files() {
  cd ${DOT_DIRECTORY}

  for f in .??*
    do
      [[ ${f} = ".git" ]] && continue
        ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
    done
  echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)
}

# Initialize
initialize() {
  # install brew
  if has "brew"; then
    echo "$(tput setaf 2)Already installed Homebrew ✔︎$(tput sgr0)"
  else
    echo "Installing Homebrew..."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # install with brew
  if has "brew"; then
    echo "Updating Homebrew..."
    brew update && brew upgrade
    [[ $? ]] && echo "$(tput setaf 2)Update Homebrew complete. ✔︎$(tput sgr0)"

    cd ${DOT_DIRECTORY}
    brew bundle
  fi

  # change shell to zsh
  [ ${SHELL} != "/bin/zsh"  ] && chsh -s /bin/zsh
  echo "$(tput setaf 2)Initialize complete!. ✔︎$(tput sgr0)"
}

# arguments
command=$1
[ $# -gt 0 ] && shift
case $command in
  deploy)
    link_files
    ;;
  init*)
    link_files
    initialize
    ;;
  *)
    usage
    ;;
esac

exit 0
