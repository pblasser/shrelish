
require './PlumPott.rb'
require './Okuda.rb'

class BenjoTop < PlumPott
 
 MARJ = 2/25.4
 @@lipp = MARJ

 def initialize(starx, stary)
  @width = mm(90)
  @heigh = mm(30)
  @depth = 0.55
  super(starx, stary)
 end
 def mm(i) return i/25.4 end
 def dx(x)
  return @curxo + mm(x) 
 end
 def dy(y)
  return @stary + mm(-y)
  #return @stary + mm(y)
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
 pipe(dx(y),dy(x),3.3/32,0,-@depth)
end
 def boxo()
  @curxo += MARJ
  @curxo += $halfwidth
  @curxo += mm(15)
  screw(9,6,0)
  screw(-9,6,0)
  a_trimcap(0,10)
  balpspot(7,40,15)
  SMTLED(-2.5,44)
  SMTLED(-8.5,44)

  JOHNSON(-5.5,37,0)
  screw(-9,54,0)
  screw(9,54,0)
 


  @curxo += mm(30)
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+MARJ*2+$bitwidth,mm(8))
  @curxo += mm(30)

  @curxo += mm(15)
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
  @curxo += $bitwidth
  return @curxo
 end
end
stutterat(BenjoTop)