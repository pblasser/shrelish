
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
  #box(-s,-s,s,s,0,mm(-4),2)
  n = mm(58/2.0)
  p=mm(12)
  box(-n,-n-p,n,n,mm(-4),mm(-36),10)
  er=mm(12)
  box(er-n,er-n-p,n-er,n-er,mm(-36),mm(-60),8)

  return @curxo
 end
 def ducabot

 end
 def duxo
  return @curxo
 end
end


stutterat(NEMAStump)