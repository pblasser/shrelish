
require './PlumPott.rb'
require './Okuda.rb'
require './plumbENGRAVE/plumDEER.rb'

 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2

class Plumdeer < PlumPott
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 6
  @heigh = 3.1
  @heigh -= 0.05
  @heigh=3.025
  @depth = 0.55
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end
 def dy(y)
  return @stary-0.55-y
 end
 def dx(x)
  return @curxo+(x/1000.0)
 end
 def boxo()
  @curxo += MARJ
  shallot(dx(50),dy(0),1)
  @curxo += @width /2
tubo(dx(2234),dy(0.703),0.33,0,-0.44,4)

    @curxo += @width /2

  shallot(dx(-50),dy(0),-1)
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
stutterat(Plumdeer)
Plumdeer.new(0,0).drillus(0,0,0,-0.55)
printf "G0 Z0.5\n"
printf "G0 X0 Y0\n"
