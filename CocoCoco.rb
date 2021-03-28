
require './PlumPott.rb'
require './Okuda.rb'
require './cocoENGRAVE/co.rb'
  $plumarray.each{|rr| 
   rr.each{|rrr| rrr[0] /= 1000.0
    rrr[1] /= 1000.0
   }
   } 
 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2

class Coco < PlumPott
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
 @@engravedeep = -0.05
  @width = 6
  @heigh = 2.5
  @depth = 0.55
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
  widochub = @width/2
  $plumarray.each{|rr| 
   organoPHORM(rr,dx(0),dy(0),1)}
  looscrew(dx(250), dy(-1000))
  looscrew(dx(250), dy(1000) )
  
  johnsoninv(dx(600), dy(-1000), dr(0))
  JOHNSON(dx(600), dy(-500), dr(0))
  JOHNSON(dx(600), dy(0) ,dr(0))
  johnsoninv(dx(600), dy(500), dr(0))
  JOHNSON(dx(600), dy(1000), dr(0))

  alpspot(dx(1150), dy(850), dr(0))
  swdpdt(dx(1150), dy(250), dr(0))
  swdpdt(dx(1150), dy(-250), dr(0))
  alpspot(dx(1150), dy(-850), dr(0))

  alpspot(dx(2150), dy(650), dr(0))
  JOHNSON(dx(2150), dy(0), dr(0))
  alpspot(dx(2150), dy(-650), dr(0))

 $obelisk = [
  [-300, 3500], [0, 3600], [300, 3500],
  [250,4800],[0,5000],[-250,4800],
  [-300, 3500]] 
   $obelisk.each{|rrr| rrr[0] /= 1000.0
    rrr[1] /= 1000.0 }
   organoPHORM($obelisk,dx(0),dy(0),1)
  JOHNSON(dx(3900), dy(0), dr(0))

  JOHNSON(dx(5400), dy(-550), dr(0))
  JOHNSON(dx(5400), dy(0), dr(0))
  JOHNSON(dx(5400), dy(550), dr(0))

  looscrew(dx(5750), dy(-1000) )
  looscrew(dx(5750), dy(1000) )
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.25)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoy(-@depth,1.0,12,10)
 end
 def duxo
  #@curxo += $bitwidth
  @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01
stutterat(Coco)