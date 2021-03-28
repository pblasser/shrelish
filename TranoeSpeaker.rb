
require './Jacksloon.rb'
require './Okuda.rb'



class Tranoe < Jacksloon
#MARJ = 0.42
@@lipp = 0.00

 def dy(y)
  return @stary
 end
 def dx(x)
  return @curxo
 end
 def initialize(starx, stary)
  @width = 5.0
  @heigh = 5.0
  @depth = 0.5
  super(starx, stary)
 end

 def boxo()
  for i in 0..1 do
   drillus(dx(i*3.25+(5-3.25)/2),dy(3.25/2.0),0,-0.5)
   drillus(dx(i*3.25+(5-3.25)/2),dy(-3.25/2.0),0,-0.5)
  end
  for i in 0..5 do
   x = dx(2.5) + (Math.cos(2*i*Math::PI/6) * 1)
   y = dy(0) + (Math.sin(2*i*Math::PI/6) * 1)
   pipe(x,y,0.5,0,-@depth)
  end
   pipe(dx(2.5),dy(0),3.5/2,0,-@depth)
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+$bitwidth,@heigh+$bitwidth,0.5)
  @curxo += @width /2
  return @curxo
 end
 def ducatop
 end
 def ducabot
  topnuys = []
  botnuys = []#[33-11,33-3],[33-19,33-16]]
  @myOkuda.bokchoydeluxe(-0.8,1.0,24,10,topnuys,botnuys)
 end
 def duxo
 @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01

stutterat(Tocante)