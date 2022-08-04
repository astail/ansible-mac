# ansible-mac

[![Circle CI](https://circleci.com/gh/astail/ansible-mac/tree/master.svg?style=svg)](https://circleci.com/gh/astail/ansible-mac/tree/master)

mac システム環境設定

```
キーボード
装飾キー　Caps Lockキー -> ^Control
```

```
キーボード
ユーザ辞書
右上の
英字入力中にスペルを自動変換
文頭を自動的に大文字にする
スペースバーを2回押してピリオドを入力
チェック外す
```

```
キーボード
入力ソース
ライブ変換
タイプミスを修正
チェック外す
windows風のキー操作
チェック入れる
```

```
アクセシビリティ
ズーム機能
スクロールジェスチャと装飾キーを使ってズーム
チェック入れる
controlからcommandに変更
```

homebrewをインストールする。

```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
↓こんなのが出てくるのでそのまま打つ
```
$ echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/astel/.zprofile
$ eval "$(/opt/homebrew/bin/brew shellenv)"
```
もし途中でこけたら
```
$ brew doctor
```



```
$ pip3 install ansible 
```

pip3アップデートしないとansibleインストールできなかった
```
/Library/Developer/CommandLineTools/usr/bin/python3 -m pip install --upgrade pip
```

```
$ export PATH="${PATH}:/Users/astel/Library/Python/3.8/bin"
$ ansible --version
ansible [core 2.13.2]
```


java(Amazon Corretto 8等)をインストールしておく。(brew install sbtでこける)

ansibleを流すと環境ができる。

```
$ ansible-playbook -i hosts localhost.yml --ask-vault-pass -K
```
