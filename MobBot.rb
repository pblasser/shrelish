
require './Jacksloon.rb'
require './Okuda.rb'

class Mobbot < Jacksloon

MARJ = 0.5

 def initialize(starx, stary)
  @width = 4.72
  @heigh = 5.0
  @depth = 0.8 #0.75
  super(starx, stary)
 end

 def dx(x)
  return @curxo + x
 end
 def dy(y)
  return @stary + y
 end


 def boxo()
  botrail = dy(-@heighchub+0.4)
  toprail = dy(@heighchub-0.4)
  @curxo += MARJ
  screw = -0.16
  
  drillerx = @curxo+0.55
  for i in 0..3 do
   drillus(drillerx-0.35,toprail+0.15,0,-0.15)
   drillus(drillerx+0.35,toprail+0.15,0,-0.15)
   box(drillerx-0.25, dy(3.5-2.5),drillerx+0.25,dy(4.5-2.5),0,-0.12,1)
   drillus(drillerx,botrail-0.15,0,-0.15)
   drillerx += 1.2
  end
  
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.5)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
 def ducabot
  @myOkuda.bokchoydeluxe(-0.78,1.0,16,12,[],[])
 end
 def duxo
  return @curxo
 end

end

stutterat(Mobbot)