
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
  return @stary+0.55+y
 end
 def dx(x)
  return @curxo+(@width/2)+x
 end
 def boxo()
  if (@@numero > 0) then
   @curxo += 0.5
   for i in 1..@@numero do
    alpspot(@curxo,@stary-@heighchub+((i+0.5)*@heigh/(@@numero)),0)
   end
   @curxo += 0.5
  end
  
  @curxo += MARJ
  widochub = @width/2
  organoPHORM($plumDEER,dx(0),dy(0),1)
  #drillus(dx(-2.75),dy(-1.5),0,-@depth)
 pipe(dx(-2.75),dy(-1.5),0.048,0,-@depth)



  looscrew(dx(-2.75),dy(-0.75))
  looscrew(dx(-2.75),dy(0.75))
  #tubo(dx(-2.272),dy(0.8),3.3/32,0,-@depth,@zstep)

  swdpdt(dx(-1.523),dy(0.609),-17)
  alpspot(dx(-1.821),dy(-0.001),180+163)
  alpspot(dx(-0.812),dy(0.578),180+163)
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
  
  #drillus(dx(2.75),dy(-1.5),0,-@depth)
 pipe(dx(2.75),dy(-1.5),0.048,0,-@depth)


  looscrew(dx(2.75),dy(-0.75))
  
    pipe(dx(2.234),dy(0.703),0.06,0,-@depth)
  #tubo(dx(2.234),dy(0.703),3.3/32,0,-@depth,@zstep)
  looscrew(dx(2.75),dy(0.75))
  
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
stutterat(Plumdeer)