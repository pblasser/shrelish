
require './Jacksloon.rb'
require './Okuda.rb'

class BenjoBot < Jacksloon
 
 MARJ = 2/25.4

 def initialize(starx, stary)
  @width = mm(100)
  @heigh = mm(100)
  @depth = 0.8 #0.75
  super(starx, stary)
 end
 def mm(i) return i/25.4 end
 def dx(x)
  return @curxo + mm(50-x) 
 end
 def dy(y)
  return @stary + mm(y-50)
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
  def alpspot(x,y,r) end
 def screw(x,y,r)
  screw = -0.16
  drillus(dx(x),dy(y),0,screw)
 end
 def boxo()
  @curxo += MARJ
  @curxo += $halfwidth


  KYCON5P(0,0,180)
alpspot(30,20,135)
screw(44,6,0)
JOHNSON(44,30,0)
alpspot(0,70,135)
alpspot(30,80,135)
JOHNSON(44,70,0)
screw(44,94,0)
JOHNSON(30,94,0)
KYCONMINIJACK(15,100,0)
alpspot(20,50,135)
alpspot(0,30,135)
alpspot(-20,50,135)
JOHNSON(-44,70,0)
screw(-44,94,0)
JOHNSON(-30,94,0)
alpspot(-30,80,135)
alpspot(-30,20,135)
screw(-44,6,0)
JOHNSON(-30,6,0)
JOHNSON(-44,30,0)
JOHNSON(-44,50,0)
KOBICONDC(-15,100,-90)
JOHNSON(44,50,0)
box(dx(40),dy(10),dx(-40),dy(90),0,-3.0/8,3)
box(dx(40),dy(72),dx(15),dy(88),-3.0/8,-0.5,1)
box(dx(-15),dy(72),dx(-40),dy(88),-3.0/8,-0.5,1)

  @curxo += @width/2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+MARJ*2+$bitwidth,mm(8))
  @curxo += @width/2
  
  
  @curxo += MARJ
    @curxo += $halfwidth
  return @curxo
 end
 def ducabot
  topnuys = [[4,13]]
  botnuys = [[6,11]]
  @myOkuda.bokchoytwomo(-0.78,1.0,16,16,topnuys,botnuys)
 end
 def duxo
  return @curxo
 end
end
stutterat(BenjoBot)