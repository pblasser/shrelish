
require './PlumPott.rb'
 $bitwidth = 2.0/25.4
$halfwidth = $bitwidth/2.0

class NobNob < PlumPott
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

  def alpsdot(x,y,theta)
   skimtoPoint(x,y,0.1)
   #innerrad = 
   thetai = 0
   maxrad = 1.0/8.0 - 1.0/25.4
  radif = 1.0/8.0 - 2.0/25.4
   i = 0
   z = 0
   incro = (Float(@depth) / Float(@zstep)) 
   while z > -@depth do
    z -= incro / NUMSEGS
    radioi = maxrad - (z/-@depth)*radif
    radioi /= 2.0
    yy = radioi * Math.sin(2 * i * Math::PI / NUMSEGS)
    xx = radioi * Math.cos(2 * i * Math::PI / NUMSEGS)
    cutoPointDeepo(x+xx,y+yy,z)
    i += 1
   end

 end

 def boxo()
 alpsdot(0,0,0)
end

 def ducatop
 end
 def ducabot
 end
 def duxo
 return 0 end
end
stutterat(NobNob)