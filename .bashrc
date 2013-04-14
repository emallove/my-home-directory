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

# enable Thu Oct 18 10:25:53 EDT 2012
# disable Fri Dec 21 15:17:07 EST 2012
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

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
export EDITOR=vim

# GIT SAYS MVIM LEAVES AN EMPTY COMMIT MESSAGE, AND FAILS!
export GIT_EDITOR=vim

export PSQL_EDITOR=vim

function parse_git_branch {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}

function proml {
  # OPTIONAL - if you want to use any of these other colors:
      local                    RED="\[\033[0;31m\]"
      local                   BLUE="\[\033[0;34m\]"
      local                   CYAN="\[\033[0;36m\]"
      local                   RED="\[\033[0;31m\]"
      local                  BLACK="\[\033[0;30m\]"
      local                  BLUE="\[\033[0;34m\]"
      local                  BROWN="\[\033[0;33m\]"
      local                  GREEN="\[\033[0;32m\]"
      local                  WHITE="\[\033[1;37m\]"
      local                 GREEN="\[\033[0;32m\]"
      local                 PURPLE="\[\033[0;35m\]"
      local                 WHITE="\[\033[1;37m\]"
      local                 YELLOW="\[\033[1;33m\]"
      local              DARK_GRAY="\[\033[1;30m\]"
      local              LIGHT_RED="\[\033[1;31m\]"
      local             LIGHT_BLUE="\[\033[1;34m\]"
      local             LIGHT_CYAN="\[\033[1;36m\]"
      local             LIGHT_GRAY="\[\033[0;37m\]"
      local             LIGHT_RED="\[\033[1;31m\]"
      local            LIGHT_GRAY="\[\033[0;37m\]"
      local            LIGHT_GREEN="\[\033[1;32m\]"
      local           LIGHT_GREEN="\[\033[1;32m\]"
      local           LIGHT_PURPLE="\[\033[1;35m\]"

  # END OPTIONAL
  local     DEFAULT="\[\033[0m\]"
  PS1="$LIGHT_RED\u@$BROWN\h:$GREEN\w $CYAN\$(parse_git_branch) $DEFAULT\$ "
}
proml

# Avoid this bundler error!
#
# $ bundle 
# /opt/ruby-enterprise-1.8.7-2011.03/lib/ruby/site_ruby/1.8/rubygems/dependency.rb:247:in `to_specs': Could not find bundler (>= 0) amongst [] (Gem::LoadError)
#   from /opt/ruby-enterprise-1.8.7-2011.03/lib/ruby/site_ruby/1.8/rubygems/dependency.rb:256:in `to_spec'
#   from /opt/ruby-enterprise-1.8.7-2011.03/lib/ruby/site_ruby/1.8/rubygems.rb:1231:in `gem'
#   from /opt/ruby-enterprise/bin/bundle:18
# export GEM_HOME=/home/emallove/ethans-gem-repo/
# export GEM_PATH=/home/emallove/ethans-gem-repo/

unset GEM_HOME
unset GEM_PATH

export PAGER="less -i"

alias ctags=/opt/local/bin/ctags

# Wed Oct 31 10:59:46 EDT 2012
export RAILS_ENV=development

export PYTHONSTARTUP=$HOME/.pystartup
