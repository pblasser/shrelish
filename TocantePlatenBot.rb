
require './PlumPott.rb'
$bitwidth = 1.0/8.0 
$halfwidth = $bitwidth/2.0

class PlatenBot < PlumPott
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 6
  @heigh = 4
  @depth = 0.85
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end
 def tnut(x,y)
  tubo(x,y,0.3,0,-0.06,1)
  theta = 0
  r = 0.25
  drillus(x+r*Math.sin(theta),y+r*Math.cos(theta),0,-0.14)
  theta = theta + Math::PI*2/3
  drillus(x+r*Math.sin(theta),y+r*Math.cos(theta),0,-0.14)
  theta = theta + Math::PI*2/3
  drillus(x+r*Math.sin(theta),y+r*Math.cos(theta),0,-0.14)
  spyrtub(x,y,0.175/2.0,0.175/2.0)
 end
 def boxo()
  for i in 0..4 do
   tnut(i-2,0-2-(5.0/64.0))
   tnut(i-2,0+2+(5.0/64.0))
  end
  for i in 0..2 do
   tnut(0-3-(5.0/64.0),i-1)
   tnut(0+3+(5.0/64.0),i-1)
  end
  retrax(0.5)
  dwellus(60)
  
  box(0-4,0-3,4,3,0,-0.08,1)
 end

 def ducatop
 end
 def ducabot
 end
 def duxo
 return 0 end
end
stutterat(PlatenBot)