
require './Jacksloon.rb'
require './Okuda.rb'

class Mocante < Jacksloon
MARJ = 0.42

 def initialize(starx, stary)
  @width = 11.18
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
 def boxo()
  botrail = @stary-2.2
  toprail = @stary+2.2
  @curxo += MARJ
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
  
  
  box(@curxo-@hawi,botrail,@curxo+@hawi,toprail,0,-0.28,2)
  box(@curxo-@hawi,@stary-0.25,@curxo-@hawi+1,@stary+0.25,-0.27,-0.5,2)
  box(@curxo-0.4,toprail-0.8,@curxo+0.4,toprail+0.1,-0.28,-0.5,2)
  box(@curxo+@hawi-1,@stary-0.25,@curxo+@hawi,@stary+0.25,-0.27,-0.5,2)
  box(@curxo-0.25,botrail,@curxo+0.25,botrail+1,-0.28,-0.5,2)
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,MARJ)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
 def ducatop
 end
 def ducabot
  topnuys = []
  botnuys = []#[33-11,33-3],[33-19,33-16]]
  @myOkuda.bokchoydeluxe(-@depth,1.0,24,10,topnuys,botnuys)
 end
 def duxo
 @curxo += $bitwidth
  return @curxo
 end
end
stutterat(Mocante)