
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
  @width = 4.5+$bitwidth+$bitwidth
  @heigh = 7.5
  @depth = 0.8
  super(starx, stary)
 end
 def flip()

 end

 def boxo()  

  @curxo += @width /2
  grantubo(@curxo,0,@width/2,@heigh/2,0,-@depth,4)
#  pipe(@curxo,0,@width/2,0,-@depth)
#  pipe(@curxo,2,@width/2,0,-@depth)
  
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