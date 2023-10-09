
require './PlumPott.rb'
require './Okuda.rb'

class Thumbplasty < PlumPott
 
 MARJ = 2/25.4
 @@lipp = MARJ

 def initialize(starx, stary)
  @width = mm(79)
  @heigh = mm(40)
  @depth = mm(11)
  super(starx, stary)
 end
 def mm(i) return i/25.4 end
 def dx(x)
  return @curxo + mm(x) 
 end
 def dy(y)
  return @stary + mm(y)
  #return @stary + mm(y)
 end


 def seil(x,y,w,o,screw)
  slot=(w-screw)/2.0
  box(x-slot,y-mm(17),x+slot,y+mm(17),0,-mm(5),3)
  spyrtub(x-w/2,y+o,screw/2+mm(0.5),0)
  spyrtub(x+w/2,y+o,screw/2+mm(0.5),0)
 end

 def screw(x,y,r)
  looscrew(dx(x),dy(y))
 end

 def boxo()
  @curxo += $halfwidth

  screw(10,0,0)
  seil(dx(20),dy(0),mm(7),mm(5),mm(2.6))
  seil(dx(29),dy(0),mm(8),mm(-5),mm(3))
  seil(dx(40),dy(0),mm(10),mm(5),mm(4))
  seil(dx(53),dy(0),mm(12),mm(-5),mm(5))
  screw(68,0,0)

  @curxo += @width/2
  @myOkuda = Okuda.new(@curxo,@stary,@width+$bitwidth,@heigh+$bitwidth,mm(8))
  @curxo += @width/2
    @curxo += $halfwidth
  return @curxo
 end
 def ducabot
  topnuys = []
  botnuys = []
  @myOkuda.bokchoytiers(-@depth,1.0,16,6,-5)
 end
 def duxo
  #@curxo += $bitwidth
  return @curxo
 end
end
$rimmer=0.01
stutterat(Thumbplasty)