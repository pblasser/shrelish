#!/usr/bin/perl

#!/usr/bin/perl

#print "desc xpos ypos rota tobo\n";
#my $endor = "";

while (<>){
 if ($_=~m/(Part\s+)(\S+)(\s+)(\{\s+Name\s+\S+)(\s+Loc\s+\{\s+)(\S+)(\s+)(\S+)(\s+)(\S+)(\s+)(\S+)/) {
  #print "Loke:$2 $4\n";
  my $vale = $2;
  my $xish = $6;
  my $yish = $8;
  my $rota = $10;

  if ($xish =~m/(\-*\d+\.\d+)m/) {
   $xish = $1 / 0.0254;
   #print "metric:$xish\n";
  } else { 
   $xish =  $xish;
   #print "imperial:$oldxish $xish\n";
  } if ($yish =~m/(\-*\d+\.\d+)m/) {
   $yish = $1 / 0.0254;
   #print "metric:$yish\n";
  } else { 
   $yish =  $yish;
   #print "imperial:$oldyish $yish\n";
  } if ($rota =~ m/\}/) {$rota = 0;}
  print "$vale(dx($yish), dy($xish), dr($rota))\n" 
 } 
 
 if ($_=~m/(Path[^\{]+)(\{\s+)([^\}]+)/) {
  print "\$plumarray = [[],[[";
  #print "Loke:$2 $4\n";
  #print ",[[";
  #print "$3";
  my $endor = 0;
  $st = $3;
  $st =~ s/(W\s+\S+)/ /g;
  $st =~ s/(S\s+\S+)/ /g;
  foreach $item ($st =~/\s*(\S+)\s*/g) {
   


   if ($item=~m/(\-*\d+\.\d+)m/) {
    $xish = $1 / 0.0254;
    print $xish
   } 
   elsif ($item=~m/(\-*\d+\.*\d*)/) { 
    $xish =  $item;
    print $xish
   }
   if ($endor % 2) {
    print "], ["
   } else {
    print ", "
   } $endor++;
    
  }
  print "]\n"
 } 
} 


