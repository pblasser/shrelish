
#require './PlumPott.rb'
require './Jacksloon.rb'
require './Okuda.rb'
class Plate < Jacksloon

 $bitwidth = 0.125
 $halfwidth = $bitwidth/2
 #because plumpott is 2mm
 MARJ = 0.0 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 12 #6.0
  @heigh = 9.4
  @depth = 1.00 #0.75 #0.55
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end

 
 def boxo()
  box(0,-0.6,11,0.6,0,-0.875,7)
  end
 
 def ducatop
 end
 def ducabot
 end
 def numerize
  unless ARGV[2].nil? then @@numero = Integer(ARGV[2]) end
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01
stutterat(Plate)