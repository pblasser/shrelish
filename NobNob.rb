
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
 def max (x,y)
  if (x>y) then return x
  else return y end
 end
  def alpsdot(x,y,theta)
   skimtoPoint(x,y,0.1)
   #innerrad = 

  outerrad = 3.1/25.4 - $halfwidth
   i = 0
   z = 0
   deepak = -0.45
   incro = (Float(-deepak) / Float(@zstep)) 
   drepak = deepak - incro
   while z > drepak do
    z -= incro / NUMSEGS
	zz = max(z,deepak)
    thetai = i % NUMSEGS
    radioi = outerrad
    if thetai < 6 then 
     thetai = 7 
    end
    if thetai >26 then 
     thetai = 25
    end
    thetai += theta*NUMSEGS/360
    yy = radioi * Math.sin(2 * thetai * Math::PI / NUMSEGS)
    xx = radioi * Math.cos(2 * thetai * Math::PI / NUMSEGS)
    cutoPointDeepo(x+xx,y+yy,zz)
    i += 1
   end

 end

 
 def dwank(x,y,r,p)
   dux(x-0.175,y+(r*p),x+0.175,y+r*p,0,-0.3-0.125,2)
 dux(x-0.175,y+r*p+0.01,x+0.175,y+r*p+0.01,0,-0.3-0.125,2)
 end
 def joff(x,y,r)
 screwid = 0.125
 threadoff = screwid/2 - $halfwidth
 alpsdot(x,y,90)
 alpsdot(x,y,90)
 #tubo(x,y,3.1/25.4,0,-0.5,3)
 tubo(x,y,0.35,0,-0.12,2)
 dwank(x,y,r,0.333)
 dwank(x,y,r,0.666)
 dux(x-threadoff,y,x-threadoff,y+r,0,-0.3-(screwid/2),2)
 dux(x+threadoff,y,x+threadoff,y+r,0,-0.3-(screwid/2),2)
 
 box(x-0.125,y+1.2,x+0.125,y+1.5,0,-0.3-0.125,2)
 spyrtub(0,0,r,r)
end
 def boxo()
 joff(0,0,1.5)
end

 def ducatop
 end
 def ducabot
 end
 def duxo
 return 0 end
end
stutterat(NobNob)