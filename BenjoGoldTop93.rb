
require './PlumPott.rb'
require './Okuda.rb'

class BenjoTop < PlumPott
 
 MARJ = 2/25.4
 @@lipp = MARJ

 def initialize(starx, stary)
  @width = mm(90)
  @heigh = mm(30)

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
  alpspot_exp(dx(y),dy(x),180+r)
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

  mirror = @@numero % 2 *2 -1



screw(-9,6,0)
balpspot(7*mirror,55,-167*mirror)
SMTLED(-12*mirror,51)
a_trimcap(0,25)
SMTLED(-6*mirror,51)
JOHNSON(-9*mirror,59,0)
screw(-9,84,0)
screw(9,84,0)
screw(9,6,0)





  @curxo += mm(45)
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+MARJ*2+$bitwidth,mm(8))
  @curxo += mm(30)

  @curxo += mm(15)
  @curxo += MARJ
    @curxo += $halfwidth
    @@numero += 1
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