#!/usr/bin/perl

#!/usr/bin/perl

#print "desc xpos ypos rota tobo\n";
#my $endor = "";
print "G90 G21 G17\n";
print "G92.1\n";
print "S1000 M3\n";
print "G4 P1\n";
#print "G0 X0 Y0 Z12.7\n";
my $redundo = {};
while (<STDIN>){
 while ($_=~/\b([^\s]+)\b/g) {
  
 if ($1=~/([XYZIJKF])(\S+)/) {
  #my $mm = sprintf("%.3f",$2 * 25.4);
  my $mm = int($2*25.4*1000+0.5) / 1000;
  #my $mm = $2*25.4;
  print ("$1$mm") if ($redundo{"$1"}!=$mm);
  $redundo{"$1"}=$mm;
  $redundo{"I"}=0;
  $redundo{"J"}=0;
 } else { print "$1"; }
 
#  if ($xish =~m/(\-*\d+\.\d+)m/) {

 } print "\n"; 
} 
print "G0 Z10\n";
print "M5 M30\n";

