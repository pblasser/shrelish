
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
  @width = 4.2 #6.0
  unless ARGV[3].nil? then @width = Float(ARGV[3]) end
  @heigh = @width
  @depth = 1.00 #0.75 #0.55
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end
NUMSEGS = 20

 def well(x,y,r,d)
  
 angle = Math.asin($bitwidth*0.7/r)
 #angle += angle/(2*Math::PI)
 i = 0
 signo = 1
 while (i<(Math::PI)) 
  retract()
     liloff = 0.025
   if (i == 0) then liloff += 0.02 end
  yy = Math.sin(i)
  xx = Math.cos(i)
  for j in -NUMSEGS..NUMSEGS do
   rad = r-((j+NUMSEGS)*r/NUMSEGS)
   placz = j/Float(NUMSEGS)
   placz=placz*placz
   placz=placz*placz
   cutoPointDeepo(signo*xx*rad+x,signo*yy*rad+y, (d*placz)-d)
   #(d/2)*Math.cos(2*j*Math::PI / NUMSEGS)-(d/2)+liloff)
  end
  i += angle
  signo *= -1
 end
 retract()
 end

 def boxo()
  @curxo += MARJ
  dronk = 1
  #well(@curxo+dronk,@stary+(@heigh/2)-dronk,Float(dronk),0.2)
  #well(@curxo+dronk,@stary+(@heigh/2)-dronk,Float(dronk),0.35)
  #well(@curxo+dronk,@stary+(@heigh/2)-dronk,Float(dronk),0.5)
   @curxo += @width /2
maxrad = (@width/2) - 0.25 
  well(@curxo,0,@width/2.1,0.2)
  well(@curxo,0,@width/2.1,0.35)
  well(@curxo,0,@width/2.1,0.5)
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,1.0)
  @curxo += @width /2
  @curxo += MARJ
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