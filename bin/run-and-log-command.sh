#!/bin/bash

while [ $# -gt 0 ]
do
    case $1 in
      # -f|--file) aflag="yes" ;;
      # -b|--blong) bflag="yes" ;;
      # for options with required arguments, an additional shift is required
      -f|--log-file) log_file_argument="$2" ; shift;;
      -c|--command) command_argument="$2" ; shift;;
    esac
    shift
done

echo "$command_argument | tee $log_file_argument"
exec $command_argument | tee $log_file_argument
