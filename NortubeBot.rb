
require './Jacksloon.rb'
require './Curxuda.rb'

   $bitwidth = 6.0/25.4
 $halfwidth = $bitwidth/2
  MARJ = 2/25.4

class Bot
  @@lipp = MARJ
end
class NortubeBot < Jacksloon
  @@lipp = MARJ
 def initialize(starx, stary)
  @width = mm(90)
  @heigh = mm(90)
   #0.75
  super(starx, stary)
  @depth = mm(50)
 end
 def mm(i) return i/25.4 end

 def lox(minx,miny,maxx,maxy,layers)
  minx += $halfwidth
  miny += $halfwidth
  maxx -= $halfwidth
  maxy -= $halfwidth
  skimtoPoint(minx,miny,0.1)
   penetrate(0)
  drawzframe(minx,miny,maxx,maxy)
  for i in 1..layers do   
   minx += $bitwidth 
   miny += $bitwidth
   maxx -= $bitwidth
   maxy -= $bitwidth
   drawzframe(minx,miny,maxx,maxy)
  end
 end 

 def boxo()
  @curxo += MARJ
  @curxo += $halfwidth
  @curxo += @width /2


lox(@curxo-mm(47),@stary-mm(47),@curxo+mm(47),@stary+mm(47),4)


   kyconsterupsidedown(@curxo,@stary - mm(45))
   kyconster(@curxo,@stary + mm(45))

  box(@curxo-mm(35),@stary-mm(35),@curxo+mm(35),@stary+mm(35),0,-mm(20),4)
  box(@curxo-mm(35),@stary-mm(30),@curxo+mm(35),@stary+mm(30),-mm(20),-mm(40),4)
  box(@curxo-mm(25),@stary-mm(25),@curxo+mm(25),@stary+mm(25),-mm(40),-mm(45),1)

  

  marx = MARJ + @starx + @width /2

  

  topnuys = [[1.2,0.8,-0.8,-1.2]]

  botnuys = [#[-4.7,-4.5,-0.5,-0.3],
          [-1.2,-0.8,0.8,1.2]]

  carr = Curxuda.genarr(@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.4,topnuys,botnuys)
  @myCurxuda = Curxuda.new(@curxo,@stary,@depth,carr)

  @curxo += @width /2
  
  @curxo += MARJ
  @curxo += $halfwidth







  return @curxo
 end
 def ducabot
  @myCurxuda.bok()
 end
 def duxo
  return @curxo
 end
end


stutterat(NortubeBot)