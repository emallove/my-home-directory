#!/usr/bin/env perl

use strict;
use Data::Dumper;

my @call_letters;

# Alphabetical Google Docs sort by TW (this week)
@call_letters = qw(WALT WBUL KCWU KMNR KPSU KRNU KRUX VIC WAUG WBOR WCCX WDCE WECS WESS WFHU WGRE WHPK WIDR WIUP WIXQ WLFR WLOY WMCO WMCR WPHS WPMD WRDP WRNC WSDP WSHC WSIN WSND WTSC WUPX WVUR WXAC KBSU KRBX WRFW WRMC WMVL KDUP WFNP WWPV KSLU KTCV WHFR WPTC WVFI WZBT KSTO KGLT KMSC KLA WCWS WODU WQAC WRKC WSKB WSUR WXCU WXBC WKWZ KLCZ WRFM KAOS KNDS WUNF WCFM WCHC WCNI WCVF WGMU WHWS WIDB WLUR WMHB WMUR WNCW WSCA WVRU WXLV WZLY WDWN WSBU KWCW WDUB);

foreach my $_call_letters (@call_letters) {

  my $curl_cmd;
  my $curl_output;

  # Fetch the first match on stationid on www.streamingradioguide.com
  $curl_cmd = "curl 'http://streamingradioguide.com/streaming-schedule.php?action.x=71&action.y=19&action=Find+Station&station=${_call_letters}&service=FM'";
  $curl_output = `$curl_cmd`;

  my $stationid;
  if ($curl_output =~ /stationid=(\d+)/) { 
    $stationid = $+;
  }

  # Fetch the first row of the Effective Radiated Power of the station
  #
  # NOTE: This could be an html table with many rows, and the row we care about are not neccessariy in 
  #       the first row. Let's just use lynx dump so that we don't have to match on nasty HTML tags
  #
  # $curl_cmd = "curl 'http://streamingradioguide.com/nearby-transmitters.php?stationid=${stationid}'";

  $curl_cmd = "lynx --width=9999 --dump http://streamingradioguide.com/nearby-transmitters.php?stationid=${stationid}";
  $curl_output = `$curl_cmd`;

  my $erp;

  #
  # Example "lynx -dump" output
  #
  # 12    0.00 [16]WALT FM [17][info2.png] [18][tower.png] [19]yellow [20]102.1 MHz 920 watts MERIDIAN MS [21]NEW SOUTH COMMUNICATIONS, INC.
  #
  $erp = "unknown";

  my $regexp = ${_call_letters} . '.*\s+([0-9\,]+\s+watts)';

  while ($curl_output =~ /$regexp/i) { 

    $erp = $+;

    # Prune out the first match
    $curl_output =~ s/$regexp//i;
  }

  print "\n" . $_call_letters . ", " . $erp;
}

print "\n\n$0 is complete.\n";
exit;
