
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
  @width = mm(111)
  @heigh = mm(111)
   #0.75
  super(starx, stary)
  @depth = mm(35)
 end
 def mm(i) return i/25.4 end



 def boxo()
  @curxo += MARJ
  @curxo += $halfwidth

  kobiside(@curxo,@stary)

  @curxo += @width /2



   kyconsterupsidedown(@curxo,@stary - mm(55))
   kyconster(@curxo,@stary + mm(55))

   tierwon=-mm(14)
   tiertwo=tierwon-mm(14)
   tiertre=tiertwo-mm(2)

  box(@curxo-mm(45),@stary-mm(45),@curxo+mm(45),@stary+mm(45),0,tierwon,4)
  box(@curxo-mm(31),@stary-mm(26),@curxo+mm(31),@stary+mm(26),tierwon,tiertwo,4)
  box(@curxo-mm(20),@stary-mm(25),@curxo+mm(20),@stary+mm(25),tiertwo,tiertre,1)

  

  marx = MARJ + @starx + @width /2

  topnuys = [[1.0,0.6,-0.6,-1.0]]
    sidenuys = topnuys
  botnuys = [topnuys[0].collect { |n| n * -1 }]

  carr = Curxuda.genfarr(@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.4,topnuys,botnuys,sidenuys)
  @myCurxuda = Curxuda.new(@curxo,@stary,@depth,carr)

  @curxo += @width /2
  
  @curxo += MARJ
  @curxo += $halfwidth







  return @curxo
 end
 def ducabot
     $bitwidth = 4.1/25.4
 $halfwidth = $bitwidth/2
  @myCurxuda.boka(mm(30))
 end
 def duxo
  return @curxo
 end
end


stutterat(NortubeBot)