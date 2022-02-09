
require './Jacksloon.rb'
require './Okuda.rb'

class DeerBot < Jacksloon

#MARJ = 0.25
MARJ = 0.05

 def initialize(starx, stary)
  @width = 10.0
  @heigh = 6.0
  @depth = 0.8 #0.75
  @magic = 0.023 #for the weird clockwise alignment!
  super(starx, stary)
 end

 def dx(x)
  return @curxo + (10-x)
 end
 def dy(y)
  return @stary + y
 end
 def a_screw(x,y)
   screw = -0.16
  drillus(x,y,0,screw)
 end
 def a_ground(x,y)
    tubo(x,y,0.125,0,-0.5,4)
end
def jak_three(x,y)
  kyconster(x,dy(3))
  end
  def jak_fiver(x,y)
  kyconsterupsidedown(x,dy(-3))
  end
  def jak_dc(x,y)
  kobiconn(x,dy(3))
  end
  def jak_switch(x,y)
  alpswitch(x, dy(3))
  end
  def a_trimcap(x,y)
  #tubo(x,y,0.33,0,-0.5,4)
 end
 def doxo

 a_ground(dx(1.550000),dy(-2.750000))
a_ground(dx(0.450000),dy(-2.750000))
a_screw(dx(2.150000),dy(2.750000))
jak_three(dx(2.900000),dy(2.650000))
a_trimcap(dx(3.602574),dy(2.234161))
a_screw(dx(3.650000),dy(2.750000))
a_ground(dx(4.250000),dy(2.750000))
a_trimcap(dx(7.900393),dy(-2.271687))
a_trimcap(dx(5.800393),dy(-2.271687))
a_ground(dx(5.750000),dy(-2.750000))
a_screw(dx(6.350000),dy(-2.750000))
a_ground(dx(1.550000),dy(2.750000))
a_screw(dx(0.450000),dy(2.750000))
a_trimcap(dx(3.700393),dy(-2.271687))
a_screw(dx(2.150000),dy(-2.750000))
jak_fiver(dx(2.900000),dy(-2.650000))
a_screw(dx(3.650000),dy(-2.750000))
a_ground(dx(4.250000),dy(-2.750000))
jak_fiver(dx(5.000000),dy(-2.650000))
a_trimcap(dx(5.702574),dy(2.234161))
jak_switch(dx(5.000000),dy(2.700000))
a_ground(dx(5.750000),dy(2.750000))
a_screw(dx(6.350000),dy(2.750000))
a_trimcap(dx(7.802574),dy(2.234161))
a_ground(dx(8.450000),dy(-2.750000))
a_screw(dx(7.850000),dy(-2.750000))
jak_fiver(dx(7.100000),dy(-2.650000))
a_screw(dx(7.850000),dy(2.750000))
a_ground(dx(8.450000),dy(2.750000))
a_ground(dx(9.550000),dy(2.750000))
jak_dc(dx(7.100000),dy(3.000000))

#protect the output cap mod
box(dx(7.75),dy(2.35),dx(7.45),dy(2.65),0,-0.125,1)

a_screw(dx(9.550000),dy(-2.750000))
end


 def boxo()
  botrail = dy(-@heighchub+0.5)
  toprail = dy(@heighchub-0.5)
  @curxo += MARJ
 doxo
  bronx(dx(9.5),botrail,dx(0.5),toprail,0,@@deepana,2,@bronk)
   box(dx(9.5),dy(-0.25),dx(8.5),dy(0.25),@@deepana,-0.5,2)
box(dx(1.5),dy(-0.25),dx(0.5),dy(0.25),@@deepana,-0.5,2)
  
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.2)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
 def ducabot
  topnuys = [[8,33-8]]
  botnuys = [[8,33-8]]
  @myOkuda.bokchoydeluxe(-0.78,1.0,32,12,topnuys,botnuys)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end

end
$rimmer = 0.01
stutterat(DeerBot)