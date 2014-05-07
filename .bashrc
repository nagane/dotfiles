# .bashrc

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi=vim

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# history settings
# 重複する履歴を無視
#export HISTCONTROL=ignoredups 
#空白から始めたコマンドを無視
#export HISTCONTROL=ignorespace
#ignorespace+ignoredups = ignoreboth
export HISTCONTROL=ignoreboth

#history 保存対象外
export HISTIGNORE="fg*:bg*:history*:ls*"

#hstory sizeを増やす
export HISTSIZE=10000
