
require './Dude.rb'
require './Okuda.rb'

class Duderon < Dude
 def initialize(n,z)
    @depth=0.8
  super(n,z)
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
  xx = 7.6-$halfwidth
  yy = 2.3-$halfwidth
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
      yy -= 0.16 #$bitwidth
   xx -= 0.25 #$bitwidth
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
 def balmet(x,y)
 x = x+@@lipp + $halfwidth
  tubo(x,y,0.35,-0.25, -0.5,2)
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
  lozgnd(-0.25)
  lozgnda(-0.25)
  #speaker(-6,0)
  ##tubo(@hawi-2.5,0,0.35,-0.25, -0.5,2)
  ##tubo(@hawi+2.5,0,0.35,-0.25, -0.5,2)
  ##dux(@hawi-0.25,1.5,@hawi+0.25,1.5,-0.25, -0.5,2)
  ##dux(@hawi-0.1,1.5,@hawi+0.1,1.5,-0.5, -@depth,2)
  fyral()
  #speaker(6,0)
  #@myOkuda = Okuda.new(@hawi-7,-2.3,2+$bitwidth,0.2+$bitwidth,$bitwidth)
  #@myOkuda.bokchoydeluxe(-@depth,1.0,6,2,[],[])
  #@myOkuda = Okuda.new(@hawi+7,-2.3,2+$bitwidth,0.2+$bitwidth,$bitwidth)
  #@myOkuda.bokchoydeluxe(-@depth,1.0,6,2,[],[])
  
 end 
end
dudderat(Duderon)