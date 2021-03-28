
require './PlumPott.rb'
require './Okuda.rb'

 $bitwidth = 1.0/8.0
 $halfwidth = $bitwidth/2

class Mobbar < PlumPott

MARJ = 0.05 #0.25
@@numero = 0

 def initialize(starx, stary)
   
  @width = 5.0
  @heigh = 1.12  #####wasz 1.1
  @depth = 0.55 #phor .5
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end

 def boxo()
  @curxo += MARJ
  drillus(@curxo+0.25,@stary,0,0-@depth)

  box(@curxo+1.75,@stary-@heighchub,@curxo+(5-0.325),@stary+@heighchub,0,-0.05,1)
  drillus(@curxo+4.75,@stary+0.35,0,0-@depth)
  drillus(@curxo+4.75,@stary-0.35,0,0-@depth)
  box(@curxo+0.325,@stary-@heighchub,@curxo+1.75,@stary+@heighchub,0,-0.25,2)

  pizdepth = -0.366 
  tubo(@curxo+1.2,@stary,0.55,-0.2,pizdepth,1)
  cutoPoint(@curxo+1.2,@stary)
  dux(@curxo+1.25,@stary-@heighchub,@curxo+1.25,@stary+@heighchub,-0.2,0.05+pizdepth,1)
  
  dux(@curxo+1.25,@stary,@curxo+4,@stary,0,-0.25,2)
  box(@curxo+3.7,@stary-0.18,@curxo+4.3,@stary+0.18,-0.05,-0.39,3)
  spyrtub(@curxo+4,@stary,0.3/2.54,0.3/2.54)#0.15,0.15)

  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.05)
  @curxo += @width /2
  @curxo += MARJ
  
  return @curxo
 end
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoy(-@depth,1.0,12,4)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
 
end
$rimmer = 0.01
unless ARGV[3].nil? then $rimmer = Float(ARGV[3]) end
#$rimmer = 0.25
 stutterat(Mobbar)