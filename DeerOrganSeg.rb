
require './Jacksloon.rb'
require './Okuda.rb'

class Deerorg < Jacksloon
MARJ = 0.75
#was marj 1! maybe for cocodeer?

 def initialize(starx, stary)
  @width = 3.7
  @heigh = 6.0
  @depth = 0.8 #0.75
  super(starx, stary)
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
  botrail = dy(-@heighchub+0.5)
  toprail = dy(@heighchub-0.5)
  @curxo += MARJ
  screw = -0.16
  
  ##########3
  box(dx(1.2),dy(-2.8),dx(1.7),dy(botrail),0,-0.27,2)
  box(dx(0),dy(toprail),dx(0.5),dy(2.8),0,-0.27,2)
  drillus(dx(1.7+0.25),dy(-2.75),0,screw)
  kyconsterupsidedown(dx(2.7),dy(-3))
  drillus(dx(1.7+1.75),dy(-2.75),0,screw)
  
  drillus(dx(1.7+0.25),dy(2.75),0,screw)
  kyconster(dx(2.35),dy(3))
  kobiconn(dx(3.05),dy(3))
  drillus(dx(1.7+1.75),dy(2.75),0,screw)
  box(dx(0.1),botrail,dx(3.8),toprail,0,-0.27,2)
  tubo(dx(2.7-0.8),dy(-2.272),0.25,-0.205,-0.5,3)
  tubo(dx(2.7-0.702),dy(2.234),0.25,-0.205,-0.5,3)
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.25)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
 
 def ducabot
  topnuys = [[2,21]]
  @myOkuda.bokchoydeluxe(-0.78,1.0,22,12,topnuys,topnuys)
 end
 def duxo
  dux(@starx+3.8+MARJ,@stary+0.25,@starx+3.8+MARJ*3+0.1,@stary+0.25,0,-0.27,2)
  @curxo += $bitwidth
  return @curxo
 end

end
$rimmer = 0.01
stutterat(Deerorg)