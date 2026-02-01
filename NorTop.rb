
require './PlumPott.rb'
require './Okuda.rb'
MARJ = 2/25.4

class NorTop < PlumPott
 
 
 @@lipp = MARJ


 def initialize(starx, stary)
  @width = mm(90)
  @heigh = mm(90)

  super(starx, stary)
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
  def TUBE9(x,y,r)
    pipe(dx(x),dy(y),mm(10),0,-0.22)
  pipe(dx(x),dy(y),mm(9),0,-@depth)
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
  rotabo(dx(x),dy(y),mm(1),mm(10),0.25,2,r) 
  danger_drill(dx(x),dy(y),-@depth)
 end
    def a_mosfet(x,y,r)
  rotabo(dx(x),dy(y),mm(1),mm(10),0.25,2,r) 
 end
    def a_camdenboss(x,y,r)
  rotabo(dx(x),dy(y),mm(1),mm(10),0.25,2,r+90) 
 end
   def a_punkt(x,y,r)
   #tubo(dx(x),dy(y),0.1,0,-0.25,2)
   pipe(dx(x),dy(y),0.1,0,-0.15)
   danger_drill(dx(x),dy(y),-@depth)
   retract
 end
def proc
KYCON5P(0.000000,0.000000,-180.0)
a_monopin(17.568900,-3.720310,-26.0)
a_monopin(16.778710,-10.732660,-20.0)
a_monopin(12.046850,-14.785620,22.0)
a_screw(6.000000,-27.000000,0.0)
JOHNSON(10.000000,-39.000000,-12.0)
JOHNSON(23.000000,-39.000000,-12.0)
a_monopin(25.339720,-32.449320,22.0)
a_pot(25.000000,-20.000000,135.0)
a_magnet(25.000000,-2.000000,-116.0)
a_monopin(35.741850,-0.209820,-106.0)
a_monopin(36.571650,15.670690,-63.0)
a_monopin(28.027190,21.018430,83.0)
TUBE9(25.000000,20.000000,45.0)
a_monopin(24.536310,14.672180,128.0)
a_monopin(17.281020,24.858050,141.0)
a_monopin(11.838250,32.085320,22.0)
a_screw(6.000000,27.000000,0.0)
a_monopin(28.429250,30.651460,-85.0)
KOBICONDC(45.000000,45.000000,180.0)
JOHNSON(54.000000,39.000000,15.0)
JOHNSON(67.000000,39.000000,168.0)
a_camdenboss(71.155630,26.705130,86.0)
a_pot(65.000000,20.000000,-45.0)
a_monopin(67.228710,6.676730,5.0)
a_magnet(65.000000,2.000000,-116.0)
a_monopin(68.579460,-1.508900,14.0)
a_monopin(62.247720,-14.558050,-78.0)
TUBE9(65.000000,-20.000000,-135.0)
a_monopin(64.741520,-23.221090,-91.0)
a_monopin(60.829350,-24.050500,-46.0)
a_monopin(70.088320,-20.072800,4.0)
a_mosfet(74.528050,-29.538210,43.0)
a_screw(84.000000,-27.000000,0.0)
KYCON3P(90.000000,0.000000,0.0)
a_screw(84.000000,27.000000,0.0)
JOHNSON(80.000000,39.000000,-153.0)
a_monopin(45.406520,-18.991180,22.0)
a_monopin(52.177140,-31.846900,96.0)
JOHNSON(50.000000,-39.000000,-12.0)
a_monopin(43.402210,-38.817610,9.0)
JOHNSON(36.000000,-39.000000,168.0)
end

 def boxo()
  @curxo += MARJ
  @curxo += $halfwidth

proc()





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
end
stutterat(NorTop)