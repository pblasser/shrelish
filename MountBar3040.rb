
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
  @width = cmil(33)
  @heigh = cmil(2.5)
  @depth = 0.8
  super(starx, stary)
 end
 def boxo()
  #spyrtub(dx(4),dy(0),cmil(0.420),0)
  #spyrtub(dx(32),dy(0),cmil(0.420),0)
  box(dx(0),dy(-1.2),dx(4),dy(1.2),0,-0.25,2)
 #tubo(dx(3),dy(0),cmil(0.8),0,-0.25,2)
  spyrtub(dx(3),dy(0),cmil(0.35),0)
  box(dx(29),dy(-1.2),dx(33),dy(1.2),0,-0.25,2)  
  #tubo(dx(30),dy(0),cmil(0.8),0,-0.25,2)
  spyrtub(dx(30),dy(0),cmil(0.35),0)
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