export LANG=ja_JP.UTF-8

alias grm='git rm `git ls-files --deleted`'

#自動補完
autoload -Uz compinit
compinit

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
HISTTIMEFORMAT='[%Y/%M/%D %H:%M:%S] '

PROMPT="[%{$UID_COLOR%}%n%{${reset_color}%}%{${bg[black]}%}${HOST_COLOR}%{$reset_color%}%m ] %(!.#.$) "
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%1(v|%F{green}%1v%f|) %{${fg[blue]}%}[%~]%{${reset_color}%}"

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

autoload colors
colors

if [ -d ${HOME}/.scalaenv ]; then
  export PATH="${HOME}/.scalaenv/bin:${HOME}/.scalaenv/shims:${PATH}"
  eval "$(scalaenv init -)"
fi
if [ -d ${HOME}/.sbtenv ]; then
  export PATH="${HOME}/.sbtenv/bin:${HOME}/.sbtenv/shims:${PATH}"
  eval "$(sbtenv init -)"
  export SBT_OPTS="-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2G -Xss2M"
fi
if [ -d ${HOME}/.playenv ]; then
  export PATH="${HOME}/.playenv/bin:${HOME}/.playenv/shims:${PATH}"
  eval "$(playenv init -)"
fi

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
