
require './Jacksloon.rb'
require './Okuda.rb'

class Deerorg < Jacksloon
MARJ = 0.33
@@numero = 0
 def initialize(starx, stary)
  @width = 3.7
  @heigh = 6.0
  @depth = 0.8 #0.75
  @durxo = 0.0
  super(starx, stary)
 end

 def dx(x)
  return @durxo + x
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
  @durxo = @curxo
  ##########3
  @durxo = @curxo
 
  if @@numero==5 then
   box(dx(0),botrail,dx(3.6),toprail,0,@@deepana,2)
  else 
   box(dx(0.1),botrail,dx(3.7),toprail,0,@@deepana,2)
  end
  
  if @@numero==5 then
   @durxo = @curxo + 2
  else @durxo = @curxo end
  
  box(dx(1.2),dy(-2.8),dx(1.7),dy(botrail),0,@@deepana,2)
  box(dx(0),dy(toprail),dx(0.5),dy(2.8),0,@@deepana,2)
  
  if @@numero==5 then
   @durxo = @curxo
  else @durxo = @curxo+1.7 end
  
  drillus(dx(0.25),dy(-2.75),0,screw)
  kyconsterupsidedown(dx(1),dy(-3))
  drillus(dx(1.75),dy(-2.75),0,screw)
  
  drillus(dx(0.25),dy(2.75),0,screw)
  kyconster(dx(2.35-1.7),dy(3))
  if @@numero==0 then 
   kobiconn(dx(3.05-1.7),dy(3))
  end
  drillus(dx(1.75),dy(2.75),0,screw)
  tubo(dx(1-0.8),dy(-2.272),0.25,-0.205,-0.5,3)
  tubo(dx(1-0.702),dy(2.234),0.25,-0.205,-0.5,3)
  

  
  
  
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.25)
  @curxo += @width /2
  @curxo += MARJ
  
  @@numero += 1
  @@numero %= 4
  
  return @curxo
 end
 def numerize
  unless ARGV[2].nil? then @@numero = Integer(ARGV[2]) end
 end
 def numerise(x)
  @@numero=x
 end
 def ducabot
  topnuys = [[3,20]]
  @myOkuda.bokchoydeluxe(-0.78,1.0,22,12,topnuys,topnuys)
 end
 def duxo
 
  #dux(@starx+3.8+MARJ,@stary+0.25,@starx+3.8+MARJ*3+0.1,@stary+0.25,0,-0.27,2)
  @curxo += $bitwidth
  return @curxo
 end

end
$rimmer = 0.01

unless ARGV[3].nil? then 
 nummerat(Deerorg,Integer(ARGV[3]))
else stutterat(Deerorg) end
