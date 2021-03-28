
require './PlumPott.rb'
require './Okuda.rb'

 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2

class Plumbutt < PlumPott
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 6
  @heigh = 6.95 ###1.95 ####wasz 2!!!
  @depth = 0.55
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end
 def dy(y)
  return @stary+y
 end
 def dx(x)
  return @curxo++x
 end


 def boxo()
  alpspot(dx(0),dy(-2),90)
  alpspot(dx(0),dy(-1),190)
  alpspot(dx(0),dy(-0),120)
  alpspot(dx(0),dy(1),10)
  alpspot(dx(0),dy(2),110)
  return @curxo
 end
 def ducatop
 end
 def ducabot
 end
 def duxo
  #@curxo += $bitwidth
  return @curxo
 end
end

stutterat(Plumbutt)