
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
  @heigh = 5.5
  @depth = 0.5
  @alg = arg
  super(0, 0)
 end
 def boxo()  
   w = 11.5/2.0#3
  h = 11.5/2.0#3
  x = w
  
  @curxo = @curxo+(@heigh/2)
  drillus(dx(-w),dy(-h),0,-0.15)
  drillus(dx(-w),dy(h),0,-0.15)
  drillus(dx(w),dy(h),0,-0.15)
  drillus(dx(w),dy(-h),0,-0.15)
  box(dx(-w),dy(-h),dx(w),dy(h),0,-0.125,1)
  y =(2.15/2)+$halfwidth
  fox(dx(-w),-y,dx(w),y,-0.125,-0.196, 1)
  fox(dx(-2),dy(-2),dx(2),dy(2),-0.125,-@depth, 3)
  

  @curxo = @curxo+4
  pipe(@curxo,0,0.75,0,-@depth)
  @curxo=@curxo+(@heigh/2)+0.125
  return @curxo
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
broth = Tocante.new(0)
donk = broth.boxo()
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"


