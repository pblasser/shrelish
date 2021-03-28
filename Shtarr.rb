
require './Bot.rb'
require 'Complex'
include Math
require './Jacksloon.rb'
require './dudefunks.rb'



class Shtar < Jacksloon
 def initialize(starx, stary)
   @width = 4.3
  @heigh = 4
  @depth = 1.5
  @zstep = @depth/7.0
  @polkasquish = 0
  @quadwhy = -1
  @exxon = 0
  super(starx, stary)
 end
 def abs(x)
  if x<0 then return -x 
  else return x end
 end
 def outer(z,qz)
  q = 4.7 #5.2
  z = Float(z)
  zz = -Float(qz)/8
  qy = @quadwhy
  x = @exxon
   y = qy*(sqrt(5)*sqrt(sqrt(240*z-6*x**4+6*x**3+6*q**2*x**2+q**2)/q-1))/sqrt(3) 
   unless y.is_a?(Complex) then 
    cutoPointDeepo(x,y,zz)
	#printf ("%d %f %f\n",qy,x,y)
    @polkasquish = -2*atan2(y,abs(x))/30
   else 
    @quadwhy = -@quadwhy
	@polkasquish = -@polkasquish
	@start = @start -1
	#printf("drink!\n")
   end
   @exxon = @exxon + @polkasquish
   if @start==0 and  @exxon>=0 then return false
   else return true end
 end
 

 
 def inner(x,z,qz,qy)
  q = 4.7 #5.2
  z = -0.1-(Float(z)/2)
  zz = -0.125 -Float(qz)/8
  begin
   y = qy*(sqrt(5)*sqrt(sqrt(21)*sqrt(10240*z-256*x**4+256*x**3+224*q**2*x**2+189*q**2)/q-63))/(2*sqrt(21)) 
   unless y.is_a?(Complex) then 
    cutoPointDeepo(x,Float(y),zz) 
   end
  rescue Errno::EDOM => e then end
 end

 def ova(z,qz)
 @start = 2
 @exxon = 0
  while(outer(z,qz))
  end
 end

 
 def iva(z,qz,qx,qy)
  start = (qx+qy)*50
  dirre = -qy
  for i in 0..100 do
   x = Float(start+(dirre*i))/10
   inner(x,z,qz,qy)
  end
  
 end
 
 def dover()
  @start = 2
  @exxon = 0
  @nuz =0
   trank = 1
  while(outer(@nuz,@nuz))
   if @nuz <= 0 then trank = 1
   elsif @nuz >= 6 then trank = -1 end
   @nuz += trank
  end
 end

 
 def ducabot 
 end
 
  def aux(starx,stary,dendx,dendy,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(starx,stary,zstart+0.1)
  for i in 1..step do
   starz = zstart + (incro * i)
   dendz = starz - tan(2.0*PI/180.0)*1.5
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
 y = (1.4-$bitwidth)/2.0
 incro = y/6.0
 starx = -5.1
 dendx = -3.5 + $halfwidth
 
 for i in 0..12 do
  aux(dendx,y-i*incro,starx,y-i*incro,0,-0.75,6)
 end
end
 
 def boxo
 for i in 1..6
  ova(i,1)
  end
#dover()
 end

 
 def duxo
  return @curxo
 end
 
end

stutterat(Shtar)