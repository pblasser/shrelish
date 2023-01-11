
#require './PlumPott.rb'
require './Jacksloon.rb'
require './Okuda.rb'
class Plate < Jacksloon

 $bitwidth = 0.4/25.4
 $halfwidth = $bitwidth/2
 #because plumpott is 2mm
 MARJ = 0.0 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 12 #6.0
  @heigh = 9.4
  @depth = 20.0/25.4
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end


 
 def boxo()
  obox(@width/2-0.5,@heigh/2-0.5,0.5,0,-0.5,4)
  @myOkuda = Okuda.new(0,0,@width+$bitwidth,@heigh+$bitwidth,1.0)
 end
 
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoy(-@depth,1.0,16,16)
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