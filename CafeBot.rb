
require './Jacksloon.rb'
require './Okuda.rb'

class CafeBot < Jacksloon

MARJ = 0.42
@@lipp=0
 def initialize(starx, stary)
  @width = 10.2
  @heigh = 6.0
  @depth = 0.8 #0.75
  
  super(starx, stary)
 end
 def mm(i) return i/25.4 end
 def dx(x)
  return @curxo + x
 end
 def dy(y)
  return @stary + y
 end

 def KYCON5P(x,y,r)
  kyconsterupsidedown(dx(x),dy(y))
 end
 def KYCON3P(x,y,r)
  kyconster(dx(x),dy(y))
 end
  def KOBICONDC(x,y,r)
  kobiconn(dx(x),dy(y))
 end
 def JOHNSON(x,y,r)
   # moony= 3.81*Math.cos(-r*Math::PI/180.0)
  #moonx=3.81*Math.sin(-r*Math::PI/180.0)
  tubo(dx(x),dy(y),mm(4),0,-0.25,2)
  #tubo(dx(x+moonx),dy(y+moony),mm(2),0,-0.25,2)

  
 end
  def a_bolt(x,y,r)
  tubo(dx(x),dy(y),0.14,0,-0.5,4)
 end
 def a_screw(x,y,r)
  screw = -0.16
  drillus(dx(x),dy(y),0,screw)
 end
 def a_sidebutton(x,y,r)
   box(dx(x-mm(2.5)),dy(y-mm(2)),dx(x+mm(2.5)),dy(y+mm(6)),0,-0.3,3)
   box(dx(x-mm(4.5)),dy(y+mm(3)),dx(x+mm(4.5)),dy(y+mm(10)),0,-mm(2),1)
  box(dx(x-mm(4.2)),dy(y+mm(3)),dx(x+mm(4.2)),dy(y+mm(10)),-mm(2),-mm(8),2)
 end
 def an_omron(x,y,r)
  box(dx(x+5),dy(y-5),dx(x-5),dy(y+5),0,-0.3,3)
 end
 def SMT8080(x,y,r)
  tubo(dx(x),dy(y),mm(5),0,-0.55,4)
 end
  def esp30(x,y,r)
  box(dx(x),dy(y-0.3),dx(x+1),dy(y+0.3),-0.4/0.8,-0.5/0.8,1)  
  box(dx(x-2),dy(y-0.8),dx(x),dy(y+0.8),-0.4/0.8,-0.5/0.8,1)

 end
  def KEMETR82_50 (x,y,r)
 end
  def KEMETR82_25 (x,y,r)
 end



 def boxo()
  botrail = dy(-@heighchub+0.5)
  toprail = dy(@heighchub-0.5)
  @curxo += MARJ
  @curxo += $halfwidth

box(dx(0.2),botrail,dx(10),toprail,0,-4.0/8.0,4)
proc()

  @curxo += @width /2

  marx = MARJ + @starx + @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.4)
  
  @curxo += @width /2
  
  @curxo += MARJ
  @curxo += $bitwidth
  return @curxo
 end
 def ducabot
  topnuys = [[2,21]]
  botnuys = [[2,21]]
  @myOkuda.bokchoydeluxe(-0.78,1.0,22,12,topnuys,botnuys)
 end
 def duxo
  #@curxo += $bitwidth
  return @curxo
 end

end
require './cafe_procs.rb'

stutterat(CafeBot)