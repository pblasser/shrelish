
require './PlumPott.rb'
require './Okuda.rb'
MARJ = 2/25.4

class NorTop < PlumPott
 
 
 @@lipp = MARJ


 def initialize(starx, stary)
  @width = 90
  unless ARGV[2].nil? then @width = Integer(ARGV[2]) end
  @heigh = 90
  unless ARGV[3].nil? then @heigh = Integer(ARGV[3]) end
  @line = :nortube69
  unless ARGV[4].nil? then @line = String(ARGV[4]).to_sym() end    
  @width = mm(@width)
  @heigh = mm(@heigh)
  super(starx, stary)

  fittingprocify()

 end
 def mm(i) return i/25.4 end
 def dx(x)
  return @curxo + mm(x) 
 end
 def dy(y)
  return @stary + mm(-y)
  #return @stary + mm(y)
 end

 def KYCON5P(x,y,r)
  
  shallot(dx(x),dy(y),1)
 end
 def KYCON3P(x,y,r)
  shallot(dx(x),dy(y),-1)
 end

 def parabolzay(x,y,z,xx,yy)
  #feb24 was x12 y12 z10
  y/=12.0
  x/=16.0
  z/=13.0
  cutoPointz(xx+x,yy+y,(y**4)+8*(x**4)-z)
 end
  def sideshallot(x,y,xs)
  skimtoPoint(x,y,0.1)
  signx = signy = 1
  for k in 0..3 do
   for j in 0..12 do
    for i in -13..14 do
     parabolzay(signy*i,xs*j,k,x,y)
    end
    signy*=-1
   end
   signx*=-1
  end
 end

 def KOBICONDC(x,y,r)
  sideshallot(dx(x),dy(y),1)
 end
 def JOHNSON(x,y,r)
  johnson(dx(x),dy(y))
 end
  def TUBE(x,y,r)
    pipe(dx(x),dy(y),mm(11),0,-0.22)
  pipe(dx(x),dy(y),mm(9.5),0,-@depth)
 end
 def LED(x,y,r)
    a_punkt(x,y,r)
 end
 def a_pot(x,y,r) 
  alpspot(dx(x),dy(y),r-180)
 end
 def a_screw(x,y,r)
  looscrew(dx(x),dy(y))
 end
  def a_monopin(x,y,r)
  pipe(dx(x),dy(y),0.1,0,-0.15)
 end
   def a_magnet(x,y,r)
  rotabo(dx(x),dy(y),mm(4.3),mm(15),0.25,2,r) 
  moony= 5*Math.cos(r*Math::PI/180.0)
  moonx=5*Math.sin(r*Math::PI/180.0)
  danger_drill(dx(x+moonx),dy(y+moony),-@depth)
  retract
  danger_drill(dx(x-moonx),dy(y-moony),-@depth)
 end
    def a_mosfet(x,y,r)
  rotabo(dx(x),dy(y),mm(4.3),mm(15),0.25,2,r) 
 end
    def a_camdenboss(x,y,r)
  rotabo(dx(x),dy(y),mm(4.3),mm(15),0.25,2,r+90) 
 end
   def a_punkt(x,y,r)
   #tubo(dx(x),dy(y),0.1,0,-0.25,2)
   pipe(dx(x),dy(y),0.1,0,-0.15)
   danger_drill(dx(x),dy(y),-@depth)
   retract
 end
def proc

end

 def boxo()
  @curxo += MARJ
  @curxo += $halfwidth
  @fittingsprocs[@line].call()
  if @line==:nortube69_old 
    box(dx(10),dy(35),dx(80),dy(-35),0,-0.125,1)
  end
  @curxo += @width/2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+MARJ*2+$bitwidth,mm(8))
  @curxo += @width/2
  
  @curxo += MARJ
  @curxo += $halfwidth
  return @curxo
 end
 def ducabot
  topnuys = []
  botnuys = []
  @myOkuda.bokchoy(-@depth,1.0,16,16)
 end
 def duxo
  #@curxo += $bitwidth
  return @curxo
 end


 def fittingprocify


 @fittingsprocs =
 { 
:nortube69 => Proc.new { 
KYCON5P(0.00,0.00,-180)
a_monopin(16.68,-4.08,-26)
a_monopin(16.31,-10.77,-20)
a_pot(25.00,-20.00,135)
a_monopin(25.34,-32.45,22)
JOHNSON(25.00,-39.00,-12)
JOHNSON(12.00,-39.00,-12)
a_monopin(12.53,-28.35,86)
a_screw(6.00,-27.00,0)
a_magnet(25.00,0.00,-116)
a_monopin(35.74,-0.21,-106)
LED(35.47,-6.98,-40)
a_monopin(45.41,-18.99,22)
a_monopin(53.10,-24.17,147)
a_monopin(50.98,-30.73,-173)
JOHNSON(52.00,-39.00,14)
a_punkt(45.00,-39.00,0)
JOHNSON(38.00,-39.00,168)
a_monopin(58.86,-33.48,-4)
a_monopin(61.55,-23.88,-162)
a_monopin(65.71,-22.94,139)
TUBE(65.00,-20.00,-135)
a_monopin(70.11,-18.72,56)
a_monopin(62.42,-13.92,-117)
a_monopin(68.35,-2.95,14)
a_magnet(65.00,0.00,-116)
a_monopin(67.23,6.68,5)
a_monopin(57.52,5.21,22)
LED(56.68,8.60,90)
a_monopin(56.00,20.85,73)
a_pot(65.00,20.00,-45)
a_camdenboss(71.16,26.71,86)
a_screw(84.00,27.00,0)
JOHNSON(80.00,39.00,-153)
JOHNSON(67.00,39.00,168)
JOHNSON(54.00,39.00,15)
a_punkt(47.00,39.00,0)
KOBICONDC(45.00,45.00,0)
a_monopin(23.54,32.76,-85)
a_monopin(17.39,23.96,128)
a_monopin(11.51,20.25,22)
a_screw(6.00,27.00,0)
a_monopin(11.76,32.73,22)
TUBE(25.00,20.00,45)
a_monopin(26.72,21.76,57)
a_monopin(26.17,14.94,102)
a_monopin(37.58,20.52,-63)
KYCON3P(90.00,0.00,0)
a_screw(84.00,-27.00,0)
a_mosfet(75.00,-30.00,45)
a_monopin(70.00,-41.00,14)
},
:nortube69_old => Proc.new { 
KYCON5P(0.00,0.00,-180)
a_monopin(16.68,-4.08,-26)
a_monopin(16.31,-10.77,-20)
a_pot(25.00,-20.00,135)
a_monopin(25.34,-32.45,22)
JOHNSON(23.00,-39.00,-12)
JOHNSON(10.00,-39.00,-12)
a_monopin(12.53,-28.35,86)
a_screw(6.00,-27.00,0)
a_magnet(25.00,0.00,-116)
a_monopin(35.74,-0.21,-106)
LED(35.47,-6.98,-40)
a_monopin(45.41,-18.99,22)
a_monopin(53.10,-24.17,147)
a_monopin(50.98,-30.73,-173)
JOHNSON(50.00,-39.00,14)
a_punkt(45.00,-39.00,0)
JOHNSON(36.00,-39.00,168)
a_monopin(58.86,-33.48,-4)
a_monopin(61.55,-23.88,-162)
a_monopin(65.71,-22.94,139)
TUBE(65.00,-20.00,-135)
a_monopin(70.11,-18.72,56)
a_monopin(62.42,-13.92,-117)
a_monopin(68.35,-2.95,14)
a_magnet(65.00,0.00,-116)
a_monopin(67.23,6.68,5)
a_monopin(57.52,5.21,22)
LED(56.68,8.60,90)
a_monopin(56.00,20.85,73)
a_pot(65.00,20.00,-45)
a_camdenboss(71.16,26.71,86)
a_screw(84.00,27.00,0)
JOHNSON(80.00,39.00,-153)
JOHNSON(67.00,39.00,168)
JOHNSON(54.00,39.00,15)
a_punkt(47.00,39.00,0)
KOBICONDC(45.00,45.00,0)
a_monopin(23.54,32.76,-85)
a_monopin(17.39,23.96,128)
a_monopin(11.51,20.25,22)
a_screw(6.00,27.00,0)
a_monopin(11.76,32.73,22)
TUBE(25.00,20.00,45)
a_monopin(26.72,21.76,57)
a_monopin(26.17,14.94,102)
a_monopin(37.58,20.52,-63)
KYCON3P(90.00,0.00,0)
a_screw(84.00,-27.00,0)
a_mosfet(75.00,-30.00,45)
a_monopin(70.00,-41.00,14)
},
:norduck => Proc.new { 
KYCON5P(0.00,0.00,-180)
a_punkt(10.00,5.00,0)
a_punkt(20.00,10.00,0)
a_punkt(30.00,15.00,0)
a_punkt(40.00,5.00,0)
a_pot(27.00,0.00,135)
a_punkt(50.00,-5.00,0)
a_pot(45.00,-18.00,135)
a_punkt(60.00,-15.00,0)
a_punkt(70.00,-10.00,0)
a_punkt(80.00,-5.00,0)
KYCON3P(90.00,0.00,0)
a_pot(63.00,0.00,-135)
a_pot(45.00,18.00,-135)
JOHNSON(48.00,39.00,0)
a_punkt(34.00,39.00,0)
JOHNSON(27.00,39.00,19)
JOHNSON(12.00,39.00,45)
a_screw(6.00,27.00,180)
a_pot(18.00,27.00,-135)
JOHNSON(63.00,39.00,39)
a_punkt(70.00,39.00,0)
JOHNSON(81.00,39.00,81)
a_screw(84.00,27.00,180)
a_pot(72.00,27.00,135)
a_pot(72.00,-27.00,-135)
a_screw(84.00,-27.00,0)
JOHNSON(81.00,-39.00,-90)
a_punkt(70.00,-39.00,0)
JOHNSON(63.00,-39.00,-135)
JOHNSON(48.00,-39.00,0)
a_punkt(34.00,-39.00,0)
JOHNSON(27.00,-39.00,-45)
JOHNSON(12.00,-39.00,-45)
a_screw(6.00,-27.00,0)
a_pot(18.00,-27.00,135)
},
:nortube97 => Proc.new { 
KYCON5P(0.00,0.00,180)
a_monopin(16.00,-3.00,39)
a_monopin(17.03,-10.81,-17)
a_monopin(11.83,-13.44,-7)
a_mosfet(25.00,-25.00,135)
a_monopin(29.85,-18.87,109)
a_pot(40.67,-25.00,120)
a_monopin(47.41,-15.74,40)
LED(56.81,-7.74,112)
a_magnet(48.00,0.00,21)
a_monopin(38.93,2.15,-80)
LED(41.92,9.95,163)
a_monopin(46.56,12.46,120)
a_pot(40.51,24.91,-120)
a_monopin(28.31,22.75,111)
JOHNSON(24.00,34.00,-45)
a_punkt(17.18,38.89,0)
a_monopin(19.87,43.83,-47)
a_screw(22.00,49.00,90)
JOHNSON(12.00,34.00,33)
a_punkt(6.60,29.09,0)
JOHNSON(16.03,22.50,27)
a_monopin(16.27,16.16,59)
a_monopin(14.47,9.58,-7)
a_monopin(25.57,6.55,111)
a_monopin(24.46,2.33,-10)
TUBE(26.18,0.09,0)
a_monopin(18.18,-35.51,-100)
a_monopin(15.68,-39.37,-100)
a_monopin(15.00,-43.00,-99)
a_monopin(17.00,-49.00,-99)
a_screw(6.00,-33.00,0)
a_monopin(35.34,-39.59,-9)
JOHNSON(42.07,-43.64,174)
a_monopin(48.07,-34.07,-9)
a_monopin(57.91,-34.20,121)
a_monopin(63.23,-31.52,35)
a_monopin(68.26,-27.61,-130)
TUBE(69.33,-25.00,-120)
a_monopin(58.40,-22.47,-9)
a_monopin(75.72,-15.28,160)
a_monopin(84.01,-12.30,-11)
a_pot(83.82,0.09,0)
LED(75.07,8.87,47)
a_monopin(72.05,18.29,-7)
a_monopin(71.31,25.02,-62)
TUBE(69.49,24.91,120)
a_monopin(80.07,21.02,14)
a_monopin(84.37,21.08,149)
a_punkt(83.81,28.74,0)
a_monopin(80.65,34.52,81)
JOHNSON(88.68,34.38,83)
a_punkt(94.61,38.79,0)
JOHNSON(101.00,33.00,66)
JOHNSON(93.97,22.50,91)
a_screw(88.00,49.00,-90)
KOBICONDC(55.00,55.00,0)
a_monopin(45.92,42.59,-160)
a_monopin(50.88,31.79,-160)
a_monopin(59.70,16.88,40)
a_monopin(62.86,4.15,-170)
a_magnet(66.00,0.00,21)
a_camdenboss(87.75,-29.61,115)
a_screw(104.00,-33.00,0)
JOHNSON(80.00,-48.50,-141)
a_punkt(72.16,-40.43,0)
a_monopin(66.38,-40.94,-39)
JOHNSON(67.93,-46.36,-141)
a_punkt(63.39,-52.25,0)
a_monopin(60.44,-43.59,109)
JOHNSON(55.00,-45.00,-123)
KYCON3P(110.00,0.00,0)
}




}


end






end
stutterat(NorTop)
