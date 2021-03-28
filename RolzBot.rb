
require './Jacksloon.rb'
require './Okuda.rb'

class RolzBot < Jacksloon
 
 @@numero = 0
 def initialize(starx, stary)
 @marj = 0.42 #0.3
  @width = 11.1#16.0
  @heigh = 6.0
  @depth = 0.8 #0.75
  super(starx, stary)
 end

 def dx(x)
  return @starx + x
 end
 def dy(y)
  return @stary + y
 end

 def boxo()
  botrail = dy(-@heighchub+0.5)
  toprail = dy(@heighchub-0.5)
  @curxo += @marj
  screw = -0.16
  bernie = @curxo

  for i in 1..7 
   drillus(dx(bernie+0.25),dy(2.75),0,screw)
   if i==4 then kobiconn(dx(bernie+0.75),dy(3)) end
   drillus(dx(bernie+1.25),dy(2.75),0,screw)
   bernil = bernie
   bernir = bernie+1.6
   if i==1 then bernil = bernie + 0.05 end
   if i==7 then bernir = bernie + 1.45 end
   box(dx(bernil),dy(botrail),dx(bernir),dy(toprail),0,-0.25,2)
   drillus(dx(bernie+0.75),dy(-2.75),0,screw)
   bernie += 1.6
  end


  
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+@marj*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.3)
  @curxo += @width /2
  box(@curxo-1,-0.25,@curxo-0.05,0.25,@@deepana,-0.5,2)
  box(@curxo-1,toprail-1,@curxo-0.05,toprail-0.5,@@deepana,-0.5,2)
  
  @curxo += @marj
  

  
  return @curxo
 end
 def ducabot
  topnuys = [[10,15]]
  @myOkuda.bokchoydeluxe(-0.78,1.0,24,12,topnuys,[])
 end
 def duxo
  #@curxo += $bitwidth
  return @curxo
 end

end

stutterat(RolzBot)