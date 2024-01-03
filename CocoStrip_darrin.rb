
require './PlumPott.rb'
require './Okuda.rb'

class Coco < PlumPott
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 6
  @heigh = 1.2

  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end
 def dy(y)
  return @stary+(y/1000.0)
 end
 def dx(x)
  return @curxo+(x/1000.0)
 end
 def dr(r) return r end
 def JOHNSON(x,y,r) 
  johnson(x,y)
 end
 def boxo()
  @curxo += MARJ
  shallot(dx(0),dy(0),1)
  widochub = @width/2
  looscrew(dx(250), dy(-400))
  looscrew(dx(250), dy(400) )
  alpspot(dx(1000), dy(0), dr(0))
  JOHNSON(dx(2000), dy(-250), dr(0))
  JOHNSON(dx(2000), dy(250), dr(0))
  drillus(dx(2520),dy(380),0,-@depth)
  drillus(dx(3000), dy(0),0,-@depth)
  pipe(dx(3000), dy(0),0.480,0,-@depth)
  drillus(dx(3480),dy(-380),0,-@depth)
  alpspot(dx(4000), dy(0), dr(0))
  JOHNSON(dx(5000), dy(-250) ,dr(0))
  JOHNSON(dx(5000), dy(250) ,dr(0))

  looscrew(dx(5750), dy(0) )
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.25)
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
  #@curxo += $bitwidth
  @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01
stutterat(Coco)