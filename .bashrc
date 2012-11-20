PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

PATH=/opt/local/lib/postgresql90/bin:$PATH

# MacVim
PATH=$PATH:/Applications/MacVim.app/Contents/MacOS
PATH=$PATH:$HOME/bin:/Applications/GitX.app/Contents/MacOS/
PATH=$PATH:/Applications/
PATH=$PATH:/opt/local/bin
PATH=$PATH:/Applications/MacPorts/iTerm2.app/Contents/MacOS/


# Sun Oct  7 15:38:45 EDT 2012
PATH=$PATH:/opt/local/apache2/bin

export PATH

export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home

export CAP_DEPLOY_USER=emallove
export DEPLOY_USER=emallove

# EAM 2012.09.17
set -o vi

# Tue Sep 25 09:57:16 EDT 2012
PGHOST=
PGDATABASE=

# PGHOST=localhost
# PGDATABASE=dev_ff
# export PGDATA
export PGHOST
export PGDATABASE

# Fri Sep 28 16:14:07 EDT 2012
export CLICOLOR=1

# Colors directories, but what about zip files, pictures, mp3s, etc.
export LSCOLORS=Gxfxcxdxbxegedabagacad

source ~/.git-completion.bash

# Wed Oct  3 11:26:59 EDT 2012
export EDITOR=mvim

# GIT SAYS MVIM LEAVES AN EMPTY COMMIT MESSAGE, AND FAILS!
export GIT_EDITOR=vim

export PSQL_EDITOR=vim

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

export PAGER="less -i"

alias ctags=/opt/local/bin/ctags

# Wed Oct 31 10:59:46 EDT 2012
export RAILS_ENV=development
