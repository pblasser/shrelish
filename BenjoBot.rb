
require './Jacksloon.rb'
require './Okuda.rb'
 MARJ = 2/25.4
class BenjoBot < Jacksloon
 
 @@lipp = MARJ

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
  @curxo+= MARJ
  @curxo += $halfwidth

tubo(dx(74-45),dy(32),mm(5),0,-0.25,2)



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

box(dx(35),dy(10),dx(-35),dy(80),0,-$yobelow/8.0,$yobelow)
box(dx(-10),dy(63),dx(-35),dy(80),-0.125,-4.0/8,3)


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

class GoldBot < Jacksloon
 
 MARJ = 2/25.4
@@numero = 0
 def initialize(starx, stary)
  @width = mm(30)
  @heigh = mm(60)
  @depth = 0.8 #0.75
  
  super(starx, stary)
 end
 def mm(i) return i/25.4 end
 def dx(x)
  return @curxo + mm(30-x) 
 end
 def dy(y)
  return @stary + mm(y-30)
 end

 def JOHNSON(x,y,r)
  tubo(dx(x),dy(y),mm(4),0,-0.25,2)
 end
  def brass(x,y,r)
  tubo(dx(x),dy(y),0.14,0,-0.25,2)
 end
 def screw(x,y,r)
  screw = -0.16
  drillus(dx(x),dy(y),0,screw)
 end
 def boxo()
  @curxo += MARJ
  #@curxo += $halfwidth
  mirr = 1
  if @@numero > 0
   then mirr = -1 end

  screw(15+mirr*9,54,0)
  brass(15-mirr*9,54,0)
  brass(15+mirr*9,6,0)
  screw(15-mirr*9,6,0)
  JOHNSON(15-mirr*9,38,0)
  box(dx(28),dy(10),dx(2),dy(50),0,-$yobelow/8.0,$yobelow)
  box(dx(19),dy(40),dx(11),dy(52),0,-2.0/8,2)
  box(dx(7*mirr+21),dy(24),dx(7*mirr+9),dy(36),-0.125,-4.0/8,3)
  
  @curxo += @width/2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+MARJ*2+$bitwidth,mm(8))
  @curxo += @width/2
  @curxo += MARJ
  @@numero += 1
  #  @curxo += $halfwidth
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
$yobelow=1


def mm(x) return x/25.4 end

def dudderat()
 argument = 0
 cursorx = $halfwidth
 into = Integer(ARGV[0]) rescue nil
 if into  then
  return stutterat(BenjoBot)
 end
 while  (ARGV[argument].nil?) ==false
  argvor = String(ARGV[argument])
  if argvor=="benjolin" then
    $yobelow=2
   cursorx = BenjoBot.new(cursorx,0).boxo()
  elsif argvor=="gold" then
    $yobelow=2
   cursorx = GoldBot.new(cursorx,0).boxo()
  end
  argument = argument + 1
  unless (ARGV[argument].nil?) then 
    BenjoBot.new(0,0).dux(cursorx-mm(20),mm(-9),cursorx+mm(20),mm(-9),0,-0.25,2)
    cursorx+=MARJ

  end
 end
 cursorx += $halfwidth

 myOkuda = Okuda.new(cursorx/2,0,cursorx,mm(94)+$bitwidth,mm(8))
  topnuys = [[3,9]]
  topnuys[0]=topnuys[0].map{|e| e * argument}
  topnuys[0][1]+=1
  botnuys = [[3,9]]
  botnuys[0]=botnuys[0].map{|e| e * argument}
  botnuys[0][0]+=1
  myOkuda.bokchoytwomo(-0.78,1.0,12*argument,12,topnuys,botnuys)
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"
end

dudderat()


#stutterat(BenjoBot)