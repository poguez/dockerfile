# CUSTOM COMMANDS ALIASES
alias ..="cd .."
alias ls="ls --color"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias os='lsb_release -a'
alias pg="ps aux | grep"
alias ssh="ssh -v"
alias scp="scp -v"
alias less='less -R'
alias ping="ping -c 4"
alias tree="tree -C"
alias tarc='tar cvf'
alias tarcz='tar czvf'
alias tarx='tar xvf'
alias tarxz='tar xvzf'

# HISTORY SETTINGS
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=erasedups
export HISTCONTROL=ignoredups
export HISTCONTROL=ignorespace
export HISTIGNORE="pwd:history:ls:ls -lh:clear"

# GREP
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="1;32"

# LOAD BASH COMPLETION DEFINITIONS
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# NEW PROMPT
if(( $UID == 0 )); then
  export PS1="\e[1;31m\u\e[0m@\H \w >: "
else
  export PS1="\e[1;32m\u\e[0m@\H \w >: "
fi

function col {
  awk -v col=$1 '{print $col}'
}