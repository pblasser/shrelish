#!/usr/bin/perl

#!/usr/bin/perl

#print "desc xpos ypos rota tobo\n";
#my $endor = "";
print "G90 G21 G17\n";
print "S1000 M3\n";
print "G4 P1\n";
#print "G0 X0 Y0 Z12.7\n";
while (<STDIN>){
 while ($_=~/\b([^\s]+)\b/g) {
  
 if ($1=~/([XYZIJKF])(\S+)/) {
  my $mm = $2 * 25.4;
  print "$1$mm ";
 } else { print "$1 "; }
 
#  if ($xish =~m/(\-*\d+\.\d+)m/) {

 } print "\n"; 
} 
print "M5 M30\n";

