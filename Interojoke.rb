
require './Jacksloon.rb'
require './Okuda.rb'

class Interojoke < Jacksloon
MARJ = 0.42

 def initialize(starx)
  stary = 0
    @botrail = stary-2.2
  @toprail = stary+2.2
  @hawi = @width / 2
  @heigh = 2.7 * 2 #5.05 + 0.05
  @depth = 0.8 ###AHHHA
 
  @drilldep = -0.15
  @slidodep = -0.1
  @batdepth = 2
  @@lipp = 0
  super(starx, stary)
 end
 def mmil(mm)
  return mm/25.4
 end
 def jak(x,y)
  tubo(mmil(x)+@curxo,mmil(y), 0.4, 0, -0.5, 4)
 end
 def pot(x,y)
  tubo(mmil(x)+@curxo,mmil(y), 0.4,0, -0.5,4)
 end
 def ducatop
 end
 def ducabot
    box(@curxo-@hawi,@botrail,@curxo+@hawi,@toprail,0,-0.28,2)
  box(@curxo-@hawi,@stary-0.25,@curxo-@hawi+1,@stary+0.25,-0.27,-0.5,2)
  box(@curxo-0.4,@toprail-0.8,@curxo+0.4,@toprail+0.1,-0.28,-0.5,2)
  box(@curxo+@hawi-1,@stary-0.25,@curxo+@hawi,@stary+0.25,-0.27,-0.5,2)
  box(@curxo-0.25,@botrail,@curxo+0.25,@botrail+1,-0.28,-0.5,2)
 end
 def duxo
 @curxo += $bitwidth
  return @curxo
 end
end

class Mocante < Interojoke
 def initialize(starx)
  @width = 11.18
  super(starx)
 end
 def boxo()

  @curxo += @hawi
  drillus(@curxo-5.3,2.411,0,@drilldep )
  jak(-130,46)
  pot(-130,26)
  pot(-130,-26)
  jak(-130,-46)
  drillus(@curxo-5.3,-2.411,0,@drilldep )
  
  drillus(@curxo+5.3,2.411,0,@drilldep )
  jak(130,46)
  jak(130,26)
  jak(130,-26)
  jak(130,-46)
  drillus(@curxo+5.3,-2.411,0,@drilldep )
  ducabot()
  @curxo += @hawi
  return @curxo
 end
end

class Grassi < Interojoke
 def initialize(starx)
  @width = 2.4 - (20.0/1000.0)
  super(starx)
 end
 def mmil(mm)
  return mm/1000.0
 end
 def boxo()
  @curxo += @hawi
  drillus(@curxo+0.9,2.411,0,@drilldep )
  jak(239.23,1800)
  jak(-280.38,1500)
  jak(-800,1200)
  drillus(@curxo-0.9,2.411,0,@drilldep )
  
  drillus(@curxo+0.9,-2.411,0,@drilldep )
  jak(-239.23,-1800)
  jak(280.38,-1500)
  jak(800,-1200)
  drillus(@curxo-0.9,-2.411,0,@drilldep )
  ducabot()
  @curxo += @hawi
  return @curxo
 end
end
MARJ= 0.42
def dudderat()
 argument = 0
 cursorx = MARJ
 while  (ARGV[argument].nil?) ==false
  argvor = String(ARGV[argument])
  if argvor=="mocante" then
   cursorx = Mocante.new(cursorx).boxo()
  elsif argvor=="grassi" then
   cursorx = Grassi.new(cursorx).boxo()
  end
  argument = argument + 1
 end
 cursorx += MARJ
 topnuys = []
 botnuys = []#[33-11,33-3],[33-19,33-16]]
 myOkuda = Okuda.new(cursorx/2,0,cursorx+$bitwidth,(2.7 * 2)+$bitwidth,MARJ)
 myOkuda.bokchoydeluxe(-0.8,1.0,Integer(cursorx)*2,10,topnuys,botnuys)
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"
end

dudderat()