
require './Jacksloon.rb'
require './Okuda.rb'

class Tetrax < Jacksloon
MARJ = 0.42
 
 def initialize(starx, stary)
  @width = 6.9
  @heigh = 5.0
  @depth = 0.8
  @batdepth = 2
  super(starx, stary)
 end
 def boxo()
  botrail = @stary-@heighchub+0.4
  toprail = @stary+@heighchub-0.4
  @curxo += MARJ
  
  drillerx = @curxo+0.65
  for i in 0..3 do
   drillus(drillerx-0.35,toprail+0.15,0,-0.15)
   drillus(drillerx,botrail-0.15,0,-0.15)
   drillus(drillerx+0.07,toprail+0.17,0,-0.1)
   drillus(drillerx+0.35,toprail+0.15,0,-0.15)
   drillerx += 1.2
   if i==1 then drillerx += 2.0 end
  end
  for i in 0..3 do
   drillerx -= 1.2
   #drillus(drillerx,botrail-0.15,0,-0.15)
   if i==1 then drillerx -= 2.0 end
  end
  
  midx = @width/2   
  midx += @curxo
  kobiconn(midx, @stary+@heighchub)
  midx -= 0.7 #1.1
 alpswitch(midx, @stary+@heighchub)
  midx += 1.4 #2.2
 kyconster(midx, @stary+@heighchub)
  @@deepana= -0.25
  bordx = @curxo + 0.05
  bronx(bordx,botrail,bordx+2.4,toprail,0,-0.125,1,@bronk)
  bronx(bordx,toprail-1,bordx+1.0,toprail-0.5,-0.125,-0.5,3,@bronk)
  bordx += 2.4
  bronx(bordx,botrail,bordx+2,toprail,0,@@deepana,2,@bronk)
  bordx += 2
  bronx(bordx,botrail,bordx+2.4,toprail,0,-0.125,1,@bronk)
  bronx(bordx+1.4,toprail-1,bordx+2.4,toprail-0.5,-0.125,-0.5,3,@bronk)
  
  @curxo += @width /2
  
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.5)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
 def ducatop
 end
 def ducabot
  topnuys = [[2,11]]
  botnuys = []#[33-11,33-3],[33-19,33-16]]
  @myOkuda.bokchoydeluxe(-0.78,1.0,12,10,topnuys,botnuys)
 end
 def duxo
 @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01
stutterat(Tetrax)