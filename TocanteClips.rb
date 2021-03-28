
require './PlumPott.rb'
require './Okuda.rb'

 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2
class Sidrax < PlumPott
MARJ = 0.42

 def initialize(starx, stary)
  @width = 0.5
  @heigh = 0.5
  @depth = 0.06
  @zstep = 4
  super(starx, stary)
 end

 def boxo()
spyrtub(@curxo,@stary,0.125,0.125)
 #  drillus(@curxo,@stary,0,-@depth )
     skimtoPoint(@curxo-0.4,@stary-0.4,0.1)
   penetrate(-0.06)
  drawzframe(@curxo-0.4,@stary-0.4,@curxo+0.4,@stary+0.4)
 end
 def ducatop
 end
 def ducabot

 end
 def duxo
 @curxo += $bitwidth
  return @curxo
 end
end
stutterat(Sidrax)