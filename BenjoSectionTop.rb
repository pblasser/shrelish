
require './PlumPott.rb'
require './Okuda.rb'

class BenjoTop < PlumPott
 
 MARJ = 2/25.4
 @@lipp = MARJ

 def initialize(starx, stary)
  @width = mm(90)
  @heigh = mm(20)
  @depth = 0.55
  super(starx, stary)
 end
 def mm(i) return i/25.4 end
 def dx(x)
  return @curxo + mm(x) 
 end
 def dy(y)
  return @stary + mm(10-y)
  #return @stary + mm(y)
 end
 def balpspot(x,y,r) 
  r=r
  alpspot(dx(y),dy(x),180+r)
 end

 def JOHNSON(x,y,r)
  johnson(dx(y),dy(x))
 end
 def balpspot(x,y,r) 
  r=r
  alpspot(dx(y),dy(x),180+r)
 end
 def screw(x,y,r)
  looscrew(dx(y),dy(x))
 end

 def a_trimcap(x,y)
  pipe(dx(y),dy(x),0.06,0,-@depth)
  tubo(dx(y),dy(x),0.33,0,-0.4,4)
 end
  def SMTLED(x,y)
   tubo(dx(y),dy(x),mm(4),0,-0.05,1)
   tubo(dx(y),dy(x),mm(2.7),0.05,-0.35,3)
   drillus(dx(y),dy(x),-0.35,-@depth)
end
 def boxo()
  @curxo += MARJ
  @curxo += $halfwidth
  #@curxo += mm(10)

  screw(14,6,0)
JOHNSON(5.55227,33.34637,-9)
SMTLED(4.58006,53.58791)
JOHNSON(14.99318,55.62656,-9)
JOHNSON(14.99449,67.91418,-9)
screw(6,84,0)
JOHNSON(15.14426,79.93885,-9)
JOHNSON(8.99351,44.73316,-9)

balpspot(7.37512,15.84292,180)

  @curxo += mm(45)
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+MARJ*2+$bitwidth,mm(8))
  @curxo += mm(45)

  @curxo += MARJ
    @curxo += $halfwidth
  return @curxo
 end
 def ducabot
  topnuys = []
  botnuys = []
  @myOkuda.bokchoy(-@depth,1.0,16,6)
 end
 def duxo
  #@curxo += $bitwidth
  return @curxo
 end
end
$rimmer=0.01
stutterat(BenjoTop)