
require './Jacksloon.rb'
require './Okuda.rb'

class BenjoBot < Jacksloon
 
 MARJ = 2/25.4

 def initialize(starx, stary)
  @width = mm(90)
  @heigh = mm(90)
  @depth = 0.8 #0.75
  super(starx, stary)
 end
 def mm(i) return i/25.4 end
 def dx(x)
  return @curxo + mm(45-x) 
 end
 def dy(y)
  return @stary + mm(y-45)
 end

 def KYCON5P(x,y,r)
  kyconsterupsidedown(dx(x),dy(y))
 end
 def KYCONMINIJACK(x,y,r)
  kyconster(dx(x),dy(y))
 end
 def KOBICONDC(x,y,r)
  kobiconn(dx(x),dy(y))
 end
 def JOHNSON(x,y,r)
  tubo(dx(x),dy(y),mm(4),0,-0.25,2)
 end
  def balpspot(x,y,r) end
 def screw(x,y,r)
  screw = -0.16
  drillus(dx(x),dy(y),0,screw)
 end
 def boxo()
  @curxo += MARJ
  @curxo += $halfwidth





KYCON5P(0,0,180)
screw(27,6,0)
JOHNSON(39,9,0)
balpspot(18,45,135)
balpspot(0,27,135)
JOHNSON(39,45,0)
JOHNSON(39,27,0)
balpspot(27,18,135)
screw(-27,6,0)
balpspot(-27,18,135)
balpspot(-18,45,135)
balpspot(-27,72,135)
JOHNSON(-39,63,0)
JOHNSON(-39,45,0)
JOHNSON(-39,27,0)
JOHNSON(-39,9,0)
balpspot(27,72,135)
screw(27,84,0)
balpspot(0,63,135)
KOBICONDC(-13,90,-90)
screw(-27,84,0)
JOHNSON(-39,81,0)
KYCONMINIJACK(13,90,0)
JOHNSON(39,81,0)
JOHNSON(39,63,0)

box(dx(35),dy(10),dx(-35),dy(80),0,-1.0/8,1)


  @curxo += @width/2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+MARJ*2+$bitwidth,mm(8))
  @curxo += @width/2
  
  
  @curxo += MARJ
    @curxo += $halfwidth
  return @curxo
 end
 def ducabot
  topnuys = [[3,10]]
  botnuys = [[4,9]]
  @myOkuda.bokchoytwomo(-0.78,1.0,12,12,topnuys,botnuys)
 end
 def duxo
  return @curxo
 end
end
stutterat(BenjoBot)