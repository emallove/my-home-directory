#!/usr/bin/env perl

# Usage:
#
#  bin/attach-to-screen-with-matching-title.pl pattern-to-search-for-in-screen-title
#

use strict;

my $screen_ls_output = `screen -ls`;
my $pattern = shift @ARGV;
my $screen_id;

if ($screen_ls_output =~ /\n\s+(\d+)\..*$pattern/i) {
  $screen_id = $1;
}

system("screen -x $screen_id");
exit;
