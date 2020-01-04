# Usage

```
Usage:
  install.sh [Argument] [Command]
Commands:
  deploy
  initialize
Arguments:
  -f ** warning ** Overwrite dotfiles.
  -h Print help (this message)
```



# install all (for mac)

```bash
bash -c "$(curl -fsSL raw.github.com/yyamada12/dotfiles/master/install.sh)" -s init
```

- git レポジトリのクローン
- シンボリックリンク作成
- install brew & brew bundle
- chsh -s /bin/zsh



# install dotfiles (for Linux)

```bash
bash -c "$(curl -fsSL raw.github.com/yyamada12/dotfiles/master/install.sh)" -s deploy
```

- git レポジトリのクローン
- シンボリックリンク生成

zshへの切り替えは以下のコマンド
```bash
sudo chsh $USER -s $(which zsh)
```


# deploy dotfiles

`install.sh deploy`

シンボリックリンクのみ生成



# overwrite old dotfiles
`install.sh -f deploy`

dotfilesをクローンし直してシンボリックリンクを生成
