#!/bin/sh
#
# Open a new iTerm session with the command given
# as argument.
#
# - If there are no arguments, the new iTerm window will
#   be opened in the current directory, i.e. as if the command
#   would be "cd `pwd`".
# - If the first argument is a directory, the new iTerm will
#   "cd" into that directory before executing the remaining
#   arguments as command.
# - If there are arguments and the first one is not a directory,
#   the new window will be opened in the current directory and
#   then the arguments will be executed as command.
# - The optional, leading "-x" flag will cause the new terminal
#   to be closed immediately after the executed command finishes.
#
# original script by Marc Liyanage <http://www.entropy.ch>
# 	designed to work with Mac OSX Terminal.app
# iTerm modifications by Damon Parker <http://damonparker.org>
# 
#
# Version 1.2
# 9/20/2005 damonp - make sure new session opens in current window, clear screen
# 9/15/2005 damonp - modify for iTerm usage  

if [ "x-x" = x"$1" ]; then
    EXIT="; exit"; shift;
fi

if [[ -d "$1" ]]; then
    WD=`cd "$1"; pwd`; shift;
else
    WD="'`pwd`'";
fi

# COMMAND="cd $WD; $@"
COMMAND="cd ~/dresources/fingertip-mail;"
echo "$COMMAND"

dirs="
  /Users/emallove/dresources/alconformulary
  /Users/emallove/dresources/alconformulary_201204_old
  /Users/emallove/dresources/allerganformulary
  /Users/emallove/dresources/amarinformulary
  /Users/emallove/dresources/aptalisformulary
  /Users/emallove/dresources/astellasformulary.com
  /Users/emallove/dresources/aveoformulary
  /Users/emallove/dresources/azformulary
  /Users/emallove/dresources/bayerformulary
  /Users/emallove/dresources/biformulary
  /Users/emallove/dresources/blformulary
  /Users/emallove/dresources/bmsformulary
  /Users/emallove/dresources/cephalonformulary
  /Users/emallove/dresources/cubistformulary
  /Users/emallove/dresources/deyformulary
  /Users/emallove/dresources/drgformulary
  /Users/emallove/dresources/dsiformulary
  /Users/emallove/dresources/ecrpharmaformulary
  /Users/emallove/dresources/eisaiformulary
  /Users/emallove/dresources/epocrates.formulary
  /Users/emallove/dresources/epocratesformulary
  /Users/emallove/dresources/eurandformulary
  /Users/emallove/dresources/exampleformulary
  /Users/emallove/dresources/fingertip_api.fingertipformulary.com
  /Users/emallove/dresources/fingertip_view_formulary_ios
  /Users/emallove/dresources/forestformulary
  /Users/emallove/dresources/freseniusformulary
  /Users/emallove/dresources/gileadformulary
  /Users/emallove/dresources/gskformulary
  /Users/emallove/dresources/impaxformulary
  /Users/emallove/dresources/jazzformulary
  /Users/emallove/dresources/jnjformulary
  /Users/emallove/dresources/lillyformulary
  /Users/emallove/dresources/lillyformulary_old
  /Users/emallove/dresources/medicisformulary
  /Users/emallove/dresources/merckformulary
  /Users/emallove/dresources/novartisformulary
  /Users/emallove/dresources/novoformulary
  /Users/emallove/dresources/optimerformulary
  /Users/emallove/dresources/otsukaformulary
  /Users/emallove/dresources/pfizerformulary
  /Users/emallove/dresources/pharmadermformulary
  /Users/emallove/dresources/purdueformulary
  /Users/emallove/dresources/rocheformulary
  /Users/emallove/dresources/saformulary
  /Users/emallove/dresources/salixformulary
  /Users/emallove/dresources/sepracorformulary
  /Users/emallove/dresources/shireformulary
  /Users/emallove/dresources/stagingformulary
  /Users/emallove/dresources/strativaformulary
  /Users/emallove/dresources/synopiarxformulary
  /Users/emallove/dresources/takedaformulary
  /Users/emallove/dresources/tevaformulary
  /Users/emallove/dresources/urlformulary
  /Users/emallove/dresources/vertexformulary
  /Users/emallove/dresources/wcformulary
"

for dir in $dirs
do

  osascript 2>/dev/null <<EOF
  tell application "iTerm"
    make new terminal
    tell the current terminal
      activate current session
      launch session "Default Session"
      tell the last session
        write text "cd $dir"
      end tell
    end tell
  end tell
EOF
done

exit 0
