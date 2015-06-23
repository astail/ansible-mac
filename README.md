# ansible-mac

homebrewとansibleとzshをインストールする。

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install ansible
$ brew install zsh
$ chsh -s /bin/zsh
```

ターミナルを起動し直す。

ansibleを流すと環境ができる。

```
$ HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook -i hosts localhost.yml && source ~/.zshrc
```
