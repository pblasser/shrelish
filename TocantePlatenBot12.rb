
require './PlumPott.rb'
$bitwidth = 1.0/8.0 
$halfwidth = $bitwidth/2.0

class PlatenBot < PlumPott
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 12
  @heigh = 8
  @depth = 1.1
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end
 def tnut(x,y)
  tubo(x,y,0.3,0,-0.25,2)
  theta = 0
  r = 0.25
  drillus(x+r*Math.sin(theta),y+r*Math.cos(theta),0,-0.3)
  theta = theta + Math::PI*2/3
  drillus(x+r*Math.sin(theta),y+r*Math.cos(theta),0,-0.3)
  theta = theta + Math::PI*2/3
  drillus(x+r*Math.sin(theta),y+r*Math.cos(theta),0,-0.3)
  spyrtub(x,y,0.175/2.0,0.175/2.0)
 end
 def boxo()
  marj = 1.0/8.0
  widochub = @width/2-1
  hidochub = @heigh/2-1
  for i in 0..(@width-2) do
   tnut(i-widochub,0-4-marj)
   tnut(i-widochub,0-marj)
   tnut(i-widochub,0+4+marj)
  end
  for i in 0..(@heigh-2) do
   tnut(0-6-marj,i-hidochub)
   tnut(0+6+marj,i-hidochub)
  end
  retrax(0.5)
  dwellus(60)
  
  box(0-6.5,0-4.5,6.5,4.5,0,-0.08,1)
 end

 def ducatop
 end
 def ducabot
 end
 def duxo
 return 0 end
end
stutterat(PlatenBot)