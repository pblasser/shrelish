
require './PlumPott.rb'
require './Okuda.rb'

class BenjoTop < PlumPott
 
 MARJ = 2/25.4

 def initialize(starx, stary)
  @width = mm(100)
  @heigh = mm(100)
  @depth = 0.55
  super(starx, stary)
 end
 def mm(i) return i/25.4 end
 def dx(x)
  return @curxo + mm(x) 
 end
 def dy(y)
  #return @stary + mm(-y)
  return @stary + mm(y)
 end

 def KYCON5P(x,y,r)
  
  #shallot(dx(y),dy(x),1)
 end
 def KYCONMINIJACK(x,y,r)
  #shallot(dx(y),dy(x),-1)
 end
 def KOBICONDC(x,y,r)
  #shallot(dx(y),dy(x),-1)
 end
 def JOHNSON(x,y,r)
  johnson(dx(y),dy(x))
 end
 def balpspot(x,y,r) 
  r=-r
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
balpspot(30,20,135)
swat(33.3333-50,33.3333,-45)
screw(44,6,0)
JOHNSON(44,30,0)
balpspot(0,70,135)
balpspot(30,80,135)
JOHNSON(44,70,0)
screw(44,94,0)
JOHNSON(30,94,0)
KYCONMINIJACK(15,100,0)
balpspot(20,50,135)
balpspot(0,30,135)
balpspot(-20,50,135)
JOHNSON(-44,70,0)
screw(-44,94,0)
JOHNSON(-30,94,0)
balpspot(-30,80,135)
balpspot(-30,20,135)
screw(-44,6,0)
JOHNSON(-30,6,0)
JOHNSON(-44,30,0)
JOHNSON(-44,50,0)
KOBICONDC(-15,100,-90)
JOHNSON(44,50,0)

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