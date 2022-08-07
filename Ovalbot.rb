
require './Oval.rb'

$bitwidth = 0.125
$halfwidth = $bitwidth/2

class Ovalbot < Oval
 def initialize(n,z)
    @depth=0.8
  super(n,z)
 end
 
 def loz(z)
 #7.6->7.3, 2.3->2.1
  xx = 7.3-$halfwidth
  yy = 2.1-$halfwidth
  star = ova(xx,yy,0)
  skimtoPoint(star[0],star[1],0.1)
  numzegs=64.0
  while (yy > 0.09) do
   for i in 0..numzegs 
    here = ova(xx,yy,i/numzegs)
    cutoPointDeepo(here[0],here[1],z)
   end
   yy -= $bitwidth
   xx -= $bitwidth
  end
 end
 def lozgnd(z)
  xx = 7.3-$halfwidth
  yy = 2.1-$halfwidth
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
  xx = 7.3-$halfwidth
  yy = 2.1-$halfwidth
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
 
 def balpsMET(x,y,t)
 x = x+@@lipp + $halfwidth
  skimtoPoint(x,y,0)
  tubo(x,y,0.35,-0.25, -0.5,2)
 end
 def balpsQMET(x,y,t) balpsMET(x,y,t) end
 def eights(x,y,t)
  screw = -0.16
  x = x+@@lipp + $halfwidth
  drillus(x,y,0,screw)
 end
 def omron(x,y,t) end
 def BRASSO(x,y,t) end
 def swDPDT(x,y,t) end
 def boxo
  Kobi.new(@hawi+0.400,2.550,-1)
  Kyco.new(@hawi-0.400,2.550,1)
  Kyco.new(@hawi-0.400,-2.550,179)
  Kyco.new(@hawi+0.400,-2.550,181)
  loz(-0.125)
  loz(-0.25)
  lozgnd(-0.25)
  lozgnda(-0.25)
  stuber()
 end 

 def ducatop() end
end
dudderat(Ovalbot)