
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
  @width = cmil(28)
  @heigh = cmil(8)
  @depth = 0.6
  super(starx, stary)
 end

 def boxo()
 dwellus(15)
  for i in 0..5 do
   x = Math.cos(2*i*Math::PI/6) * 0.75
   y = Math.sin(2*i*Math::PI/6) * 0.75
   spyrtub(x,y,0.25,0.25)
  end
 end
 def ducatop
 end
 def ducabot
 end
 def duxo
  return 0
 end
end
$rimmer = 0.01


stutterat(Tocante)