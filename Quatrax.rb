
require './Jacksloon.rb'
require './Okuda.rb'

class Quatrax < Jacksloon
MARJ = 0.42

 def initialize(starx, stary)
  @width = 24.9
  @heigh = 5.0
  @depth = 0.8
  @drilldep = -0.15
  @slidodep = -0.1
  @batdepth = 2
  super(starx, stary)
 end

 def boxo()
  botrail = @stary-@heighchub+0.4
  toprail = @stary+@heighchub-0.4
  @curxo += MARJ
  
  drillerx = @curxo+0.65
  for i in 0..13 do
   drillus(drillerx-0.35,toprail+0.15,0,@drilldep )
   drillus(drillerx,botrail-0.15,0,@drilldep )
   drillus(drillerx+0.07,toprail+0.17,0,-0.1)
   drillus(drillerx+0.35,toprail+0.15,0,@drilldep )
   drillerx += 1.2
   if i==1 then drillerx += 2.0 end
   if i==4 then drillerx += 2.0 end
   if i==8 then drillerx += 2.0 end
   if i==11 then drillerx += 2.0 end
  end

  
  midx = 0.05 + 2.4 + 1  
  midx += @curxo
  midx += 0.5
  kobiconn(midx, @stary+@heighchub)
  midx -= 1.0
  alpswitch(midx, @stary+@heighchub)
  midx = 0.05 + 14.4 + 6 + 1 
  midx += @curxo
  kyconster(midx, @stary+@heighchub)
  
  bordx = @curxo + 0.05
  box(bordx,botrail,bordx+2.4,toprail,0,-0.13,1)
  box(bordx,toprail-1,bordx+1.0,toprail-0.5,-0.13,-0.5,3)
  bordx += 2.4
  
  box(bordx,botrail,bordx+2,toprail,0,@@deepana,2)
  bordx += 2
  
  box(bordx,botrail,bordx+3.6,toprail,0,-0.13,1)
  bordx += 3.6
  
  box(bordx,botrail,bordx+2,toprail,0,@@deepana,2)
  bordx += 2
  
  box(bordx,botrail,bordx+4.8,toprail,0,-0.13,1)
  bordx += 4.8
  
  box(bordx,botrail,bordx+2,toprail,0,@@deepana,2)
  bordx += 2
  
  box(bordx,botrail,bordx+3.6,toprail,0,-0.13,1)
  bordx += 3.6
  
  box(bordx,botrail,bordx+2,toprail,0,@@deepana,2)
  bordx += 2
  
  box(bordx,botrail,bordx+2.4,toprail,0,-0.13,1)
  box(bordx+1.4,toprail-1,bordx+2.4,toprail-0.5,-0.13,-0.5,3)
  @curxo += @width /2
  
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.5)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
 def ducatop
 end
 def ducabot
  topnuys = [[5,9],[40,44]]
  botnuys = []#[33-11,33-3],[33-19,33-16]]
  @myOkuda.bokchoydeluxe(-0.78,1.0,48,10,topnuys,botnuys)
 end
 def duxo
 @curxo += $bitwidth
  return @curxo
 end
end
stutterat(Quatrax)