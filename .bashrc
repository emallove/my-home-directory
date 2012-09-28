PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

PATH=/opt/local/lib/postgresql90/bin:$PATH

# MacVim
PATH=$PATH:/Applications/MacVim.app/Contents/MacOS
PATH=$PATH:$HOME/bin:/Applications/GitX.app/Contents/MacOS/
PATH=$PATH:/Applications/
PATH=$PATH:/opt/local/bin
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
