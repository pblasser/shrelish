
require './PlumPott.rb'
require './Okuda.rb'
require './plumbENGRAVE/plumDEER.rb'

 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2

class Plumknobs < PlumPott
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 0.75
  @heigh = 0.65
  @depth = 0.55
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end

 def boxo()

  @curxo += @width /2
  alpspot(@curxo,@stary,0)
  @curxo += @width /2

  return @curxo
 end

 def ducatop
 end
 def ducabot
 end
 def duxo
  #@curxo += $bitwidth
  return @curxo
 end
end

stutterat(Plumknobs)