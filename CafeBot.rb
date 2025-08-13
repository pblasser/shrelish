
require './Jacksloon.rb'
require './Okuda.rb'
require './Curxuda.rb'

class CafeBot < Jacksloon

MARJ = 0.42
#@@lipp=0
 def initialize(starx, stary)
  @width = 10.2
  @heigh = 6.0
  @depth = 0.8 #0.75
  @outier= -1.0/8.0
  @intier= -0.25
  
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
  retract
 end
 def KYCON3P(x,y,r)
  kyconster(dx(x),dy(y))
  retract
 end
  def KOBICONDC(x,y,r)
  kobiconn(dx(x),dy(y))
  retract
 end
 def JOHNSON(x,y,r)
   # moony= 3.81*Math.cos(-r*Math::PI/180.0)
  #moonx=3.81*Math.sin(-r*Math::PI/180.0)
  if (y.abs>2.5) then
   tubo(dx(x),dy(y),mm(4),0,-0.25,2)
   retract
  else
   cutoPoint(dx(x),dy(y))
    penetrate(@intier)
   drawzdisque(dx(x),dy(y),mm(4),@intier)
  end

  #tubo(dx(x+moonx),dy(y+moony),mm(2),0,-0.25,2)

  
 end
 def a_bolt(x,y,r)
  fubo(dx(x),dy(y),0.18,0,-0.12,1)
  #tubo(dx(x),dy(y),0.14,-0.12,-0.5,3)
  pipe(dx(x),dy(y),0.14,-0.12,-0.5)
  retract
 end
 def a_screw(x,y,r)
  screw = -0.16
  drillus(dx(x),dy(y),0,screw)
  retract
 end
 def a_sidebutton(x,y,r)
   box(dx(x-mm(2.5)),dy(y-mm(2)),dx(x+mm(2.5)),dy(y+mm(6)),0,-0.3,3)
   box(dx(x-mm(4.5)),dy(y+mm(3)),dx(x+mm(4.5)),dy(y+mm(10)),0,-mm(2),1)
  box(dx(x-mm(4.2)),dy(y+mm(3)),dx(x+mm(4.2)),dy(y+mm(10)),-mm(2),-mm(8),2)
  retract
 end
  def a_multibutton(x,y,r)
   fox(dx(x-0.3),dy(y),dx(x+0.3),dy(y+0.5),0,-0.12,1)
   retract

 end
 def an_omron(x,y,r)
  box(dx(x+5),dy(y-5),dx(x-5),dy(y+5),0,-0.3,3)
  retract
 end
 def SMT8080(x,y,r)
  danger_tube(dx(x),dy(y),mm(5),@outier,-0.55,3)
  retrax(@intier)
 end
  def esp30(x,y,r)
  box(dx(x),dy(y-0.3),dx(x+1),dy(y+0.3),-0.1/0.8,-0.5/0.8,4)  
  box(dx(x-2),dy(y-0.8),dx(x),dy(y+0.8),-0.1/0.8,-0.5/0.8,4)
  retract
 end
  def KEMETR82_50 (x,y,r)
    #rotabo(dx(x),dy(y),0.5,0.2,0.5,4,180-r)
 end
  def KEMETR82_25 (x,y,r)

   danger_rotabo(dx(x),dy(y),0.5,0.2,@outier,-0.55,3,180-r)
   retrax(@intier)

    #rotabo(dx(x),dy(y),0.5,0.2,0.5,4,180-r)
 end



 def boxo()
  botrail = dy(-@heighchub+0.5)
  toprail = dy(@heighchub-0.5)
  @curxo += MARJ
  @curxo += $halfwidth

box(dx(0.2),botrail,dx(10),toprail,0,@outier,1)
retract
proc()

  @curxo += @width /2

  marx = MARJ + @starx + @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.4)
  

  topnuys = [[4.7,4.5,0.5,0.3]]

  botnuys = [[-4.7,-4.5,-0.5,-0.3],
          [0.7,1,4,4.3]]

  carr = Curxuda.genarr(@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.4,topnuys,botnuys)
  @myCurxuda = Curxuda.new(@curxo,@stary,0.81,carr)

  @curxo += @width /2
  
  @curxo += MARJ
  @curxo += $bitwidth
  return @curxo
 end
 def ducabot
  topnuys = [[2,21]]
  botnuys = [[2,21]]
  #@myOkuda.bokchoydeluxe(-0.78,1.0,22,12,topnuys,botnuys)
  @myCurxuda.bok()
 end
 def duxo
  #@curxo += $bitwidth
  return @curxo
 end

end
require './cafe_procs.rb'

stutterat(CafeBot)