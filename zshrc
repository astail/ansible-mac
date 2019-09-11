alias sl='ls'
alias rmfavicon='rm /Users/astel/Library/Application\ Support/Google/Chrome/Default/Favicons'
alias grm='git rm `git ls-files --deleted`'
alias ll='ls -lah'
alias tenki='curl -4 wttr.in/Tokyo'
ALS() { ls ./roles/*/tasks/main.yml| awk '{print "echo " $1 "; cat -n " $1}' | sh | less }
AALS() { ls ~/git/ansible/centos6/roles/*/tasks/main.yml| awk '{print "echo " $1 "; cat -n " $1}' | sh | less }
alias mysql='/usr/local/Cellar/mysql/5.7.17/bin/mysql'
alias service='(){ $1.server $2 }'

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

if [ -e ~/.ssh/id_astail ]; then
  ssh-add ~/.ssh/id_astail
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
