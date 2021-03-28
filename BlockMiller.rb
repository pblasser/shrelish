
require './Jacksloon.rb'
require './Okuda.rb'

class Deerorg < Jacksloon

MARJ = 0.42

 def initialize(starx, stary)
  @width = 11.3
  @heigh = 6.0
  @depth = 0.8 #0.75
  super(starx, stary)
 end

 def dx(x)
  return @curxo + x
 end
 def dy(y)
  return @stary + y
 end
 def drawzsquare(minx,miny,maxx,maxy)
  minx += $halfwidth
  miny += $halfwidth
  maxx -= $halfwidth
  maxy -= $halfwidth
  drawzframe(minx,miny,maxx,maxy)
  end
 def box(minx,miny,maxx,maxy,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(minx+$halfwidth,miny+$halfwidth,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   drawzsquare(minx,miny,maxx,maxy)
  end
 end   
 def boxo()
  botrail = dy(-@heighchub+0.5)
  toprail = dy(@heighchub-0.5)
  @curxo += MARJ
  box(0,-4.25,1,4.25,0,-0.6,3)
 end
end

stutterat(Deerorg)