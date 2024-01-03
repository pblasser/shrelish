
require './Jacksloon.rb'
require './Okuda.rb'
 $bitwidth = 0.125
 $halfwidth = $bitwidth/2
 
class RolzTop < Jacksloon
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 6
  @heigh = 1.5 ###1.95 ####wasz 2!!!

  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end
 def dy(y)
  return @stary+y
 end
 def dx(x)
  return @curxo+x
 end
 def screw(x,y) drillus(x,y,0,0-@depth) end
 def ledhole(x,y) 
 pipe(x,y,3.3/32,0,-@depth)
 #spyrtub(x,y,3.3/32,3.3/32)
 end
  def cronktor(x,y)
  for i in 0..5 do
   box(x-0.6+Float(i)/10,
       y-0.333,x,y+0.333,
	   -Float(i)/15,-Float(i+1)/15,1)
  end
  end
 
 def boxo()
  @curxo += MARJ
 screw(dx(0.250000),dy(-0))
johnson(dx(0.650000),dy(-0.225))
johnson(dx(0.650000),dy(0.225))
johnson(dx(1.000000),dy(-0.525))
ledhole(dx(1.000000),dy(-0))
johnson(dx(1.000000),dy(0.525))
johnson(dx(1.350000),dy(-0.225))
johnson(dx(1.350000),dy(0.225))
johnson(dx(1.857237),dy(0.276703))
johnson(dx(1.906835),dy(-0.180308))
johnson(dx(2.280741),dy(0.460683))
johnson(dx(2.356300),dy(-0.269009))
johnson(dx(2.598773),dy(0.126245))
johnson(dx(2.966410),dy(-0.266337))
johnson(dx(3.143508),dy(0.188291))
ledhole(dx(3.251207),dy(-0.150856))
johnson(dx(3.384649),dy(-0.489399))
johnson(dx(3.549383),dy(-0.048683))
johnson(dx(3.771348),dy(0.402326))
johnson(dx(4.047296),dy(0.033001))
johnson(dx(4.223721),dy(0.487678))
johnson(dx(4.650000),dy(0.225))
johnson(dx(4.650000),dy(-0.225))
ledhole(dx(5.000000),dy(-0))
johnson(dx(5.000000),dy(-0.525))
johnson(dx(5.000000),dy(0.525))
johnson(dx(5.350000),dy(0.225))
johnson(dx(5.350000),dy(-0.225))
screw(dx(5.750000),dy(0.5))
screw(dx(5.750000),dy(-0.5))

  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.25)
  @curxo += @width /2
  @curxo += MARJ
  
 if @@numero == 0 then
   cronktor(@curxo,@stary)
  end
  
  @@numero += 1
  @@numero %= 7
  
  return @curxo
 end
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoy(-@depth,1.0,12,6)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
  def numerize
  unless ARGV[2].nil? then @@numero = Integer(ARGV[2]) end
 end
end
$rimmer = 0.01



unless ARGV[3].nil? then 
 nummerat(RolzTop,Integer(ARGV[3]))
else stutterat(RolzTop) end

#stutterat(RolzTop)