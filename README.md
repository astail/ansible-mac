# ansible-mac

[![Circle CI](https://circleci.com/gh/astail/ansible-mac/tree/master.svg?style=svg)](https://circleci.com/gh/astail/ansible-mac/tree/master)

homebrewとansibleとzshをインストールする。

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install ansible
$ brew install zsh
$ chsh -s /bin/zsh
```

ターミナルを起動し直す。

java(Amazon Corretto 8等)をインストールしておく。(brew install sbtでこける)

ansibleを流すと環境ができる。

```
$ ansible-playbook -i hosts localhost.yml --ask-vault-pass -K
```
