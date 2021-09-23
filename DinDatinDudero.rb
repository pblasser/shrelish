
require './Dude.rb'
require './Okuda.rb'
 $bitwidth = 4.0/25.4
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
 def speaker(x,y)
  tubo(@hawi+x,y,1.306,-0.15,-0.55,3)
  for i in 0..5 do
   xx = x + (Math.cos(2*i*Math::PI/6) * 0.8)
   yy = y + (Math.sin(2*i*Math::PI/6) * 0.8)
   pipe(@hawi+xx,yy,0.3,-0.55,-@depth)
  end
 end
 def loz(z)
  xx = 15.5-$halfwidth
  yy = 4.5-$halfwidth
  star = ova(xx,yy,0)
  skimtoPoint(star[0],star[1],0.1)
  numzegs=64.0
  while (yy > 0) do
   for i in 0..numzegs 
    here = ova(xx,yy,i/numzegs)
    cutoPointDeepo(here[0],here[1],z)
   end
   #yy -= $bitwidth
   #xx -= $bitwidth
      yy -= $bitwidth
   xx -= $bitwidth
  end
 end
 def lozgnd(z)
  xx = 7.6-$halfwidth
  yy = 2.3-$halfwidth
  star = ova(xx,yy,53)
  dend = ova(xx,yy,53)
  skimtoPoint(star[0],star[1],z)
  numzegs=64.0
  for i in 0..5  do
   star = ova(xx,yy,53/numzegs)
   dend = ova(xx,yy,54/numzegs)
   dux(star[0],star[1],dend[0],dend[1],z,-0.5,2)
   yy -= $bitwidth
   xx -= $bitwidth
  end
 end
   def lozgnda(z)
  xx = 7.6-$halfwidth
  yy = 2.3-$halfwidth
  star = ova(xx,yy,21)
  dend = ova(xx,yy,23)
  skimtoPoint(star[0],star[1],z)
  numzegs=64.0
  for i in 0..5  do
   star = ova(xx,yy,21/numzegs)
   dend = ova(xx,yy,22/numzegs)
   dux(star[0],star[1],dend[0],dend[1],z,-0.5,2)
   yy -= $bitwidth
   xx -= $bitwidth
  end
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
  return x
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
  #box(@hawi-0.52, -2.5, @hawi+0.52, -0.2, 0, -0.7, 5)
  #box(@hawi-1, -2.7, @hawi+1, -2.3, 0, -@depth, 6)
  Kobi.new(@hawi+0.400,2.550,-1)
  Kyco.new(@hawi-0.400,2.550,1)
  loz(-0.125)
  loz(-0.25)
  loz(-0.5)
  loz(-0.75)
  loz(-1)
  lozgnd(-0.25)
  lozgnda(-0.25)
  #speaker(-6,0)
  ##tubo(@hawi-2.5,0,0.35,-0.25, -0.5,2)
  ##tubo(@hawi+2.5,0,0.35,-0.25, -0.5,2)
  ##dux(@hawi-0.25,1.5,@hawi+0.25,1.5,-0.25, -0.5,2)
  ##dux(@hawi-0.1,1.5,@hawi+0.1,1.5,-0.5, -@depth,2)
  #fyral()
  balmet(@hawi-2.5,0)
  balmet(@hawi+2.5,0)
  #speaker(6,0)
  #@myOkuda = Okuda.new(@hawi-7,-2.3,2+$bitwidth,0.2+$bitwidth,$bitwidth)
  #@myOkuda.bokchoydeluxe(-@depth,1.0,6,2,[],[])
  #@myOkuda = Okuda.new(@hawi+7,-2.3,2+$bitwidth,0.2+$bitwidth,$bitwidth)
  #@myOkuda.bokchoydeluxe(-@depth,1.0,6,2,[],[])
  
 end 
end
dudderat(Duderon)