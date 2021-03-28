
require './Dude.rb'
require './Okuda.rb'

 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2

class Duderon < Dude
 def initialize(n,z)
  #  @depth=0.85
	   @depth=0.55
   @zstep = 4
  super(n,z)
 end
 
 def dx(x)
  return @@lipp + $halfwidth + (@wido*2)-x
 #return x+@@lipp + $halfwidth
 end
 
 def bomron(x,y)
x = dx(x)
 spyrtub(x,-y,0.333,0.333)
end

 def eights(x,y)
 x = x+@@lipp + $halfwidth
  drillus(x,y,0,-0.2)
 end
    def alpsdot(x,y,theta)
   skimtoPoint(x,y,0.1)
   #innerrad = 

  outerrad = 3.0/25.4 - $halfwidth #3.2!
   i = 0
   z = 0
   deepak = -0.40
   incro = (Float(-deepak) / Float(@zstep)) 
   drepak = deepak - incro
   while z > drepak do
    z -= incro / NUMSEGS
	zz = max(z,deepak)
    thetai = i % NUMSEGS
    radioi = outerrad
    if thetai < 6 then 
     thetai = 6 
    end
    if thetai >26 then 
     thetai = 26
    end
    thetai += theta*NUMSEGS/360
    yy = radioi * Math.sin(2 * thetai * Math::PI / NUMSEGS)
    xx = radioi * Math.cos(2 * thetai * Math::PI / NUMSEGS)
    cutoPointDeepo(x+xx,y+yy,zz)
    i += 1
   end
   while z < 0 do
    z += incro / NUMSEGS
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
 
 def balmet(x,y)
 x = dx(x)
 alpsdot(x,y,90)
 alpsdot(x,y,90)
 #alpsdot(x,y,90)
 tubo(x,y,0.35,0,-0.12,2)
 spyrtub(x,y,2.2,2.2)
end
 
 def boxo
  fyral()
 end 
  def ducabot
  end
end
dudderat(Duderon)