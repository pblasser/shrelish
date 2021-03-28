
require './Jacksloon.rb'
require './Okuda.rb'

class Steve < Jacksloon

MARJ = 0.25

 def initialize(starx, stary)
  @width = 6.9
  @heigh = 5.0
  @depth = 0.75
  super(starx, stary)
 end
 def framebox(minx,miny,maxx,maxy,zstart,zdepth,step) 
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(minx+$halfwidth,miny+$halfwidth,zstart+0.1)
  minx += $halfwidth
  miny += $halfwidth
  maxx -= $halfwidth
  maxy -= $halfwidth
  for i in 1..step do
   penetrate(zstart + (incro * i))
   drawzframe(minx,miny,maxx,maxy)
  end
 end   
 def boxo()
  botrail = @stary-@heighchub+0.4
  toprail = @stary+@heighchub-0.4
  #@curxo += MARJ
  
  drillerx = @curxo+0.65
  for i in 0..3 do
   drillus(drillerx-0.35,toprail+0.15,0,-0.2)
   drillus(drillerx+0.07,toprail+0.17,0,-0.1)
   drillus(drillerx+0.35,toprail+0.15,0,-0.2)
   drillerx += 1.2
   if i==1 then drillerx += 2.0 end
  end
  for i in 0..3 do
   drillerx -= 1.2
   drillus(drillerx,botrail-0.15,0,-0.2)
   if i==1 then drillerx -= 2.0 end
  end
  
  #midx = @width/2   
  #midx += @curxo
  #kobiconn(midx, @stary+@heighchub)
  #midx -= 0.7 #1.1
 #alpswitch(midx, @stary+@heighchub)
  #midx += 1.4 #2.2
 #kyconster(midx, @stary+@heighchub)
  bordx = @curxo
  framebox(bordx+0.1,botrail,bordx+2.4,toprail,0,-0.405,3)
  bordx += 2.4
  framebox(bordx,botrail,bordx+2.1,toprail,0,-0.405,3)
  bordx += 2.1
  framebox(bordx,botrail,bordx+2.3,toprail,0,-0.405,3)
  #@curxo += @width /2
  
  #@myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.5)
  #@curxo += @width /2
  #@curxo += MARJ
  return @curxo
 end
 
 def ducatop
 end
 def ducabot
  @myOkuda.bok(-0.78,1.0)
  #was straight up 75 now a little less sparks (whittling)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end

end


mystuff = Steve.new(0,0)
mystuff.boxo()
#mystuff.ducabot()
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"
#stutterat(Tetrax)
#mystuff = Tetrax.new(0,0)
#mystuff.duxo()
#mystuff.boxo()
#mystuff2 = Tetrax.new(mystuff.duxo(), 0)
#mystuff2.boxo()
#mystuff2.duxo()
#mystuff.ducatop()
#mystuff.ducabot()
#mystuff2.ducatop()
#mystuff2.ducabot()

