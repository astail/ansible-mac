alias sl='ls'
alias rmfavicon='rm /Users/astel/Library/Application\ Support/Google/Chrome/Default/Favicons'
alias grm='git rm `git ls-files --deleted`'
alias ll='ls -lah'
alias tenki='curl -4 wttr.in/Tokyo'
ALS() { ls ./roles/*/tasks/main.yml| awk '{print "echo " $1 "; cat -n " $1}' | sh | less }
AALS() { ls ~/git/ansible/centos6/roles/*/tasks/main.yml| awk '{print "echo " $1 "; cat -n " $1}' | sh | less }


#自動補完
autoload -Uz compinit
compinit

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
HISTTIMEFORMAT='[%Y/%M/%D %H:%M:%S] '

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

autoload colors
colors


java7() {
  setjdk 1.7;
  java $@
}

java8() {
  setjdk 1.8;
  java $@
}

function setjdk() {
  if [ $# -ne 0 ]; then
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
    if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
    fi
    export JAVA_HOME=`/usr/libexec/java_home -v $@`
    export PATH=$JAVA_HOME/bin:$PATH
  fi
}
function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}
setjdk 1.7

ssh-add ~/.ssh/id_astail

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
