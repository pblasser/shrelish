

require './Jacksloon.rb'
require './Okuda.rb'

#$bitwidth=0.001
#$halfwidth=$bitwidth/2

class Shplorer < Jacksloon
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
 def initialize(xarg)
  @width = 11
  @heigh = 11
  @depth = 0.8
  @xarg=xarg
  super($halfwidth,0)
 end

 def boxo()  
  w = @width/2.0
  h = @heigh/2.0
  x = w 
  if(@xarg==0) then
   drillus(dx(w-4),dy(-4),0,-0.15)
   drillus(dx(x-4),dy(+4),0,-0.15)
   drillus(dx(x+4),dy(+4),0,-0.15)
   drillus(dx(x+4),dy(-4),0,-0.15)
   for i in 0..5 do
    x = dx(w+3*Math.cos(2*i*Math::PI/6))
    y = dy(3*Math.sin(2*i*Math::PI/6))
    pipe(x,y,0.4,0,-@depth)
   end
   #pipe(dx(w),dy(0),cmil(1.85),0,-@depth)
   tubo(dx(w),dy(0),cmil(1.85),0,-0.25,2)
   pipe(dx(w),dy(0),0.4,0,-@depth)
  else
   box(dx(w)-1.2,dy(-3),dx(w)+1.2,dy(3),0,-0.5,4)
  end

  @curxo=dx(w)
  @myOkuda = Okuda.new(@curxo,@stary,cmil(@width)+$bitwidth,cmil(@heigh)+$bitwidth,0.02)
  @curxo=dx(w)
  return  @curxo

 end
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoydeluxe(-0.78,1.0,10,10, [], [])
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01

 xarg = 0
 unless ARGV[0].nil? then xarg = Integer(ARGV[0]) end

  broth = Shplorer.new(xarg)
  broth.boxo()
  broth.ducabot()
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"

