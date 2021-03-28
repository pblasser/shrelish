
require './PlumPott.rb'
$bitwidth = 1.0/8.0 
$halfwidth = $bitwidth/2.0

class PlatenBot < PlumPott
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 12
  @heigh = 8
  @depth = 0.6
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end

 def boxo()
 dwellus(30)
  spyrtub(0,0,11.0/32.0,11.0/32.0)
 end

 def ducatop
 end
 def ducabot
 end
 def duxo
 return 0 end
end
stutterat(PlatenBot)