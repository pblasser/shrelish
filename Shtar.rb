
require './Bot.rb'
#require 'Complex'
include Math
require './Jacksloon.rb'
#require './dudefunks.rb'
require './Okuda.rb'


class Shtar < Jacksloon
 def initialize(starx, stary)
  @width = 12
  @heigh = 8
  
  @depth = 1.0
  @zstep = @depth/7.0
  @sensoreft = -2.8
  @sensorite = 3.6
  @q = 5.2
  #q was 4.7 then i ran a few protos at 5 strict
  #then i pulled the shape out to 5.2 for
  #the sake of bridge placement of the triangulated
  #string (about quarter inch adjusto)
  super(starx, stary)
 end
 def dx(x)
  return x + @starx + 6
 end
 def cutoPointDeepo(x,y,z)
  if z < -@depth then z = -@depth end
  printf "G1 X%5.3f Y%5.3f Z%5.3f F%d\n", dx(x), y, z, @@feedrate
 end
 
 def polka_bevel(t,z,qz)
  q=5
  q = @q
  z = Float(z)+0.31
  zz = -Float(qz)/8
  begin
  r = -(sqrt(5)*sqrt(sqrt(4000*sin(t)**4*z+
  240*q**2*cos(t)**4*z+
  25*q**4*sin(t)**4-
  10*q**4*cos(t)**2*sin(t)**2+
  q**4*cos(t)**4)+
  5*q**2*sin(t)**2-
  q**2*cos(t)**2))/
  sqrt(50*sin(t)**4+3*q**2*cos(t)**4)
   unless r.is_a?(Complex) then 
    x = r*sin(t)
	y = r*cos(t)
    cutoPointDeepo(x,y,zz) 
   end
 rescue Math::DomainError => e then end
 #rescue Errno::EDOM => e then end
 end
 
   def ova(z,qz)
  mult = 50
  
  for i in 0..(mult*2)do
   t = PI*Float(i)/mult
   polka_bevel(t,z,qz)
  end
 end
 
 def dover(mult,func)
  @nuz = 0
  trank = 1
 # mult = 800
  func.call(0,0,-2)
  for i in 0..(mult*2) do
   t = PI*Float(i)/mult
   func.call(t,@nuz,@nuz)
   if @nuz <= 0 then trank = 1
   elsif @nuz >= 6 then trank = -1 end
   @nuz += trank
  end
 end
 def polka_devil()
  dover(1200,lambda(){|t,z,qz|polka_bevel(t,z,qz)})
 end
 def alpsmet(x,y)
  
  yarse = 0.23
  if y > 0 then yarse = -yarse end
  pipe(x,y+yarse,0.0525,0,-@depth)
  pipe(x,y,0.35/2.0,0,-@depth)
 end
 def beigers(x,y)
  leg = 0.23/2.0
  box(x-0.2,y-leg,x+0.2,y+leg,0,-0.03,1)
  pipe(x,y,0.3/2.54,0,-@depth)
 end
 def onner(x,y)
  box(x-0.16,y-0.1,x+0.16,y+0.1,0,-@depth,2)
 end
 def usbadam(x,y)
  fox(x-0.25,y-0.22,x+0.25,y+0.22,0,-@depth,2)
 end
 
 def plastique()
 @depth = 0.125
 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2
 plasthick = -0.125
 
  left = -2.8
  left = @sensoreft
  alpsmet(left+0.2,1.7)
  beigers(left-0.3,1.7)
  
  alpsmet(left-0.2,-1.7)
  beigers(left+0.3,-1.7)
  
  tubo(left,0,0.55,0,-0.04,1)
  tubo(left,0,0.5,0,-0.04,1)
  
  rite = 3.5
  rite = @sensorite
    pipe(rite,2.4,0.125/2,0,plasthick)
  onner(rite+0.2,2)
  pipe(rite-0.3,2,0.1,0,-@depth)
  pipe(rite+0.294,-(-2.5+1.349-0.1),0.1,0,plasthick)

  
  pipe(rite,-2.4,0.125/2,0,plasthick)
  usbadam(rite-0.2,-2)
  beigers(rite+0.3,-2)
  #trimmer
  pipe(rite+0.419,-(3.775-2.5+0.1),0.1,0,plasthick)
  
  
  tubo(rite,0,0.55,0,-0.035,1)
   tubo(rite,0,0.5,0,-0.035,1)
   
      drillus(5.2, -0.7+0.25, 0, plasthick)
   drillus(5.2, -0.15,  0, plasthick)
   drillus(5.2, 0.15,  0, plasthick)
   drillus(5.2, 0.7-0.25,  0, plasthick)
  polka_itself(lambda(){|x,y| pipe(x,-y,0.125/2,0,plasthick)})
  
  y = (1.5)/2.0 #+ 0.05
  tarx = -5.2
 dend = -3.55 #-3.5 #+ $halfwidth
  fox(tarx,-y,dend,y,0,plasthick,2)
  
      slott = 0.125# - $bitwidth
	  
  ##################PRONT BRIDGE
  pront = lambda(){|x,y| 
   slotf = slott/2.0
   fox(x-slotf,y,x+slotf,y+0.3,0,plasthick,2)
   fox(x-0.3,y,x+0.3,y+0.7,0,plasthick,2)
   #start y+0.6, 0.7, 0.8@@@#@!
  }

  dront = lambda(){|xx,yy| 
   drillus(xx-0.7+0.25, yy, 0, plasthick)
   drillus(xx-0.15, yy, 0, plasthick)
   drillus(xx+0.15, yy, 0, plasthick)
   drillus(xx+0.7-0.25, yy, 0, plasthick)
  }
  bridge = lambda() {|x,y|
   fox(x-0.8,y,x+slott-0.8,y+0.3,0,plasthick,2)
	fox(x+0.8-slott,y,x+0.8,y+0.3,0,plasthick,2)
	dront.call(x, y+0.6-$halfwidth)
	fox(x-1,y,x+1,y+0.55+$bitwidth,0,plasthick,2)
  }

  nut = lambda(){|x,y| 
   dront.call(x,y+0.2+$halfwidth)
   fox(x-0.7-$bitwidth,y-$bitwidth, x+0.7+$bitwidth, y+0.25+$bitwidth,0,plasthick, 2)
  }
  
  
  pront.call(0,0.8)
  pront.call(-0.3,1.45)
  pront.call(0.3,1.45)
  bridge.call(-0.3,2.1)
  pront.call(1,2.0)
  nut.call(-1.8,2.9)
  bridge.call(0,2.7)
  nut.call(1.8,2.9)

  pront.call(0,-1.4)
  pront.call(-0.3,-2.1)
  pront.call(0.3,-2.1)
  bridge.call(-0.3,-2.7)
  pront.call(1,-2.7)
  nut.call(-1.8,-3.2)
  bridge.call(0,-3.3)
  nut.call(1.8,-3.2)
  
	
  #pront.call(0,-1.5)
  #pront.call(-0.3,-2.1)
  #pront.call(0.3,-2.1)
  #bridge.call(-0.3,-2.7)
  #pront.call(1,-2.7)
  #nut.call(-1.8,-3.2)
  #bridge.call(0,-3.3)
  #nut.call(1.8,-3.2)
  
  
  #pront.call(0,0.9)
  #pront.call(-0.3,1.5)
  #pront.call(0.3,1.5)
  #bridge.call(-0.3,2.1)
  #pront.call(1,2.1)
  #nut.call(-1.8,2.9)
  #bridge.call(0,2.7)
  #nut.call(1.8,2.9)
	
	

  
	
 retrax(0.1)
  polka_bevel(0,-0.31,-1)
   mult = 100
  for i in 0..(mult*2)do
   t = PI*Float(i)/mult
   polka_bevel(t,-0.31,0.5)
  end
    for i in 0..(mult*2)do
   t = PI*Float(i)/mult
   polka_bevel(t,-0.31,1)
  end

   retrax(0.1)
  
  
 end
 
 def polka_itself(func)
  nark = lambda() { |x|
  z = -0.2
  q = 5
  q = @q
  y = sqrt((1*(sqrt(35)*
  sqrt(7680*z-
  192*x**4+
  168*q**2*x**2+
  35*q**2))/q)-35)/
  sqrt(21)
  func.call(x,y)
  func.call(x,-y)
  }
    nark.call(4.5)
  nark.call(2)

  func.call(0.5,0.25)
  func.call(-0.5,-0.25)
    nark.call(-2)
  nark.call(-4.5)
  
 end

  
  def polka_bowl(h)
  q = 5 #5.2
  q = @q
  z = -0.30#-0.3-(Float(z)/2)
  zz = 0.1#-0.125 -Float(qz)/8
  s=1
  t=0
  nark = lambda() { 
   begin
    r = -(sqrt(5)*
      sqrt((s*sqrt(2304000*sin(t)**4*z+
             161280*q**2*cos(t)**4*z+
		     11025*q**4*sin(t)**4-
		     5880*q**4*cos(t)**2*sin(t)**2+
		     784*q**4*cos(t)**4))+
		105*q**2*sin(t)**2-
		28*q**2*cos(t)**2))/
	(2*sqrt(3)*sqrt(100*sin(t)**4+7*q**2*cos(t)**4))
	unless r.is_a?(Complex) then 
     x = r*sin(t)
	 y = r*cos(t)
     cutoPointDeepo(x,y,zz) 
    end
  rescue Math::DomainError => e then end
 #rescue Errno::EDOM => e then end
  }
  nark.call()
    dowl = lambda() {|tr,zr,qzr|
   z = -0.3-(Float(zr)/2)
   zz = -0.125 -0.75*Float(qzr)/8 #attenuate depth
   t=tr/2- PI*h
   nark.call()
  }
 for k in 0..8 do
  z = -0.3-(Float(k)/2)
  for j in 0..k do
   zz = -0.125 -0.75*Float(j)/8 #attenuate depth
   
   s=1
   for i in 0..100 do
    ii = i - 100*h
    t = PI*Float(ii)/100
    nark.call()
   end
   s=-1
   for i in 0..100 do
    ii = (100-i) - 100*h
    t = PI*Float(ii)/100
    nark.call()
   end
   s=1
  for i in 0..50 do
    ii = i - 100*h
    t = PI*Float(ii)/100
    nark.call()
   end
  end  
  retrax(0.1)
 end 
 
s=1
  #dover(200,dowl)
  retrax(0.1)
  s=-1
  #dover(200,dowl)
  retrax(0.1)

 end


 
 


 

 
 def ducabot 
 end
 
  def aux(starx,stary,dendx,dendy,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(dx(starx),stary,zstart+0.1)
  for i in 1..step do
   starz = zstart + (incro * i)
   dendz = starz - tan(2.0*PI/180.0)*2.2
   if  (i.divmod(2)[1] != 0) then 
    penetrate(starz)
    cutoPointDeepo(dendx,dendy,dendz)
	else 
	penetrate(dendz)
    cutoPointDeepo(starx, stary, starz) 
   end
  end
 end

 
 def nex()
 y = (1.5-$bitwidth)/2.0
 incro = y/6.0
 starx = -5.9
 dendx = -3.5 + $halfwidth
 
 for i in 0..12 do
  aux(dendx,y-i*incro,starx,y-i*incro,0,-12.0/16.0,6)
  #are we gonna do  13/16? and neck too? 4/2/17
 end
end

 def flip
  retrax(0.1)
   skimtoPoint(dx(0),-3,0.1)
 for i in 1..6 do
  for j in 1..i do
   ova(i,j)
  end 
  retrax(0.1)
 end
@myOkuda = Okuda.new(dx(5.8),0,0.41,2,0.2)
  @myOkuda.bokchoy(-0.8,1.0,4,4)
retrax(0.1)
 #dux(5.5,-1,5.5,1,0,-0.75,6)
 polka_devil()
 retrax(0.5)

 end
 def flipp
 end
 
def flipmark(x)
 @@pentrate = 8
drillus(x*12.0,0,0,-12.0/8.0)#@depth)
  drillus(0,0,0,-12.0/8.0)#@depth)
   @@pentrate = 30
   retrax(0.1)
  #printf("m 0 \n")#dwellus(60)
 end
 
 def boxo
  
  nex()
  dux(dx(-3),0,dx(3),0,0,-0.5,4)
  retrax(0.1)
  polka_itself(lambda(){|x,y| drillus(dx(x),y,0,-0.2)})
   retrax(0.1)
  l = dx(@sensoreft)
  r = dx(@sensorite)
  w = 0.55
  
  bronx(l-w,-2.05,l+w,2.05,0,-(5.0/8.0),5,0.2)
  retrax(0.1)
  polka_bowl(0)
  retrax(0.1)
  
  bronx(r+w,-1,r+w+0.45,1,0,-(7.0/8.0),7,0.2)
  bronx(r-w,-2.55,r+w,2.55,0,-(7.0/8.0),7,0.2)
  retrax(0.1)
  polka_bowl(-1)
  retrax(0.1)
  
 skimtoPoint(dx(0),-3,0.1)
 for i in 1..6 do
  for j in 1..i do
  unless j==6 then
   ova(i,j) end
  end 
  retrax(0.1)
 end
@myOkuda = Okuda.new(dx(5.8),0,0.41,2,0.2)
  @myOkuda.bokchoy(-0.8,1.0,4,4)
  retrax(0.1)
  polka_devil()
  skimtoPoint(dx(0),-3,0.1)
  ova(6,6)
  ova(6,7)
  #plastique()
 end 
 def boxornico_deprix
    @myOkuda = Okuda.new(5.9,0,0.5,2,0.24)
  @myOkuda.bokchoy(-0.75,1.0,4,4)
  retrax(0.1)
  polka_devil()
  skimtoPoint(0,-3,0.1)
  ova(6,7)
 end
 def boxorae
   ova(6,7)
 end
 
 def duxo
  return @starx+@width
 end
 
end

$rimmer = 0.01

def dudderat(clasz)
 process = 0
  xarg = yarg = 1
 unless ARGV[0].nil? then process = Integer(ARGV[0]) end
 unless ARGV[1].nil? then xarg = Integer(ARGV[1]) end


 curxo = 0

 if process==0 then
 for i in 1..xarg do
  mystuff = clasz.new(curxo,0)
  mystuff.flip()
  curxo = mystuff.duxo() + $rimmer*2
 end
 mystuff.flipmark(xarg)
 end

 if process==1 then
 for i in 1..xarg do
  mystuff = clasz.new(curxo,0)
  mystuff.boxo()
  curxo = mystuff.duxo() + $rimmer*2
 end
 end

 if process==2 then
  broth = clasz.new(-6,0)
  broth.plastique()

 end

  printf "G0 Z0.5\n"
  printf "G0 X0 Y0 \n"


end


dudderat(Shtar)