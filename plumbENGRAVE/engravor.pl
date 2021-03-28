#!/usr/bin/perl

print "plumarray = [";
my $endor = 0;

while (<>){
  my $xish;


  if ($_=~m/(\-*\d+\.*\d*)/) { 
   $xish =  $1 / 1000.0;
  }
  if ($_=~m/(\-*\d+\.\d+)m/) {
   $xish = $1 / 25.4;
  }

 print "$xish";
 if ($endor % 2) {
   print "], ["
 } else {
   print ", "
 } $endor++;

  
} print ";\n"
