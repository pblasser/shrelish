

require './Jacksloon.rb'
require './Okuda.rb'



class Tocante < Jacksloon
#MARJ = 0.42
@@lipp = 0.00
 def cmil(cm)
  return cm/2.54
 end
 def dy(y)
  return @stary+cmil(y)
 end
 def dx(x)
  return @curxo+cmil(x)
 end
 def initialize(arg)
  @width = 16
  @heigh = 6
  @depth = 0.5
  @alg = arg
  super(0, 0)
 end
 def flip()

 end

 def boxo()  
  w = 19.5/2.0#3
  h = 12.5/2.0#3
  x = w

  #@curxo = @curxo+(@width-12.415)/2
  drillus(dx(x-w),dy(-h),0,-0.15)
  drillus(dx(x-w),dy(h),0,-0.15)
  drillus(dx(x+w),dy(h),0,-0.15)
  drillus(dx(x+w),dy(-h),0,-0.15)
  box(dx(x-w),dy(-h),dx(x+w),dy(h),0,-0.125,1)
  y =(2.3/2)+$halfwidth
  fox(dx(x-w),0-y,dx(x+w),y,-0.125,-0.25, 1)
  x = dx(x+w)
  y = 0.5
  fox(x-1.5,0-y,x-1,y,-0.15,-@depth, 3)
  @curxo = x +2.75

  out = (6.25)/2.54 
  pipe(@curxo,0,out,0,-@depth)
  return @curxo
  @curxo += @width /2
    if (@alg==0) then siner(0.5)
  else tiner(0.5) end
  if (@alg==0) then siner(15.5)
  else tiner(15.5) end
  @curxo += @width /2
  return @curxo
 end
 def scy(x, yy, s)
  if s<5 then signo = 1 else signo = -1 end
  return x*(1-(yy/3)**4)/2 #+ signo*(yy/3)**8
 end
 def siner(x)
  gotoPoint(x,-3)
  for z in 0..1 do
   penetrate(-z/4.0-0.125)
   for y in 0..96 do 
    yy = y/16.0	- 3
    cutoPoint(x+scy(Math.cos(2*yy*Math::PI),yy,x), yy)
   end
   penetrate(-z/4.0-0.25)
   for y in 0..96 do 
    yy = (96-y)/16.0	- 3
    cutoPoint(x+scy(Math.cos(2*yy*Math::PI),yy,x), yy)
   end
  end
 end
 def tiner(x)
  gotoPoint(x,-3)
  for z in 0..1 do
   penetrate(-z/4.0-0.125)
   for y in 0..6 do 
    yy = y/1.0	- 3
    cutoPoint(x+scy(1,yy,x), yy)
	cutoPoint(x-scy(1,yy,x), yy)
   end
   penetrate(-z/4.0-0.25)
   for y in 0..6 do 
    yy = (6-y)/1.0	- 3
    cutoPoint(x-scy(1,yy,x), yy)
	cutoPoint(x+scy(1,yy,x), yy)
   end
  end
 end
 def ducatop
 end
 def ducabot
 end
 def duxo
 @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01

 xarg = 0
 unless ARGV[0].nil? then xarg = Integer(ARGV[0]) end
  broth = Tocante.new(xarg)
  broth.boxo()
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"


