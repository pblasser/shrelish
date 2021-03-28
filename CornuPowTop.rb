
require './Jacksloon.rb'
require './Okuda.rb'
require './plumbENGRAVE/cornuSZILK.rb'

 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2
 
class CornuPowTop < Jacksloon
 MARJ = 0.05

 @@numero = 0
 def initialize(starx, stary)
  @width = 6
  @heigh = 1 ###1.95 ####wasz 2!!!
  @depth = 0.55
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end
 def looscrew(x,y) 
  if $bitwidth == 0.125 then
   drillus(x,y,0,-@depth)
  else
   tubo(x,y,1.0/12,0,-@depth,@zstep)
  end
 end
 def boxo()
  @curxo += MARJ
  widochub = @width/2

  looscrew(@curxo+0.25,@stary-0.35)
  looscrew(@curxo+0.25,@stary+0.35)

  looscrew(@curxo+5.75,@stary-0.35)
  looscrew(@curxo+5.75,@stary+0.35)
  
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.3)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoy(-@depth,1.0,10,4)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end

stutterat(CornuPowTop)