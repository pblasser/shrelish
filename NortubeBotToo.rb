
require './Jacksloon.rb'
require './Curxuda.rb'

   $bitwidth = 6.0/25.4
 $halfwidth = $bitwidth/2
  MARJ = 4/25.4

class Bot
  @@lipp = MARJ
end

class NortubeBot < Jacksloon
  @@lipp = MARJ
 def initialize(starx, stary)
  @width = mm(110)
  @heigh = mm(110)
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



 def kobiside(x,y)
 nowchub = (0.367/2)
 #box(x+0.3,y+nowchub,x+0.5,y+nowchub+$bitwidth,0,-0.211,2)
 box(x-$halfwidth,y-nowchub,x+0.75,y+nowchub,0,-0.433,4)#june23 made 433 back to 4
 box(x-MARJ-$halfwidth,y-0.5,x,y+0.5,0,-1,8)
 #december 2023 made 4 back to 433
end

 def boxo()
  @curxo += MARJ
  @curxo += $halfwidth

  kobiside(@curxo,@stary)

  @curxo += @width /2
lox(@curxo-mm(59),@stary-mm(59),@curxo+mm(59),@stary+mm(59),4)
   kyconsterupsidedown(@curxo,@stary - mm(55))
   kyconster(@curxo,@stary + mm(55))
  box(@curxo-mm(45),@stary-mm(45),@curxo+mm(45),@stary+mm(45),0,-mm(20),4)
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
     $bitwidth = 4.1/25.4
 $halfwidth = $bitwidth/2
  @myCurxuda.bok()
 end
 def duxo
  return @curxo
 end
end


stutterat(NortubeBot)