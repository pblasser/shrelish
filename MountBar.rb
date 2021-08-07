
require './Jacksloon.rb'
require './Okuda.rb'



class Mounter < Jacksloon
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
  @width = cmil(36)
  @heigh = cmil(2.5)
  @depth = 0.8
  super(starx, stary)
 end
 def boxo()
  spyrtub(dx(4),dy(0),cmil(0.6),0)
  spyrtub(dx(32),dy(0),cmil(0.6),0)
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+$bitwidth,@heigh+$bitwidth,cmil(1.2))
  @curxo += @width /2
  return @curxo
 end
 def ducatop
 end
 def ducabot
  topnuys = []
  botnuys = []
  @myOkuda.bokchoydeluxe(-@depth,1.0,36,4,topnuys,botnuys)
 end
 def duxo
 @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01

stutterat(Mounter)