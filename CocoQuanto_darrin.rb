
require './PlumPott.rb'
require './Okuda.rb'
require './cocoENGRAVE/qu.rb'
  $plumarray.each{|rr| 
   rr.each{|rrr| rrr[0] /= 1000.0
    rrr[1] /= 1000.0
   }
   } 
 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2

 
class Qunt < PlumPott
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
 @@engravedeep = -0.05
  @width = 6
  @heigh = 5

  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end
 def dy(y)
  return @stary-(y/1000.0)
 end
 def dx(x)
  return @curxo+(x/1000.0)
 end
 def dr(r) return -r end
 def JOHNSON(x,y,r) 
  johnson(x,y)
 end
  def swdpst(x,y,theta)
  rotabox(x,y,0.37,0.25,theta) 
 end
 def omron(x,y,r) end
 def bomron(x,y)
  spyrtub(dx(x),dy(-y),1.0/14,0)
end
def omronish()
 bomron(3164.5472440945,168.44566929134)
bomron(2948.7704724409,-98.335433070866)
bomron(2847.3531496063,-329.68700787402)
bomron(2683.9897637795,-101.97598425197)
bomron(3496.4992125984,-162.02480314961)
bomron(2874.461023622,364.13700787402)
bomron(2708.3767716535,138.40236220472)
bomron(2959.7448818898,113.4405511811)
#bomron(4500,-2550)
bomron(3110.6102362205,415.22440944882)
bomron(3376.6196850394,327.02480314961)
bomron(3280.1476377953,-9.3354330708662)
bomron(3498.1807086614,118.22047244094)
bomron(3146.7901574803,-174.21535433071)
bomron(3335.4791338583,-342.16023622047)
bomron(3068.4303149606,-427.16141732283)
#bomron(4500,2550)
tubo(dx(3100),dy(0),0.6,0,-0.1,1)
end
 def boxo()


  @curxo += MARJ
  widochub = @width/2
  
  omronish()
  shallot(dx(0),dy(400),1)
  
  shallot(dx(0),dy(-400),1)
  
   #drillus(dx(3100), dy(0),0,-@depth)
   #pipe(dx(3100), dy(0),0.52,0,-@depth)
   out = 1000*(0-MARJ-$bitwidth)
  
  fox(dx(out),dy(-840),dx(520),dy(-1360),0,-@depth,4)

  fox(dx(out),dy(1360),dx(520),dy(840),0,-@depth,4)
  
alpspot(dx(900), dy(-2000), dr(0))
omron(dx(250), dy(1100), dr(0))
omron(dx(250), dy(-1100), dr(0))





swdpst(dx(1473.12086614173), dy(1369.97834645669), dr(170))
JOHNSON(dx(2400.8531496063), dy(448.273228346457), dr(-72))
JOHNSON(dx(2553.12362204724), dy(1474.82480314961), dr(-9))
JOHNSON(dx(2355.6531496063), dy(2239.6311023622), dr(-72))
JOHNSON(dx(1155.88385826772), dy(935.173228346457), dr(-72))
swdpst(dx(1294.33976377953), dy(-1123.90748031496), dr(-118))
JOHNSON(dx(2457.61850393701), dy(-526.403937007874), dr(-144))
JOHNSON(dx(1528.36417322835), dy(-64.3645669291339), dr(-81))
JOHNSON(dx(739.968503937008), dy(-15.8318897637795), dr(-144))
JOHNSON(dx(1609.83228346457), dy(-1559.97992125984), dr(-144))
swdpst(dx(3610.91968503937), dy(-2064.59133858268), dr(-46))
JOHNSON(dx(3402.13307086614), dy(-773.608661417323), dr(144))
JOHNSON(dx(2675.55196850394), dy(-1514.60433070866), dr(-153))
JOHNSON(dx(2385.76732283465), dy(-2249.4157480315), dr(144))
JOHNSON(dx(4123.14173228346), dy(-1899.29409448819), dr(144))
swdpst(dx(3900.1937007874), dy(1970.60039370079), dr(98))
JOHNSON(dx(3929.10984251969), dy(48.2874015748031), dr(72))
JOHNSON(dx(4409.3125984252), dy(-871.712598425197), dr(135))
JOHNSON(dx(5018.61141732284), dy(-1374.38346456693), dr(72))
JOHNSON(dx(5222.50433070866), dy(386.15157480315), dr(72))
swdpst(dx(5221.42598425197), dy(-152.08031496063), dr(26))
JOHNSON(dx(3310.28503937008), dy(803.451968503937), dr(0))
JOHNSON(dx(4333.64763779528), dy(975.856299212599), dr(63))
JOHNSON(dx(5000), dy(1400), dr(0))
JOHNSON(dx(3388.63779527559), dy(2137.94881889764), dr(0))
alpspot(dx(900), dy(2000), dr(0))
looscrew(dx(250), dy(2250))
looscrew(dx(250), dy(-2250))
looscrew(dx(5750), dy(-2250))
looscrew(dx(5750), dy(2250))
JOHNSON(dx(250), dy(1750), dr(-72))
JOHNSON(dx(250), dy(-1750), dr(-72))


  
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.25)
  @curxo += @width /2
  shallot(dx(0),dy(-1000),-1)
  shallot(dx(0),dy(1000),-1)
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
  #@curxo += $bitwidth
  @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01
stutterat(Qunt)