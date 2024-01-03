
require './PlumPott.rb'
require './Okuda.rb'

class BenjoTop < PlumPott
 
 MARJ = 2/25.4

 def initialize(starx, stary)
  @width = mm(90)
  @heigh = mm(90)

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
screw(27,5.4,0)
JOHNSON(39,27,0)
balpspot(0,63,135)
balpspot(27,72,135)
JOHNSON(39,63,0)
JOHNSON(39,81,0)
screw(27,84.6,0)
KYCONMINIJACK(12.6,90,0)
balpspot(18,45,135)
balpspot(27,18,135)
balpspot(0,27,135)
balpspot(-18,45,135)
JOHNSON(-39,63,0)
balpspot(-27,72,135)
balpspot(-27,18,135)
JOHNSON(-39,9,0)
screw(-27,5.4,0)
JOHNSON(39,45,0)
KOBICONDC(-12.6,90,-90)
screw(-27,84.6,0)
JOHNSON(-39,81,0)
JOHNSON(-39,45,0)
JOHNSON(-39,27,0)



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