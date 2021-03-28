
require './PlumPott.rb'
require './Okuda.rb'
require './plumbENGRAVE/plumAVDOG.rb'
require './plumbENGRAVE/plumULTRA.rb'
require './plumbENGRAVE/plumGONGUE.rb'

$plumQ = [[0.15,0],

[0,-0.15],[-0.075,-0.075],[0,0],[-0.15,-0.15],[-0.075,-0.075],
[-0.15,0],#,[-0.075,0.075],[0,0],[-0.15,0.15],[-0.075,0.075],
#[-0.25,0],[-0.15,0],
[0,0.15],

[0.15,0]]
$plumT = [[0,0],[0,-0.3],[0.15,-0.3],[-0.15,-0.3]]

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
  return @stary+y
 end
 def dx(x)
  return @curxo+(@width/2)+x
 end
 def organoJACKD(arr,x,y,sig)
  organoPHORM(arr,x,y,sig)
  organoPHORM($plumQ,x+(sig*1.52),y,sig)
  johnson(x,y)
  johnson(x+(sig*0.8),y-(sig*1))
  johnson(x-(sig*0.8),y+(sig*1))
  johnson(x-(sig*1),y-(sig*0.8))
  johnson(x-(sig*0.6),y-(sig*1.2))
  johnson(x+(sig*0.6),y+(sig*1.2))
  johnsoninv(x+(sig*1),y+(sig*0.8),90-sig*90)
  alpspot(x,y+(sig*1),90-(90*sig))
  alpspot(x,y-(sig*1),90-(90*sig))
  alpspot(x+(sig*0.8),y,90-(90*sig))
  alpspot(x-(sig*0.8),y+(sig*0.3),90-(90*sig))
  
  organoPHORM($plumT,x-(sig*0.8),y-(sig*0.3),sig)
  swdpdt(x-(sig*0.8),y-(sig*0.3),180*sig)
 end
 def organoULTRD(arr,x,y,sig)
  organoPHORM(arr,x,y,sig)
  
  johnson(x,y)
  alpspot(x+(sig*0.6),y,90-(90*sig))
  johnson(x+(sig*1.2),y)
  alpspot(x-(sig*0.6),y,90-(90*sig))
  johnson(x-(sig*1.1),y-(sig*0.3))
 end
 def boxo()
  @curxo += MARJ
  #@@feedrate = 30
  looscrew(dx(-2.75),dy(-3.25))
  looscrew(dx(-2.75),dy(3.25))
  organoULTRD($plumULTRAarray,dx(1.1),dy(0),1)
  organoULTRD($plumULTRAarray,dx(-1.1),dy(0),-1)
  organoJACKD($plumAVDOGarray,dx(1.3),dy(2),1)
  organoJACKD($plumAVDOGarray,dx(-1.3),dy(-2),-1)
  organoJACKD($plumGONGUEarray,dx(1.3),dy(-2),1)
  organoJACKD($plumGONGUEarray,dx(-1.3),dy(2),-1)
  looscrew(dx(2.75),dy(-3.25))
  looscrew(dx(2.75),dy(3.25))
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.25)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
 def ducatop
 end
 def ducabot
  #@@feedrate = 30
  @myOkuda.bokchoy(-@depth,1.0,12,14)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01
stutterat(Plumbutt)