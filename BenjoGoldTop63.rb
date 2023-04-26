
require './PlumPott.rb'
require './Okuda.rb'

class BenjoTop < PlumPott
 
 MARJ = 2/25.4
 @@lipp = MARJ

 def initialize(starx, stary)
  @width = mm(60)
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
   tubo(dx(y),dy(x),mm(4),0,-0.05,1)
   tubo(dx(y),dy(x),mm(2.7),0.05,-0.35,3)
   drillus(dx(y),dy(x),-0.35,-@depth)
end
 def boxo()
  @curxo += MARJ
  @curxo += $halfwidth
  screw(9,6,0)
  screw(-9,6,0)
  a_trimcap(0,10)
  balpspot(7,40,15)
  SMTLED(-2.5,44)
  SMTLED(-8.5,44)

  JOHNSON(9,52,0)
  screw(-9,52,0)
 


  @curxo += @width/2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+MARJ*2+$bitwidth,mm(8))
  @curxo += @width/2
  
  @curxo += MARJ
    @curxo += $halfwidth
  return @curxo
 end
 def ducabot
  topnuys = []
  botnuys = []
  @myOkuda.bokchoy(-@depth,1.0,16,16)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end
stutterat(BenjoTop)