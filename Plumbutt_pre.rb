
require './PlumPott.rb'
require './Okuda.rb'
require './plumbENGRAVE/plumAVDOG.rb'
require './plumbENGRAVE/plumULTRA.rb'
require './plumbENGRAVE/plumGONGUE.rb'


 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2

class Plumbutt < PlumPott
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 6
  @heigh = 6.95 ###1.95 ####wasz 2!!!
  @depth = 0.55
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end
 def dy(y)
  return @stary-(y/1000.0)
 end
 def dx(x)
  return @curxo+(x/1000.0)
 end
 def boxo()
  @curxo += MARJ
  shallot(dx(0),dy(2000),1)
  shallot(dx(0),dy(-2000),1)
  @curxo += @width 
  shallot(dx(0),dy(-1500),-1)
  shallot(dx(0),dy(1500),-1)
  @curxo += MARJ
  return @curxo
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
stutterat(Plumbutt)
Plumbutt.new(0,0).drillus(0,0,0,-0.55)
printf "G0 Z0.5\n"
printf "G0 X0 Y0\n"