
require './PlumPott.rb'
require './Okuda.rb'

class BenjoTop < PlumPott
 
 MARJ = 2/25.4

 def initialize(starx, stary)
  @width = mm(80)
  @heigh = mm(80)
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

 def KYCON5P(x,y,r)
  
  shallot(dx(y),dy(x),1)
 end
 def KYCONMINIJACK(x,y,r)
  shallot(dx(y),dy(x),-1)
 end
 def KOBICONDC(x,y,r)
  shallot(dx(y),dy(x),-1)
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
 def swat(x,y,r)
  r=-r
  rotabox(dx(y),dy(x),mm(11),mm(7),r)
  gotoPoint(dx(y),dy(x))
  penetrate(mm(-2.5))
  rotaframe(dx(y),dy(x),mm(14),mm(10),r)
  penetrate(mm(-5))
  rotaframe(dx(y),dy(x),mm(14),mm(10),r)
    penetrate(mm(-7.5))
  rotaframe(dx(y),dy(x),mm(14),mm(10),r)

  penetrate(mm(-2.5))
  rotaframe(dx(y),dy(x),mm(17),mm(13),r)
    penetrate(mm(-5))
  rotaframe(dx(y),dy(x),mm(17),mm(13),r)

  penetrate(mm(-2.5))
  rotaframe(dx(y),dy(x),mm(20),mm(16),r)

  retract
 end 
 def boxo()
  @curxo += MARJ
  @curxo += $halfwidth
KYCON5P(0,0,180)
balpspot(0,24,135)
balpspot(0,56,135)
balpspot(22,62,135)
JOHNSON(34,54,0)
balpspot(16,40,135)
JOHNSON(34,40,0)
JOHNSON(34,26,0)
screw(24,6,0)
balpspot(22,18,135)
screw(-24,6,0)
JOHNSON(-34,10,0)
balpspot(-22,18,135)
JOHNSON(-34,26,0)
JOHNSON(-34,40,0)
balpspot(-16,40,135)
JOHNSON(-34,54,0)
balpspot(-22,62,135)
JOHNSON(-34,70,0)
screw(-24,74,0)
KOBICONDC(-9,80,-90)
KYCONMINIJACK(10,80,0)
screw(24,74,0)
JOHNSON(34,70,0)


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