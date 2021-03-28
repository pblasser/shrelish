
require './Jacksloon.rb'
require './Okuda.rb'

class CocoBot < Jacksloon

MARJ = 0.42

 def initialize(starx, stary)
  @width = 11.5
  @heigh = 6.0
  @depth = 0.8 #0.75
  
  super(starx, stary)
  @magic = 0
 end

 def dx(x)
  return @curxo + x
 end
 def dy(y)
  return @stary + y
 end

 def opto_alpswitch(x,y) 
   box(x-0.25,y-0.5,x+0.25,y-0.1,0,-0.15,1)
 end
  def opto_kobiconn(x,y) 
 end
 def boxo()
 @magic = 0 #!!!!!!!!!
  botrail = dy(-@heighchub+0.5)
  toprail = dy(@heighchub-0.5)
  @curxo += MARJ
  screw = -0.16
  
  #preamps
  drillus(dx(0.2),dy(-2.75),0,screw)
  kyconsterupsidedown(dx(0.6)+@magic,dy(-3))
  drillus(dx(1),dy(-2.75),0,screw)
  drillus(dx(0.6),dy(2.75),0,screw)
  bronx(dx(0),botrail,dx(1.3),toprail,0,@@deepana,2,@bronk)
  tubo(dx(0.6),dy(0),0.4,-0.27,-0.5,2)
  @curxo += 1.3
  #coco one
  drillus(dx(0.25),dy(-2.75),0,screw)
  drillus(dx(2.25),dy(-2.75),0,screw)
  drillus(dx(2.25),dy(2.75),0,screw)
  drillus(dx(0.25),dy(2.75),0,screw)
  bronx(dx(0),botrail-0.05,dx(2.6),toprail+0.05,0,@@deepana,2,@bronk)
  @curxo += 2.6
  #quantico
  drillus(dx(0.25),dy(-2.75),0,screw)
  box(dx(0.6),dy(-2.9),dx(1.7),dy(botrail),0,-0.1,1)
    kyconsterupsidedown(dx(2.1)+@magic,dy(-3))
	  kyconsterupsidedown(dx(2.9)+@magic,dy(-3))
	  box(dx(3.3),dy(-2.9),dx(4.4),dy(botrail),0,-0.1,1)
  drillus(dx(4.75),dy(-2.75),0,screw)
  drillus(dx(4.75),dy(2.75),0,screw)
  kyconster(dx(3.5)-@magic,dy(3))
  opto_alpswitch(dx(2.5),dy(3))
  kobiconn(dx(1.5)-@magic,dy(3))
  opto_kobiconn(dx(0.7),dy(3))
  
  drillus(dx(0.25),dy(2.75),0,screw)
  bronx(dx(0),botrail,dx(5.1),toprail,0,@@deepana,2,@bronk)
  @curxo += 5.1
  #coco two
  drillus(dx(0.25),dy(-2.75),0,screw)
  drillus(dx(2.25),dy(-2.75),0,screw)
  drillus(dx(2.25),dy(2.75),0,screw)
  drillus(dx(0.25),dy(2.75),0,screw)
  bronx(dx(0),botrail-0.05,dx(2.5),toprail+0.05,0,@@deepana,2,@bronk)
  bronx(dx(1.5),dy(-0.25),dx(2.5),dy(0.25),@@deepana,-0.5,3,@bronk)
  bronx(dx(1.5),toprail-1,dx(2.5),toprail-0.5,@@deepana,-0.5,3,@bronk)
  @curxo += 2.5

  marx = MARJ + @starx + @width /2
  @myOkuda = Okuda.new(marx,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.25)

  
  @curxo += MARJ
  return @curxo
 end
 def ducabot
  topnuys = [[6,16]]
  botnuys = [[10,16],[1,3]]
  @myOkuda.bokchoydeluxe(-0.78,1.0,22,12,topnuys,botnuys)
 end
 def duxo
  #@curxo += $bitwidth
  return @curxo
 end

end

stutterat(CocoBot)