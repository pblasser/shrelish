
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
  alpspot(x,y,17)
 end
 def a_trimcap(x,y)
  #pipe(x,y,0.06,0,-@depth)
  tubo(x,y,0.33,0,-0.4,4)
 end
 def SMTLED(x,y)
 pipe(x,y,3.3/32,0,-@depth)
end
def a_dwitch(x,y)
 swdpdt(x,y,17)
 end
 
 def syck
 shallot(dx(0),dy(-0.85),1)
a_trimcap(dx(5.234161),dy(-1.552574))
shallot(dx(6),dy(-0.85),-1)
end
def seck
shallot(dx(0),dy(0),1)
a_trimcap(dx(5.234161),dy(-0.702574))
shallot(dx(6),dy(0),-1)
end
def surck
shallot(dx(0),dy(0.85),1)
a_trimcap(dx(5.234161),dy(0.147426))
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
 lastx=nummerat(Deerorg, Integer(ARGV[3]))
 else
 lastx=stutterat(Deerorg) 
end

Deerorg.new(0,0).drillus(0,0,0,-0.55)
Deerorg.new(0,0).drillus(lastx,0,0,-0.55)
printf "G0 Z0.5\n"
printf "G0 X0 Y0\n"

#stutterat(Deerorg)