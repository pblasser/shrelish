
require './Jacksloon.rb'
require './Curxuda.rb'

   $bitwidth = 4.0/25.4
 $halfwidth = $bitwidth/2
  MARJ = 4/25.4

class Bot
  @@lipp = MARJ
end
class NorBot < Jacksloon
  @@lipp = MARJ
 def initialize(starx, stary)
  @argtoo = 1
  @powjak = mm(0.5)
  unless ARGV[2].nil? then @argtoo = Integer(ARGV[2]) end
  @wid0 = 90
  unless ARGV[3].nil? then @wid0 = Integer(ARGV[3]) end
    @stil = :continu
  unless ARGV[4].nil? then @stil = String(ARGV[4]).to_sym() end
    @line = :nortube90
  unless ARGV[5].nil? then @line = String(ARGV[5]).to_sym() end    
  @wid0= mm(@wid0)
  @width = @wid0 * @argtoo
  @width += (@argtoo-1)*mm(6)
  @width += @powjak*2 
  @heigh = @wid0+ @powjak*2 
   #0.75
  super(starx, stary)
  @depth = mm(35)

  fittingprocify()


 end
 def mm(i) return i/25.4 end
 def dx(x)
  return @curxo + mm(x)
 end
 def dy(y)
  return @stary + mm(y) -(@wid0 /2)
 end
 def JOHNSON(x,y,r)
   tubo(dx(x),dy(y),mm(4),0,-0.25,2)
 end
 def a_screw(x,y,r)
  screw = -0.1
  drillus(dx(x),dy(y),0,screw)
  retract
 end


 def getBrot() #in the rare case of y repetition
  return @heighchub + $halfwidth + @@lipp + @powjak
 end

 def boxo()
  
  @curxo += MARJ
  @curxo += @powjak
  @curxo += $halfwidth
  kobiside(@curxo,@stary)
  @fittingsprocs[@line].call()
  nuys = [[1.0,0.6,-0.6,-1.0]]
  marx = MARJ + @starx + @width /2 + $halfwidth
  sidenuys = nuys
  topnuys=[]
  botnuys=[]
#lox(@curxo-mm(47),@stary-mm(47),@curxo+mm(47),@stary+mm(47),4)
  mx = my = @wid0/2 -mm(9.5) 
  tierwon=-mm(14)
  tiertwo=tierwon-mm(14)
  tiertre=tiertwo-mm(2)
  compartments = Proc.new { |m|    
   box(m-mx,@stary-my,m+mx,@stary+my,0,tierwon,4)
   box(m-mm(30.5),@stary-mm(25.5),m+mm(30.5),@stary+mm(25.5),tierwon,tiertwo,4)
   box(m-mm(20),@stary-mm(25),m+mm(20),@stary+mm(25),tiertwo,tiertre,1) 
  }
  for i in 1..@argtoo do
   @curxo += @wid0 /2
   _kyconsterupsidedown(@curxo,@stary - (@wid0/2),0.53)
   _kyconster(@curxo,@stary + (@wid0/2),0.53)
   if [:modular,:branche].include?(@stil) then compartments.call(@curxo) end
   topnuys.unshift(nuys[0].collect { |n| n + @curxo -marx })
   botnuys.push(nuys[0].collect { |n| (n*-1) + @curxo -marx })
   #so, old ruby2.on.macbook shudbe prepend and append
   @curxo += @wid0 /2
   if (i<@argtoo) then @curxo += mm(6) end
  end 
  mx = @width/2 -mm(10) -@powjak
  if (@stil==:continu) then compartments.call(marx) end
  carr = Curxuda.genfarr(@width+MARJ*2+$bitwidth,
  @heigh+@@lipp*2+$bitwidth,
  mm(6)+MARJ,topnuys,botnuys,sidenuys)
  @myCurxuda = Curxuda.new(marx,@stary,@depth,carr)

  heighchub=@heigh/2+$halfwidth
@myLogeheads=Curxuda.new(marx,@stary,@depth,
   [#[-ma,ff],
   [1,heighchub+2],
   [0.5,heighchub],
   [-0.5,heighchub],
   [-1,heighchub+2],

])
  @curxo += MARJ
 @curxo += @powjak
  @curxo += $halfwidth
  return @curxo
 end

 def ducabot
  #$bitwidth = 4.1/25.4
  #$halfwidth = $bitwidth/2
  if (@stil==:branche) then 
   @myLogeheads.doka(mm(30))
  else @myCurxuda.boka(mm(30))
  end
 end
 def duxo
  return @curxo
 end



 def fittingprocify


 @fittingsprocs =
 { 
  :nortube90 => Proc.new {  },
  :dynastro90 => Proc.new {  },
:dynamono90 => Proc.new { 
a_screw(168.00,6.00,0.0)
JOHNSON(180.00,12.00,-45.0)
JOHNSON(180.00,27.00,-45.0)
JOHNSON(180.00,48.00,0.0)
JOHNSON(180.00,63.00,-135.0)
JOHNSON(180.00,81.00,-90.0)
a_screw(168.00,84.00,0.0)
a_screw(114.00,84.00,180.0)
JOHNSON(102.00,81.00,81.0)
a_screw(72.00,84.00,0.0)
a_screw(18.00,84.00,0.0)
JOHNSON(6.00,80.00,-153.0)
JOHNSON(6.00,67.00,168.0)
JOHNSON(6.00,54.00,15.0)
a_screw(18.00,6.00,0.0)
a_screw(72.00,6.00,0.0)
JOHNSON(84.00,12.00,-12.0)
JOHNSON(102.00,12.00,45.0)
a_screw(114.00,6.00,180.0)
}

}


end





















end


stutterat(NorBot)
