
require './PlumPott.rb'
require './Okuda.rb'
 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2
MARJ=0.05
class CafeTop < PlumPott
 @@numero = 0
 def a_screw(x,y,r)
 looscrew(dx(x),dy(y))
 end
  def a_bolt(x,y,r)
 looscrew(dx(x),dy(y))
 end
 def ADAMUSB(x,y,r)
 fox(dx(x-0.22),dy(y+0.25),dx(x+0.22),dy(y-0.25),0,-@depth,4)
 end
  def an_omron(x,y,r)

 rotabox(dx(x),dy(y),0.52,0.52,r)
 end
 def JOHNSON(x,y,r)
 johnson(dx(x),dy(y))
 end
  def a_punkt(x,y,r)
   tubo(dx(x),dy(y),0.1,0,-0.35,2)
   drillus(dx(x),dy(y),-0.35,-@depth)
 end
 def a_pot(x,y,r)
  alpspot(dx(x),dy(y),r-180)
 end
 def a_trimpot(x,y,r)
  pipe(dx(x),dy(y),0.06,0,-@depth)
  tubo(dx(x),dy(y),0.27,0,-0.44,4)
 end
  def a_led(x,y,r)
   tubo(dx(x),dy(y),mm(4),0,-0.05,1)
   tubo(dx(x),dy(y),mm(2.7),0.05,-0.35,3)
   drillus(dx(x),dy(y),-0.35,-@depth)
  end
    def a_ledrgb(x,y,r)
   a_led(x,y,r)
  end
def a_sidebutton(x,y,r)
  microshallot(dx(x),dy(y),1)
 end
  def KYCON5P(x,y,r)
  shallot(dx(x),dy(y),1)
 end
 def KYCON3P(x,y,r)
  shallot(dx(x),dy(y),-1)
 end
 def KOBICONDC(x,y,r)
  shallot(dx(x),dy(y),-1)
 end

 def proc() end
 def initialize(starx, stary)
  super(starx, stary)
 end
  def mm(i) return i/25.4 end
 def dy(y)
  return @stary-y
 end
 def dx(x)
  return @curxo+x
 end
 def dr(r) return r end

 def boxo()
  @curxo += MARJ
  @curxo += $bitwidth
  proc()
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.4)
  @curxo += @width /2
  @curxo += MARJ
#@curxo += $bitwidth
  return @curxo
 end
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoy(-@depth,1.0,12,10)
 end
 def duxo
  #@curxo += $bitwidth
  
  return @curxo
 end
end

class CafeCafe < CafeTop
def initialize(starx, stary)
  @width = 6
  @heigh = 2.5
  @@lipp = 0.0
  super(starx, stary)
 end
def proc
a_sidebutton(0.000000,0.000000,0)
a_trimpot(0.600000,0.000000,0)
JOHNSON(1.000000,0.000000,0)
a_punkt(1.250000,0.350000,0)
a_punkt(1.300000,0.500000,0)
a_punkt(1.250000,0.650000,0)
JOHNSON(1.000000,0.500000,0)
JOHNSON(1.000000,1.000000,0)
a_pot(1.550000,0.850000,180)
a_punkt(2.000000,0.850000,0)
a_pot(2.500000,0.650000,180)
JOHNSON(2.700000,0.000000,0)
a_punkt(2.950000,-0.550000,0)
a_punkt(3.000000,-0.650000,0)
a_punkt(2.950000,-0.750000,0)
a_pot(2.500000,-0.650000,180)
a_punkt(2.000000,-0.750000,0)
a_punkt(2.000000,-0.950000,0)
a_pot(1.550000,-0.850000,180)
a_punkt(1.250000,-0.650000,0)
a_punkt(1.300000,-0.500000,0)
a_punkt(1.250000,-0.350000,0)
JOHNSON(1.000000,-0.500000,0)
JOHNSON(1.000000,-1.000000,0)
a_bolt(0.400000,-0.850000,0)
JOHNSON(1.550000,-0.250000,0)
JOHNSON(1.550000,0.250000,13)
a_screw(0.400000,0.850000,180)
JOHNSON(3.309516,0.628388,0)
ADAMUSB(3.797701,0.639135,0)
a_led(3.899983,0.130854,77)
JOHNSON(3.558331,0.052915,0)
JOHNSON(3.804241,-0.473863,54)
a_led(4.412113,-0.401413,-167)
a_led(4.621398,-0.420246,-167)
a_punkt(4.700000,-0.100000,0)
a_punkt(4.700000,0.100000,0)
JOHNSON(5.000000,0.000000,-114)
a_trimpot(5.400000,0.000000,180)
JOHNSON(5.000000,-0.550000,-117)
a_pot(4.499524,-0.850553,167)
a_screw(5.600000,-0.850000,180)
JOHNSON(5.000000,0.550000,52)
a_punkt(4.700000,0.550000,0)
a_bolt(5.600000,0.850000,180)
end
end

class CafeQuantum< CafeTop
def initialize(starx, stary)
  @width = 6
  @heigh = 5
  @@lipp = 0.0
  super(starx, stary)
 end
def proc
KYCON5P(0.000000,-0.500000,180)
KYCON5P(0.000000,0.500000,180)
a_punkt(0.933617,0.406452,-26)
a_punkt(0.970183,0.617831,-26)
an_omron(1.106350,1.017908,19)
a_punkt(1.635480,1.285376,-26)
a_punkt(1.754825,1.141676,-26)
JOHNSON(1.945404,0.870920,-8)
a_punkt(2.117091,0.600722,-26)
a_punkt(2.233430,0.417591,-26)
JOHNSON(2.378502,0.126759,-176)
a_punkt(2.080089,0.020311,-26)
a_punkt(1.891176,-0.034760,-26)
a_punkt(1.679061,-0.093077,-26)
a_punkt(1.477031,-0.142195,-26)
a_punkt(1.279158,-0.184342,-26)
JOHNSON(0.973377,-0.267259,-14)
a_led(0.894467,0.155138,0)
a_punkt(1.286777,-0.805427,-98)
a_punkt(1.286777,-0.805427,-98)
a_punkt(1.460322,-0.736329,-98)
a_punkt(1.460322,-0.736329,-98)
JOHNSON(1.776720,-0.638745,-80)
a_punkt(2.086747,-0.558957,-98)
a_punkt(2.086747,-0.558957,-98)
a_punkt(2.296866,-0.504903,-98)
a_punkt(2.296866,-0.504903,-98)
JOHNSON(2.618293,-0.456804,112)
a_punkt(2.627317,-0.773505,-98)
a_punkt(2.627317,-0.773505,-98)
a_punkt(2.621315,-0.970190,-98)
a_punkt(2.621315,-0.970190,-98)
a_punkt(2.611231,-1.189944,-98)
a_punkt(2.611231,-1.189944,-98)
a_punkt(2.595514,-1.397265,-98)
a_punkt(2.595514,-1.397265,-98)
a_punkt(2.574452,-1.598478,-98)
a_punkt(2.574452,-1.598478,-98)
JOHNSON(2.558819,-1.914915,-86)
a_led(2.132712,-1.859435,-72)
a_punkt(1.905796,-1.744541,-98)
a_punkt(1.905796,-1.744541,-98)
a_punkt(1.716062,-1.644444,-98)
a_punkt(1.716062,-1.644444,-98)
an_omron(1.377644,-1.391312,-53)
JOHNSON(0.942383,-0.918909,16)
JOHNSON(0.400000,-1.500000,0)
a_screw(0.400000,-2.100000,180)
a_pot(0.900000,-2.000000,180)
JOHNSON(3.168997,-2.145763,-56)
a_punkt(3.167493,-1.783157,-170)
a_punkt(3.167493,-1.783157,-170)
a_punkt(3.155406,-1.596753,-170)
a_punkt(3.155406,-1.596753,-170)
JOHNSON(3.160370,-1.265686,-152)
a_punkt(3.180291,-0.946177,-170)
a_punkt(3.180291,-0.946177,-170)
a_punkt(3.193813,-0.729638,-170)
a_punkt(3.193813,-0.729638,-170)
JOHNSON(3.247394,-0.409079,40)
a_punkt(3.551383,-0.498363,-170)
a_punkt(3.551383,-0.498363,-170)
a_punkt(3.736587,-0.564850,-170)
a_punkt(3.736587,-0.564850,-170)
a_punkt(3.942470,-0.642349,-170)
a_punkt(3.942470,-0.642349,-170)
a_punkt(4.134787,-0.721362,-170)
a_punkt(4.134787,-0.721362,-170)
a_punkt(4.319643,-0.803571,-170)
a_punkt(4.319643,-0.803571,-170)
JOHNSON(4.615762,-0.916224,-158)
a_led(4.431323,-1.304331,-144)
a_punkt(4.251931,-1.484637,-170)
a_punkt(4.251931,-1.484637,-170)
a_punkt(4.098103,-1.634154,-170)
a_punkt(4.098103,-1.634154,-170)
an_omron(3.752782,-1.877786,-125)
JOHNSON(4.184198,-0.143492,136)
a_punkt(3.886482,-0.025812,118)
a_punkt(3.684720,0.053962,118)
JOHNSON(3.396408,0.203979,-32)
a_punkt(3.575260,0.465500,118)
a_punkt(3.695724,0.621093,118)
a_punkt(3.833051,0.792951,118)
a_punkt(3.967626,0.951439,118)
a_punkt(4.102935,1.101843,118)
JOHNSON(4.301580,1.348658,130)
a_led(4.613698,1.053314,144)
a_punkt(4.729744,0.826984,118)
a_punkt(4.824407,0.634482,118)
an_omron(4.949405,0.230776,163)
a_punkt(4.678543,-0.296624,118)
a_punkt(4.497527,-0.250519,118)
JOHNSON(5.023867,-0.407246,-128)
KOBICONDC(6.000000,-0.500000,-90)
KYCON3P(6.000000,-1.500000,0)
a_screw(5.600000,-2.100000,180)
KYCON3P(6.000000,1.500000,0)
a_screw(5.600000,2.100000,180)
JOHNSON(3.943625,1.894071,160)
a_punkt(3.731707,1.599833,46)
a_punkt(3.631920,1.441924,46)
JOHNSON(3.433308,1.177004,64)
a_punkt(3.229389,0.930224,46)
a_punkt(3.091171,0.762988,46)
JOHNSON(2.859403,0.535145,-104)
a_punkt(2.665950,0.786057,46)
a_punkt(2.555198,0.948707,46)
a_punkt(2.434187,1.132420,46)
a_punkt(2.325043,1.309383,46)
a_punkt(2.223813,1.484548,46)
JOHNSON(2.050462,1.749740,58)
a_led(2.427801,1.955315,72)
a_punkt(2.678913,1.995742,46)
a_punkt(2.891246,2.026285,46)
an_omron(3.313820,2.020413,91)
JOHNSON(1.421129,1.577846,88)
a_pot(0.900000,2.000000,180)
a_screw(0.400000,2.100000,180)
JOHNSON(0.400000,1.500000,0)
end
end

class CafeTier< CafeTop
def initialize(starx, stary)
  @width = 6
  @heigh = 2.5
  @@lipp = 0.0
  super(starx, stary)
 end
def proc
a_sidebutton(0.000000,0.000000,0)
a_trimpot(0.600000,0.000000,0)
JOHNSON(1.220878,-0.225622,-176)
a_pot(1.373523,-0.736567,167)
a_punkt(1.936430,-0.432064,-65)
a_punkt(1.996769,-0.184356,-65)
a_punkt(2.057109,0.063353,-65)
a_punkt(2.117448,0.311061,-65)
a_punkt(2.177787,0.558769,-65)
a_pot(2.685138,0.750347,167)
JOHNSON(2.721670,0.209273,84)
JOHNSON(2.362235,-0.223101,-7)
a_pot(2.407048,-0.754182,167)
JOHNSON(3.391246,-0.077750,-3)
JOHNSON(3.792924,0.145034,-3)
a_led(3.842315,0.479507,-84)
JOHNSON(4.222106,0.371276,-18)
JOHNSON(4.195265,-0.103458,-29)
JOHNSON(3.779409,-0.329860,-3)
a_led(3.803946,-0.667216,172)
JOHNSON(4.160100,-0.600137,-3)
JOHNSON(4.748989,-0.825289,134)
a_screw(5.600000,-0.850000,180)
a_trimpot(5.400000,0.000000,180)
a_bolt(5.604135,0.835117,0)
JOHNSON(1.678126,0.201195,-7)
a_pot(1.626152,0.742737,167)
a_screw(0.400000,0.850000,180)
a_bolt(0.400000,-0.850000,180)
end
end

$rimmer = 0.01
$rimmer=0.01
def dudderat()
 clasz = Object.const_get(String(ARGV[0]))
 xarg = yarg = 1
 unless ARGV[1].nil? then yarg = Integer(ARGV[1]) end
 unless ARGV[2].nil? then xarg = Integer(ARGV[2]) end
 broth = clasz.new(0,0).getBrot + $rimmer
 curyop = (yarg-1)*broth
 curxo = 0
 #cursorx = $halfwidth
 mystuff = clasz.new(curxo,0)
 for i in 1..xarg do
  if i == 1 then mystuff.numerize end
  curyo = curyop
  for j in 1..yarg do
   mystuff = clasz.new(curxo,curyo)
   mystuff.boxo()
   mystuff.ducabot()
   curyo -= broth*2
  end
  curxo = mystuff.duxo() + $rimmer
 end
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"
 return curxo
end
dudderat()
