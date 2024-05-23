

require './PlumPott.rb'
require './Okuda.rb'

#$bitwidth=0.001
#$halfwidth=$bitwidth/2
MARJ = 2/25.4
class ClickTop < PlumPott
#MARJ = 0.42
 
 @@lipp = MARJ
 def cmil(cm)
  return cm/2.54
 end

  def mm(i) return i/25.4 end
 def dy(y)
  return @stary+mm(-y)
 end
 def dx(x)
  return @curxo+mm(x)
 end
 def initialize(starx, stary)
  @width = mm(90)
  @heigh = mm(90)
  super(starx, stary)
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
def omron_side(x,y,r)
  microshallot(dx(y),dy(x),1)
 end

 def omron(x,y,r)
  fox(dx(y-7.5),dy(x+7.5),dx(y+7.5),dy(x-7.5),0,-@depth,4)
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

   def led(x,y,r)
   tubo(dx(y),dy(x),mm(6),0,-0.05,1)
   spyrtub(dx(y),dy(x),mm(5),0)
   
end


 def boxo()  
  @curxo += MARJ
  @curxo += $halfwidth

omron_side(15,0,0)
omron_side(0,0,0)
screw(27,6,0)
balpspot(27,18,135)
JOHNSON(39,9,0)
balpspot(0,63,135)
JOHNSON(0,84,0)
balpspot(27,72,135)
JOHNSON(39,81,0)
screw(27,84,0)
balpspot(-18,45,135)
JOHNSON(-35.4209,42.87299,-6)
JOHNSON(-38.86525,31.42022,-6)
led(0,45,0)
JOHNSON(-39,63,0)
balpspot(-27,72,135)
screw(-27,84,0)
JOHNSON(-39,81,0)
JOHNSON(-27.42719,33.60718,-6)
balpspot(-27,18,135)
screw(-27,6,0)
omron_side(-15,0,0)
balpspot(18,45,135)
JOHNSON(35.14946,41.63133,10)
JOHNSON(27.13615,32.93424,10)
JOHNSON(38.70401,30.44284,10)
JOHNSON(39,63,0)
balpspot(0,27,135)
JOHNSON(-39,9,0)
KOBICONDC(-13,90,-90)
KYCONMINIJACK(13,90,0)


  @curxo += @width/2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+MARJ*2+$bitwidth,mm(8))
  @curxo += @width/2
  
  @curxo += MARJ
    @curxo += $halfwidth
  return @curxo

 end
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoy(-@depth,1.0,16,16)
 end
 def duxo
 # @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01

stutterat(ClickTop)
