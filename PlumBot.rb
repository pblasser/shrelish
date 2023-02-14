
require './Jacksloon.rb'
require './Okuda.rb'

class PlumBot < Jacksloon

#MARJ = 0.25
MARJ = 0.05

 def initialize(starx, stary)
  @width = 16.0
  @heigh = 6.0
  @depth = 0.8 #0.75
  @magic = 0.023 #for the weird clockwise alignment!
  @magic = 0
  super(starx, stary)
  @magic = 0
 end

 def dx(x)
  return @curxo + (16-x)
 end
 def dy(y)
  return @stary + y
 end
 def boxo()
  botrail = dy(-@heighchub+0.5)
  toprail = dy(@heighchub-0.5)
  @curxo += MARJ
  screw = -0.16
  #bronk = 0.16
  #steam
  drillus(dx(10.25),dy(-2.75),0,screw)
  box(dx(13.75),dy(-2.9),dx(11.75),dy(botrail),0,-0.1,1)
  drillus(dx(14.75),dy(-2.75),0,screw)
  drillus(dx(14.75),dy(2.75),0,screw)
  drillus(dx(10.25),dy(2.75),0,screw)
  bronx(dx(15),botrail,dx(10),toprail,0,@@deepana,2,@bronk)  
  box(dx(15.5),dy(-0.25),dx(14),dy(0.25),-0,-0.5,4)
  box(dx(15.5),toprail-1,dx(14),toprail-0.5,-0,-0.5,4)
    #butt
  drillus(dx(3.25),dy(-2.75),0,screw)
  kyconsterupsidedown(dx(4.5+@magic),dy(-3))
  kyconsterupsidedown(dx(8.5+@magic),dy(-3))
  drillus(dx(9.75),dy(-2.75),0,screw)
  drillus(dx(9.75),dy(2.75),0,screw)
  kyconster(dx(8-@magic),dy(3))
  kobiconn(dx(5-@magic),dy(3))
  drillus(dx(3.25),dy(2.75),0,screw)
  bronx(dx(10),botrail,dx(3),toprail,0,@@deepana,2,@bronk)
  
  #deer
  drillus(dx(1.25),dy(2.75),0,screw)
  drillus(dx(1.25),dy(-2.75),0,screw)
  kyconsterupsidedown(dx(2+@magic),dy(-3))
  bronx(dx(3),botrail,dx(1),toprail,0,@@deepana,2,@bronk)
#  tubo(dx(2.8),dy(-2.272),0.33,-0.205,-0.5,3)
#  tubo(dx(2.702),dy(2.234),0.33,-0.205,-0.5,3)
  drillus(dx(2.75),dy(2.75),0,screw)
  drillus(dx(2.75),dy(-2.75),0,screw)
  
  #deerant
  #drillus(dx(0.5),dy(2.75),0,-0.2)
  box(dx(1),dy(1.5),dx(0.3),dy(2.9),0,@@deepana,2)
  #drillus(dx(0.5),dy(-2.9),0,-0.2)
  box(dx(1),dy(-2.9),dx(0.3),dy(-1.5),0,@@deepana,2)
  
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.25)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
 def ducabot
  topnuys = [[33-25,33-14]]
  botnuys = [[33-11,33-3],[33-19,33-16]]
  @myOkuda.bokchoydeluxe(-0.78,1.0,32,12,topnuys,botnuys)
 end
 def duxo
  #@curxo += $bitwidth
  return @curxo
 end

end

stutterat(PlumBot)