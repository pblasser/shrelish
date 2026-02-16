
require './Jacksloon.rb'
require './Curxuda.rb'

   $bitwidth = 4.0/25.4
 $halfwidth = $bitwidth/2
  MARJ = 4/25.4

class Bot
  @@lipp = MARJ
end
class NortubeBot < Jacksloon
  @@lipp = MARJ
 def initialize(starx, stary)
  @argtoo = 1
  @powjak = mm(0.5)
  unless ARGV[2].nil? then @argtoo = Integer(ARGV[2]) end
  @wid0 = 90
  unless ARGV[3].nil? then @wid0 = Integer(ARGV[3]) end
  @wid0= mm(@wid0)
  @width = @wid0 * @argtoo
  @width += (@argtoo-1)*mm(6)
  @width += @powjak*2 
  @heigh = @wid0+ @powjak*2 
   #0.75
  super(starx, stary)
  @depth = mm(35)
 end
 def mm(i) return i/25.4 end
 def getBrot()
  return @heighchub + $halfwidth + @@lipp + @powjak
 end

 def boxo()
  @curxo += MARJ
  @curxo += @powjak
  @curxo += $halfwidth
  kobiside(@curxo,@stary)
  nuys = [[1.0,0.6,-0.6,-1.0]]
    marx = MARJ + @starx + @width /2 + $halfwidth
    sidenuys = nuys
  topnuys=[]
  botnuys=[]
#lox(@curxo-mm(47),@stary-mm(47),@curxo+mm(47),@stary+mm(47),4)
  mainchunx = @wid0/2 -mm(10) 
  my = mainchunx
   for i in 1..@argtoo do
   @curxo += @wid0 /2
    _kyconsterupsidedown(@curxo,@stary - (@wid0/2),0.53)
    _kyconster(@curxo,@stary + (@wid0/2),0.53)
   
   
   tierwon=-mm(14)
   tiertwo=tierwon-mm(14)
   tiertre=tiertwo-mm(2)
  

  #box(@curxo-my,@stary-my,@curxo+my,@stary+my,0,tierwon,4)
  #box(@curxo-mm(31),@stary-mm(26),@curxo+mm(31),@stary+mm(26),tierwon,tiertwo,4)
  #box(@curxo-mm(20),@stary-mm(25),@curxo+mm(20),@stary+mm(25),tiertwo,tiertre,1)
  
  topnuys.prepend(nuys[0].collect { |n| n + @curxo -marx })
  botnuys.append(nuys[0].collect { |n| (n*-1) + @curxo -marx })
  
  @curxo += @wid0 /2
  if (i<@argtoo) then @curxo += mm(6) end
 end
  

    mainchunx = @width/2 -mm(10) -@powjak
  mx = mainchunx
  box(marx-mx,@stary-my,marx+mx,@stary+my,0,tierwon,4)
  box(marx-mm(31),@stary-mm(26),marx+mm(31),@stary+mm(26),tierwon,tiertwo,4)
  box(marx-mm(20),@stary-mm(25),marx+mm(20),@stary+mm(25),tiertwo,tiertre,1)

  carr = Curxuda.genfarr(@width+MARJ*2+$bitwidth,
  @heigh+@@lipp*2+$bitwidth,
  mm(6)+MARJ,topnuys,botnuys,sidenuys)
  @myCurxuda = Curxuda.new(marx,@stary,@depth,carr)

  
  
  @curxo += MARJ
 @curxo += @powjak
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
