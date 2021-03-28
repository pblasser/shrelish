
require './PlumPott.rb'
require './Okuda.rb'
require './plumbENGRAVE/plumDEER.rb'

 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2

class Deerorg < PlumPott
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 6
  @heigh = 3.7
  @depth = 0.55
  @@lipp = 0.1 #was lipp zero
  @zstep = 4
  @dzary = 0
  super(starx, stary)
 end
 def dy(y)
  return @dzary-(@heigh/2-1)+y
 end
 def dx(x)
  return @curxo+(@width/2)+x
 end
 def boxo()
  @curxo += MARJ
  #widochub = @width/2
  
  if (@@numero == 1) then
   @dzary = @stary - 2
  else @dzary = @stary end
  
  drillus(dx(2.75),dy(2.450),0,-@depth)
  drillus(dx(-2.75),dy(1.25),0,-@depth)
  
  if (@@numero == 1) then
   @dzary = @stary + 1.7
  else @dzary = @stary end
  
  organoPHORM($plumDEER,dx(0),dy(0),1)
  looscrew(dx(-2.75),dy(-0.75))
  looscrew(dx(-2.75),dy(0.75))
  tubo(dx(-2.272),dy(0.8),3.3/32,0,-@depth,@zstep)
  swdpdt(dx(-1.447),dy(0.67),-17)
  alpspot(dx(-1.757),dy(0.152),180+163)
  alpspot(dx(-0.831),dy(0.581),180+163)
  alpspot(dx(-1.058),dy(-0.309),180+163)
  johnson(dx(-0.131),dy(0.652))
  johnson(dx(-0.397),dy(-0.524))
  johnson(dx(0.521),dy(0.719))
  alpspot(dx(0.637),dy(-0.621),180+169)
  johnson(dx(1.155),dy(0.76))
  tubo(dx(1.294),dy(0.194),3.3/32,0,-@depth,@zstep)
  johnson(dx(1.322),dy(-0.449))
  johnson(dx(1.725),dy(0.750))
  tubo(dx(1.805),dy(0.291),3.3/32,0,-@depth,@zstep)
  johnson(dx(1.844),dy(-0.243))
  looscrew(dx(2.75),dy(-0.75))
  looscrew(dx(2.75),dy(0.75))
  tubo(dx(2.234),dy(0.703),3.3/32,0,-@depth,@zstep)

  @@numero += 1
  @@numero %= 2
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.25)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
 def numerize
  unless ARGV[2].nil? then @@numero = Integer(ARGV[2]) end
 end
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoy(-@depth,1.0,12,10)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01

unless ARGV[2].nil? then 
 nummerat(Deerorg,Integer(ARGV[2]))
else stutterat(Deerorg) end

#stutterat(Deerorg)