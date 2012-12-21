#!/bin/sh

# Sun Oct  7 15:59:56 EDT 2012
find . -exec sh -c "file -b --mime-type {} | grep -q '^text/'" \; -print
