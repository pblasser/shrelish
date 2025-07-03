
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
 fox(dx(x-0.22),dy(y+0.25),dx(x+0.22),dy(y-0.25),0,-@depth,4)
 end
  def an_omron(x,y,r)
 rotabo(dx(x),dy(y),0.5,0.6,0.125,1,r)
  rotabox(dx(x),dy(y),0.55,0.55,r)
 end
 def JOHNSON(x,y,r)
 johnson(dx(x),dy(y))
 end
  def a_punkt(x,y,r)
   tubo(dx(x),dy(y),0.1,0,-0.25,2)
   drillus(dx(x),dy(y),-0.35,-@depth)
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
#  tubo(dx(x),dy(y),0.27,0,-0.12,1)

 end


   def led(x,y,r)
   #tubo(dx(x),dy(y),mm(3.5),0,-0.05,1)
   spyrtub(dx(x),dy(y),mm(2.5),0)
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
  dux(dx(x),dy(y)-0.3,dx(x)+0.5,dy(y)-0.3,0,-0.125,1)
  dux(dx(x),dy(y)+0.3,dx(x)+0.5,dy(y)+0.3,0,-0.125,1)

 # microshallot(dx(x),dy(y),1)
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
  box(dx(x-0.8),dy(y+2),dx(x+0.8),dy(y),0,-0.1/0.8,1)  
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
  @carr = Curxuda.gencafarr(@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.4,[],[])
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
  @carr = Curxuda.gencafarr(@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.4,[],[])
  super(starx, stary)
 end
end

require './cafe_procs.rb'

$rimmer = 0.01
$rimmer=0.01
def dudderat()
 clasz = Object.const_get(String(ARGV[0]))
 xarg = yarg = 1
 unless ARGV[1].nil? then yarg = Integer(ARGV[1]) end
 unless ARGV[2].nil? then xarg = Integer(ARGV[2]) end
 broth = clasz.new(0,0).getBrot + $rimmer
 curyop = (yarg-1)*broth
 curxo = 0
 #cursorx = $halfwidth
 mystuff = clasz.new(curxo,0)
 for i in 1..xarg do
  if i == 1 then mystuff.numerize end
  curyo = curyop
  for j in 1..yarg do
   mystuff = clasz.new(curxo,curyo)
   mystuff.boxo()
   mystuff.ducabot()
   curyo -= broth*2
  end
  curxo = mystuff.duxo() + $rimmer
 end
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"
 return curxo
end
dudderat()
