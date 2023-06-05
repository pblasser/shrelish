
require './Jacksloon.rb'

   $bitwidth = 4.0/25.4
 $halfwidth = $bitwidth/2

class NEMAStump < Jacksloon
 
 def initialize(starx, stary)
  @width = mm(90)
  @heigh = mm(90)
  @depth = 0.8 #0.75
  super(starx, stary)
 end
 def mm(i) return i/25.4 end

 def boxo()
  s=mm(70)
  box(-s,-s,s,s,0,mm(-4),1)
  s=mm(19/2.0)
  tubo(0,0,s,mm(-4),mm(-29),7)


  return @curxo
 end
 def ducabot

 end
 def duxo
  return @curxo
 end
end


stutterat(NEMAStump)