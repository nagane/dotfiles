# 環境変数
export LANG=ja_JP.UTF-8
 
# 色を使用出来るようにする
autoload -Uz colors
colors
 
# zsh history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
 
# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
PROMPT="${fg[yellow]}ξξ${reset_color}＊'ヮ')${fg[yellow]}ξ ${reset_color}%{${fg[green]}%}[%n@%m]%{${reset_color}%} ${fg[red]}❤${reset_color} (ӦｖӦ｡) %~
%# "
 
# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified
 
########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 候補をc-f,c-bとかで選べるようにする
zstyle ':completion:*:default' menu select=2

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
 
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
 
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
 
 
########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# beep を無効にする
setopt no_beep
# フローコントロールを無効にする
setopt no_flow_control
# '#' 以降をコメントとして扱う
setopt interactive_comments
# ディレクトリ名だけでcdする
setopt auto_cd
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
# = の後はパス名として補完する
setopt magic_equal_subst
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# ヒストリファイルに保存するとき、すでに重複したコマンドがあったら古い方を削除する
setopt hist_save_nodups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu
# 高機能なワイルドカード展開を使用する
setopt extended_glob
 
########################################
# キーバインド
# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward
########################################
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export LSCOLORS=gxfxcxdxbxegedabagacad
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        ;;
esac

# install auto-fu.sh git://github.com/hchbaw/auto-fu.zsh.git

if [ -f ~/.zsh/auto-fu.zsh ]; then
    source ~/.zsh/auto-fu.zsh
    function zle-line-init () {
        auto-fu-init
    }
    zle -N zle-line-init
    zstyle ':completion:*' completer _oldlist _complete
fi

if [ -f ~/.zsh/alias.zsh ]; then
  source ~/.zsh/alias.zsh
fi

# quick lool alias

alias ql='qlmanage -p "$@" >& /dev/null'
alias sk='cat ~/memo/seki.md'
alias sshngn='ssh ngn -lnagane'
alias ref='cd ~/Dropbox/reference'
alias g='cd `ls -d ~/project/* ~/go/src/* |peco`'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

ZSHHOME="${HOME}/.zsh"


# inport golang bin
export PATH=$HOME/go/bin:$PATH

# need glide setting
export GO15VENDOREXPERIMENT=1
export GOPATH=~/go
export AWS_DEFAULT_PROFILE=default

setopt nonomatch

if [ -d ~/.ssh/conf.d/ ]; then
  function peco-sshconfig-ssh() {
    local host=$(cat ~/.ssh/conf.d/ssh_config |egrep "^Host" |awk '{print $2}' |peco)
    if [ -n "$host" ]; then
      echo "ssh $host"
      ssh $host
    fi
   }
   alias s='peco-sshconfig-ssh'
fi

export PATH=$HOME/.rbenv/bin:$HOME/.go/bin:$HOME/Library/Python/3.7/bin:$PATH
eval "$(rbenv init - zsh)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
