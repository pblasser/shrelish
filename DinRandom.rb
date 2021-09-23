
require './Dude.rb'


 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2



class Duderon < Dude
 def initialize(n,z)



    @depth=1.5
  super(n,z)


      @wido = 16.0
  @hawi = @wido + @@lipp + $halfwidth
  @hido= 5.0
  @width=@wido*2
  @heigh=@hido*2


 end
 def ovatest(p,w,h)
  t = ((p[0]/w)**2)+((p[1]/h)**2)
  return (t>1.0)
 end
 def randnode()
  
  while true
   r=[@wido*2*rand()-@wido, @hido*2*rand()-@hido]
   if ovatest(r,8.5,3) then
    if !ovatest(r,@wido-0.5,@hido-0.5) then
      if (r[0]**2>8) then break end
    end
   end
  end
  return r
 end


 

  def alpsdot(x,y,theta)
   skimtoPoint(x,y,0.1)
   #innerrad = 

  outerrad = 3.0/25.4 - $halfwidth #3.2!
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
  def dx(x)
  return x+@hawi
 #return x+@@lipp + $halfwidth
 end
 
 def balmet(x,y)
 x = dx(x)
 alpsdot(x,y,90)
 alpsdot(x,y,90)
 #alpsdot(x,y,90)
 tubo(x,y,0.35,0,-0.12,2)
 spyrtub(x,y,2,0)
end

 def bomron(x,y)
 x = x+@@lipp + $halfwidth
 #   dux(@hawi-0.25,1.5,@hawi+0.25,1.5,-0.25, -0.5,2)
 # dux(@hawi-0.1,1.5,@hawi+0.1,1.5,-0.5, -@depth,2)
 end
 def eights(x,y)
 x = x+@@lipp + $halfwidth
  drillus(x,y,0,-0.4)
 end
 def boxo
  for i in 0..300
    r=randnode()
    drillus(dx(r[0]),r[1],0,-@depth)
  end
  spyrtub(dx(-6),0,0.3,0)
  spyrtub(dx(6),0,0.3,0)
  balmet(-2.5,0)
  balmet(2.5,0)
 end 
end
dudderat(Duderon)