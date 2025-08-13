$penisbreath = 1
require './Tocante.rb'
require './Okuda.rb'

  $bitwidth = 4.0/25.4
 $halfwidth = $bitwidth/2

class Studworth < Tocante
 def initialize(starx, stary)
  super(starx, stary)
  @width = 14 
  @heigh = 4
  @heighchub = @heigh / 2.0 
  @depth = 9.0/8.0
 end
 def dix(x) return @curxo+x end
 def diy(y) return @stary+y end 
 def boxo()
  for i in 0..2 do
   drillus(dix(i*6.5+0.5),diy(-1.5),0,-0.25)
   drillus(dix(i*6.5+0.5),diy(1.5),0,-0.25)
  end
  bronk = $bitwidth + 0.03
  trans = 3.0/8.0
  batts = 7.0/8.0
  bronx(dix(0.6),diy(-1.4),dix(13.4),diy(1.4),0,-trans,3,bronk)
  bronx(dix(0.6),diy(-0.5),dix(6),diy(0.5),-trans,-batts,4,bronk)
  
  speaker = 11
  #box(dx(16),dy(-1),dx(19),dy(1.5),-0.12,-0.45,3)
  tubo(dix(speaker),diy(0),1.306,-trans,-batts,4)
  for i in 0..5 do
   ii = i+0.5
   x = dix(speaker) + (Math.cos(2*ii*Math::PI/6) * 0.8)
   y = diy(0) + (Math.sin(2*ii*Math::PI/6) * 0.8)
   pipe(x,y,0.3,-batts,-@depth)
  end
  bronx(dix(9),diy(0.4),dix(10),diy(1.4),-trans,-batts,4,bronk)
  bronx(dix(12.2),diy(-0.5),dix(13.4),diy(0.5),-trans,-batts,4,bronk)
  
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+$bitwidth,@heigh+$bitwidth,0.5)
  @curxo += @width /2
  return @curxo
 end
 
end

flipperat(Studworth)