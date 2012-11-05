# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

export PAGER="less -i"

# Sun Sep 30 17:01:12 EDT 2012
set -o vi

export EDITOR=vim

# Fri Oct  5 22:16:41 EDT 2012
# PATH=$PATH:/opt/coldfusionmx7/bin

# Sat Oct  6 10:37:23 EDT 2012
PATH=$PATH:/opt/coldfusion9/bin
PATH=$PATH:$HOME/bin

# Tue Oct  9 12:04:47 EDT 2012
# Allow user to change tab title (e.g., in iTerm2)
# This solution was found here: http://www.starnet.com/xwin32kb/xterm_title
unset PROMPT_COMMAND

# Thu Oct 18 10:25:53 EDT 2012
function parse_git_branch {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  # OPTIONAL - if you want to use any of these other colors:
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  # END OPTIONAL
  local     DEFAULT="\[\033[0m\]"
  PS1="$LIGHT_RED\u@$DEFAULT\h:$GREEN\w $BLUE\$(parse_git_branch) $DEFAULT\$ "
}
proml

export GEM_HOME=/home/emallove/ethans-gem-repo/
export GEM_PATH=/home/emallove/ethans-gem-repo/


