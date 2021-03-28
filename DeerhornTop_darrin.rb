
require './PlumPott.rb'
require './Okuda.rb'

 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2

class Deerorg < PlumPott
 MARJ = 0.05 #0.25
 @@numero = 1
 def initialize(starx, stary)
  @width = 6
  
  @heigh = $aoxo_switch 
  @depth = 0.55
  @@lipp = 0 #0.1 #was lipp zero
  @zstep = 4
  @dzary = 0
  super(starx, stary)
 end
 def dy(y)
  return @stary+y
 end
 def dx(x)
  return @curxo+x
 end
 def a_screw(x,y)
 looscrew(x,y)
 end
 
  def a_ground(x,y)
 drillus(x,y,0,-@depth)
 end
 def a_johnson(x,y)
 johnson(x,y)
 end
 def a_psalpot(x,y)
  alpspot(x,y,180+163)
 end
 def a_trimcap(x,y)
  pipe(x,y,0.06,0,-@depth)
  tubo(x,y,0.25,0,-0.4,4)
 end
 def SMTLED(x,y)
 pipe(x,y,3.3/32,0,-@depth)
end
def a_dwitch(x,y)
 swdpdt(x,y,17)
 end
 
 
 def syck
 shallot(dx(0),dy(-0.85),1)
a_ground(dx(0.250000),dy(0.5))
a_ground(dx(0.250000),dy(1.6))
a_johnson(dx(2.051302),dy(1.099719))
a_johnson(dx(2.487601),dy(0.826511))
a_johnson(dx(2.513769),dy(1.325826))
a_johnson(dx(3.013084),dy(1.299657))
a_johnson(dx(2.986916),dy(0.800343))
a_johnson(dx(3.486231),dy(0.774174))
a_johnson(dx(3.512399),dy(1.273489))
a_johnson(dx(3.948698),dy(1.000281))
a_johnson(dx(4.843959),dy(-0.60672))
a_screw(dx(5.750000),dy(-0.1))
a_trimcap(dx(5.234161),dy(-1.552574))
SMTLED(dx(4.805000),dy(-1.141339))
SMTLED(dx(4.294348),dy(-1.0437))
a_psalpot(dx(3.636594),dy(-0.228966))
a_johnson(dx(2.602639),dy(-0.326346))
a_johnson(dx(4.155098),dy(-1.609634))
a_johnson(dx(4.724935),dy(-1.600323))
a_screw(dx(5.750000),dy(-1.6))
a_johnson(dx(3.520989),dy(-1.569195))
a_johnson(dx(2.868626),dy(-1.50213))
a_psalpot(dx(2.168780),dy(-1.431412))
a_psalpot(dx(1.243476),dy(-1.002385))
#a_trimcap(dx(0.728313),dy(-1.650393))
a_screw(dx(0.250000),dy(-0.1))
a_screw(dx(0.250000),dy(-1.6))
a_dwitch(dx(1.552820),dy(-1.520042))
a_psalpot(dx(1.942459),dy(-0.541086))
a_johnson(dx(4.321917),dy(-0.400778))
a_ground(dx(5.750000),dy(0.5))
a_screw(dx(5.750000),dy(1.6))
shallot(dx(6),dy(-0.85),-1)
end
def seck
shallot(dx(0),dy(0),1)
a_ground(dx(0.250000),dy(-0.75))
#a_trimcap(dx(0.728313),dy(-0.800393))
a_psalpot(dx(1.243476),dy(-0.152385))
a_dwitch(dx(1.552820),dy(-0.670042))
a_ground(dx(0.250000),dy(0.75))
a_psalpot(dx(1.942459),dy(0.308914))
a_psalpot(dx(2.168780),dy(-0.581412))
a_johnson(dx(2.868626),dy(-0.65213))
a_psalpot(dx(3.636594),dy(0.621034))
a_johnson(dx(4.843959),dy(0.24328))
a_ground(dx(5.750000),dy(0.75))
a_johnson(dx(4.155098),dy(-0.759634))
a_johnson(dx(4.321917),dy(0.449222))
a_johnson(dx(2.602639),dy(0.523654))
a_johnson(dx(3.520989),dy(-0.719195))
SMTLED(dx(4.294348),dy(-0.1937))
SMTLED(dx(4.805000),dy(-0.291339))
a_trimcap(dx(5.234161),dy(-0.702574))
a_johnson(dx(4.724935),dy(-0.750323))
a_ground(dx(5.750000),dy(-0.75))
shallot(dx(6),dy(0),-1)
end
def surck
shallot(dx(0),dy(0.85),1)
a_screw(dx(0.250000),dy(-1.6))
a_johnson(dx(2.051302),dy(-1.000281))
a_johnson(dx(2.487601),dy(-1.273489))
a_johnson(dx(2.513769),dy(-0.774174))
a_johnson(dx(3.013084),dy(-0.800343))
a_johnson(dx(2.986916),dy(-1.299657))
a_johnson(dx(3.486231),dy(-1.325826))
a_johnson(dx(3.512399),dy(-0.826511))
a_johnson(dx(3.948698),dy(-1.099719))
a_trimcap(dx(5.234161),dy(0.147426))
a_johnson(dx(4.843959),dy(1.09328))
SMTLED(dx(4.805000),dy(0.558661))
SMTLED(dx(4.294348),dy(0.6563))
a_psalpot(dx(3.636594),dy(1.471034))
a_johnson(dx(4.321917),dy(1.299222))
a_johnson(dx(4.724935),dy(0.099677))
a_johnson(dx(4.155098),dy(0.090366))
a_johnson(dx(3.520989),dy(0.130805))
a_johnson(dx(2.602639),dy(1.373654))
a_psalpot(dx(1.243476),dy(0.697615))
#a_trimcap(dx(0.728313),dy(0.049607))
a_psalpot(dx(1.942459),dy(1.158914))
a_johnson(dx(2.868626),dy(0.19787))
a_psalpot(dx(2.168780),dy(0.268588))
a_dwitch(dx(1.552820),dy(0.179958))
a_screw(dx(0.250000),dy(0.1))
a_ground(dx(0.250000),dy(-0.5))
a_screw(dx(0.250000),dy(1.6))
a_screw(dx(5.750000),dy(0.1))
a_ground(dx(5.750000),dy(-0.5))
a_ground(dx(5.750000),dy(-1.6))
a_screw(dx(5.750000),dy(1.6))
shallot(dx(6),dy(0.85),-1)
end



 
 def boxo()
  @curxo += MARJ

  if (@heigh==2) then
   #organoPHORM($seck_horn,dx(0),dy(0),1)
   seck
   
  elsif (@@numero == 0) then
   #organoPHORM($syck_horn,dx(0),dy(0),1)
   syck
  else 
   #organoPHORM($surck_horn,dx(0),dy(0),1)
   surck 
  end
  @@numero += 1
  @@numero %= 2
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.05)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end

 
 
 
 def numerize
  unless ARGV[2].nil? then @@numero = Integer(ARGV[2]) end
  unless ARGV[3].nil? then @@numero = Integer(ARGV[3]) end
 end
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoy(-@depth,1.0,12,10)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01

if ARGV[2].nil?  then 
 $aoxo_switch = 2
 
else 
 $aoxo_switch = 3.7
 
end
unless ARGV[3].nil?  then 
 nummerat(Deerorg, Integer(ARGV[3]))
 else
 stutterat(Deerorg) 
end#stutterat(Deerorg)