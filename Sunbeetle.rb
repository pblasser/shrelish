
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
  oscacc = 0
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
  printf "G1 X%5.4f Y%5.4f Z%5.4f\n", dx(x), y, z
 end
 #(r*sin(t))^4-40*z=q^2*(-0.6*(r*cos(t))^2*(0.1*(r*cos(t))^2+1/3))
 #solved for r
 def polka_bevel(t,z,qz)
  q=5
  q = @q
 # z = Float(z)/2+0.31
 #0.631
  z = Float(z)/10+0.31
  zz = -Float(qz)/8
  begin
  r = -(sqrt(5)*sqrt(sqrt(4000*sin(t)**4*z+
  240*q**2*cos(t)**4*z+
  q**4*cos(t)**4)-
  q**2*cos(t)**2))/
  sqrt(50*sin(t)**4+3*q**2*cos(t)**4)
  #r = -(sqrt(5)*sqrt(sqrt(4000*sin(t)**4*z+
  #240*q**2*cos(t)**4*z+
  #25*q**4*sin(t)**4-
  #10*q**4*cos(t)**2*sin(t)**2+
  #q**4*cos(t)**4)+
  #5*q**2*sin(t)**2-
  #q**2*cos(t)**2))/
  #sqrt(50*sin(t)**4+3*q**2*cos(t)**4)
   unless r.is_a?(Complex) then 
    r = r *2
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
  z = 0.30#-0.3-(Float(z)/2)
  zz = -0.1#-0.125 -Float(qz)/8
#    z = Float(z)+0.31
#  zz = -Float(qz)/8

  s=1
  t=0
  nark = lambda() { 
   begin

  #r = -(sqrt(5)*sqrt(sqrt(4000*sin(t)**4*z+
  #240*q**2*cos(t)**4*z+
  #q**4*cos(t)**4)-
  #q**2*cos(t)**2))/
  #sqrt(50*sin(t)**4+3*q**2*cos(t)**4)
  ##r = -(sqrt(5)*sqrt(sqrt(4000*sin(t)**4*z+
  ##240*q**2*cos(t)**4*z+
  ##25*q**4*sin(t)**4-
  ##10*q**4*cos(t)**2*sin(t)**2+
  ##q**4*cos(t)**4)+
  ##5*q**2*sin(t)**2-
  ##q**2*cos(t)**2))/
  ##sqrt(50*sin(t)**4+3*q**2*cos(t)**4)



        r = -(sqrt(5)*
      sqrt(sqrt(2304000*sin(t)**4*z+
             161280*q**2*cos(t)**4*z+
#         11025*q**4*sin(t)**4-
 #        5880*q**4*cos(t)**2*sin(t)**2+
         784*q**4*cos(t)**4)-
  #  105*q**2*sin(t)**2-
    28*q**2*cos(t)**2))/
  (2*sqrt(3)*sqrt(100*sin(t)**4+7*q**2*cos(t)**4))





  unless r.is_a?(Complex) then 
    r=r*2
     x = r*sin(t)
   y = r*cos(t)
     cutoPointDeepo(x,y,zz) 
    end
  rescue Math::DomainError => e then 
   print("poop" ) 
   print(r)
 end
 #rescue Errno::EDOM => e then end
  }
  nark.call()
    dowl = lambda() {|tr,zr,qzr|
   z = 0.3+(Float(zr)/20)
   zz = 0.125 +0.75*Float(qzr)/8 #attenuate depth
   t=tr/2- PI*h
   nark.call()
  }
  jk = 14
 for k in 0..jk do
  z = jk- (Float(k+1)/jk)
  z=z/20 
  z=0.331-(8/Float(jk))*(Float(k)/27)
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
 fatnessbogey = 0.02 #0.03
 y = 0.75+fatnessbogey-$halfwidth
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
  # skimtoPoint(dx(0),-3,0.1)
 for i in 1..6 do
  for j in 1..i do
   ova(i,j)
  end 
  retrax(0.1)
 end
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
  

  retrax(0.1)
 # polka_itself(lambda(){|x,y| drillus(dx(x),y,0,-0.2)})
   retrax(0.1)
  l = dx(@sensoreft)
  r = dx(@sensorite)
  w = 0.55
  

  retrax(0.1)
  polka_bowl(0)
  retrax(0.1)

  retrax(0.1)
  polka_bowl(-1)

  retrax(0.1)
  
 #skimtoPoint(dx(0),-3,0.1)
 for i in 1..6 do
  for j in 1..i do
  unless j==6 then
   ova(i,j) end
  end 
  retrax(0.1)
 end

  retrax(0.1)
  polka_devil()
  #skimtoPoint(dx(0),-3,0.1)
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



  printf "G0 Z0.5\n"
  printf "G0 X0 Y0 \n"


end


dudderat(Shtar)