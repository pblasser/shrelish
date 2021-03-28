
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
 def initialize(starx, stary)
  @width = 5.5+$bitwidth+$bitwidth
  @heigh = cmil(8)
  @depth = 0.5
  super(starx, stary)
 end
 def flip()

 end

 def boxo()  

  @curxo += @width /2

  for i in 0..5 do
   
   x = @curxo + (Math.cos(2*i*Math::PI/6) * 1)
   y = 0 + (Math.sin(2*i*Math::PI/6) * 1)
   grantubo(x,y,0.4,0.4,0,-@depth,4)
   #pipe(x,y,0.4,0,-@depth)
  end
    pipe(@curxo,0,4.5/2,0,-@depth)
  pipe(@curxo,0,@width/2,0,-@depth)
  @curxo += @width /2
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


stutterat(Tocante)