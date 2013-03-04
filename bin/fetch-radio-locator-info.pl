#!/usr/bin/env perl

use strict;
use Data::Dumper;

# echo WHFR | xargs -I% curl --use-ascii 'http://radio-locator.com/cgi-bin/finder?sr=Y&s=C&call='%'&x=19&y=4' | perl -ne 'if (/(\d+ Watts)/) { print "'%$+ . "\n"; }'

# Alphabetical Google Docs sort by station column
my @call_letters = qw(WBUL KAOS KCWU KDUP KGLT KLCZ KMNR KMSC KNDS KPSU KRBX KRNU KRUX KSLU-1 KSTO KTCV KWCW WRFM WUNF KLA KBSU VIC WALT WAUG WBOR WCCX WCFM WCHC WCNI WCVF WCWS WDCE WDUB WDWN WECS WESS WFHU WFNP WGMU WGRE WHFR WHPK WHWS WIDB WIDR WIUP WIXQ WKWZ WLFR WLOY WLUR WMCO WMCR-2 WMHB WMUR WMVL WNCW WODU WPHS WPMD WPTC WQAC WRDP WRFW WRKC WRMC WRNC WSBU WSCA WSDP WSHC WSIN WSKB WSND WSUR WTSC WUPX WVFI WVRU WVUR WWPV WXAC WXBC WXCU WXLV WZBT WZLY);

# TESTING
# my @call_letters = qw(WSND);

foreach my $_call_letters (@call_letters) {

  my $cmd = "curl --use-ascii 'http:\/\/radio-locator.com\/cgi-bin\/finder\?sr=Y\&s=C\&call=$_call_letters\&x=19\&y=4'";

  print "\nExecuting: $cmd";


  my $curl_command_output = `$cmd`;
  my $effective_radiated_power;

  # print Dumper $curl_command_output;

  if ($curl_command_output =~ /Limit Reached/i) {
    print "Limit Reached!  Let's get outta here!\n";
    exit;
  }

  if ($curl_command_output =~ /(\d+ Watts)/) {
    $effective_radiated_power = $+;
  }

  print "\nCall letters: " . $_call_letters . ", Effective Radiated Power: " . $effective_radiated_power;
}

print "\n\n$0 is complete.\n";
exit;
