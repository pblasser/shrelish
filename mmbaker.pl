#!/usr/bin/perl

#!/usr/bin/perl

#print "desc xpos ypos rota tobo\n";
#my $endor = "";
print "G90 G21 G17\n";
print "T1 M06\n";
print "S12000 M03 G04 X15\n";
print "G0 X0 Y0 Z12.7\n";
while (<STDIN>){
 while ($_=~/\b([^\s]+)\b/g) {
  
 if ($1=~/([XYZIJKF])(\S+)/) {
  my $mm = $2 * 25.4;
  print "$1$mm ";
 } else { print "$1 "; }
 
#  if ($xish =~m/(\-*\d+\.\d+)m/) {

 } print "\n"; 
} 
print "M05 M30\n";

