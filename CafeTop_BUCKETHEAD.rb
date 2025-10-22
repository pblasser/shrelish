
require './PlumPott.rb'
require './Okuda.rb'
require './Curxuda.rb'

 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2
MARJ=0.05
class CafeTop < PlumPott
 @@numero = 0
 def a_screw(x,y,r)
 looscrew(dx(x),dy(y))
 end
  def a_bolt(x,y,r)
 looscrew(dx(x),dy(y))
 end
 def ADAMUSB(x,y,r)
 fox(dx(x-0.23),dy(y+0.25),dx(x+0.23),dy(y-0.25),0,-@depth,4)
 end
  def an_omron(x,y,r)
 rotabo(dx(x),dy(y),0.5,0.6,0.125,1,r)
  rotabox(dx(x),dy(y),0.55,0.55,r)
 end
 def JOHNSON(x,y,r)
 johnson(dx(x),dy(y))
 end
  def a_punkt(x,y,r)
   #tubo(dx(x),dy(y),0.1,0,-0.25,2)
   pipe(dx(x),dy(y),0.1,0,-0.15)
   danger_drill(dx(x),dy(y),-@depth)
   retract
 end
 def a_pot(x,y,r)
  alpspot(dx(x),dy(y),r-180)
 end
 def a_trimpot(x,y,r)
  tubo(dx(x),dy(y),0.27,0,-0.38,3)
  pipe(dx(x),dy(y),0.06,-0.38,-@depth)
  #tubo(dx(x),dy(y),0.27,0,-0.44,4)
 end
 def a_trimpot_dud(x,y,r)
  tubo(dx(x+0.15),dy(y),0.127,0,-0.125,1)

 end
 def a_mike(x,y,r)

  a_punkt(x-0.48,y-0.380,0)
  pipe(dx(x), dy(y),0.480,0,-@depth)
  a_punkt(x+0.48,y+0.380,0)

 end
 def a_piezo(x,y,r)
  pipe(dx(x), dy(y),0.375/2.0,0,-@depth)
 end


   def led(x,y,r)
   tubo(dx(x),dy(y),mm(3.5),0,-0.05,1)
   spyrtub(dx(x),dy(y),mm(2.5),0)
  end
   def led10(x,y,r)
   pipe(dx(x),dy(y),mm(6),0,-0.25)
   pipe(dx(x),dy(y),mm(5),0,-@depth)
  end




  def SMT0805LED(x,y,r)
    a_punkt(x,y,r)
   #tubo(dx(x),dy(y),mm(4),0,-0.05,1)
   #tubo(dx(x),dy(y),mm(3),0.05,-0.35,3)
   #drillus(dx(x),dy(y),-0.35,-@depth)
  end

    def SMT1616(x,y,r)
   SMT0805LED(x,y,r)
  end
def a_multibutton(x,y,r)
  microshallot(dx(x),dy(y),1)
 end
  def KYCON5P(x,y,r)
  shallot(dx(x),dy(y),1)
 end
 def KYCON3P(x,y,r)
  shallot(dx(x),dy(y),-1)
 end
 def KOBICONDC(x,y,r)
  shallot(dx(x),dy(y),-1)
 end
 def KEMETR82_50 (x,y,r)
  rotabo(dx(x),dy(y),0.5,0.2,0.125,1,r+90)
 end
  def KEMETR82_25 (x,y,r)
  rotabo(dx(x),dy(y),0.5,0.2,0.125,1,r+90)
 end
   def esp30(x,y,r)
  #box(dx(x-0.8),dy(y+2),dx(x+0.8),dy(y),0,-0.1/0.8,1)  
    box(dx(x-0.6),dy(y+2),dx(x-0.4),dy(y),0,-0.1/0.8,1)  
      box(dx(x+0.4),dy(y+2),dx(x+0.6),dy(y),0,-0.1/0.8,1)  
 end
 #def proc() end
 def initialize(starx, stary)
  super(starx, stary)
 end
  def mm(i) return i/25.4 end
 def dy(y)
  return @stary-y
 end
 def dx(x)
  return @curxo+x
 end
 def dr(r) return r end

 def boxo()
  @curxo += MARJ
  @curxo += $bitwidth
  proc()
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.4)
  
  @myCurxuda = Curxuda.new(@curxo,@stary,@depth,@carr)

  @curxo += @width /2
  @curxo += MARJ
#@curxo += $bitwidth
  return @curxo
 end
 def ducatop
 end
 def ducabot
  #@myOkuda.bokchoy(-@depth,1.0,12,10)
  @myCurxuda.bok()
 end
 def duxo
  #@curxo += $bitwidth
  
  return @curxo
 end
end

class Digital_cafe < CafeTop
def initialize(starx, stary)
  @width = 6
  @heigh = 2.5
  @@lipp = 0.0
  @carr = Curxuda.genarr(@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.4,[],[])
  super(starx, stary)
 end
end

class Quantum_experiment < CafeTop
def initialize(starx, stary)
  @width = 6
  @heigh = 5
  @@lipp = 0.0
  @carr = Curxuda.genarr(@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.4,[],[])
  super(starx, stary)
 end
end

class Tier_horn < CafeTop
def initialize(starx, stary)
  @width = 6
  @heigh = 2.5
  @@lipp = 0.0
  @carr = Curxuda.genarr(@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.4,[],[])
  super(starx, stary)
 end
end


class Mike_pre < CafeTop
def initialize(starx, stary)
  @width = 6
  @heigh = 1.2
  @@lipp = 0.0
  @carr = Curxuda.genarr(@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.4,[],[])
  super(starx, stary)
 end
end

require './cafe_procs.rb'
#require './quan_procs.rb'

$rimmer = 0.01
$rimmer=0.01
nudderat()
