
require './Jacksloon.rb'
require './Okuda.rb'
require './plumbENGRAVE/cornuSZILK.rb'

class CornuBot < Jacksloon
 MARJ = 0.25 #0.25
 @@numero = 0
 
 def initialize(starx, stary)
  @width = 15.4
  @heigh = 6
  @depth = 0.75
  #@@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end
 def spesal()
  @curxo+=0.5
    drillus(@curxo-0.35,@stary-2.75,0,-0.2)
  kobiconn(@curxo,@stary-@heighchub+0.75-$halfwidth)
  drillus(@curxo++0.35,@stary-2.75,0,-0.2)
  
  drillus(@curxo-0.35,@stary+2.75,0,-0.2)
  kyconster(@curxo,@stary+@heighchub)
  drillus(@curxo+0.35,@stary+2.75,0,-0.2)
  
  box(@curxo-0.5,@stary-2.5,
       @curxo+0.5,@stary+2.5,0,-0.205,2)
  @curxo += 0.6
 end
 def boxo()
  
  @curxo += MARJ
  
  widochub = @width/2
  @myOkuda = Okuda.new(@curxo+widochub,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.5)
  
  for i in 0..3
   if i == 2 then spesal else
   box(@curxo,@stary-2,
       @curxo+2.4,@stary+2,0,-0.25,2)
   drillus(@curxo+2.250,@stary-2.25,0,-0.2)
   drillus(@curxo+4.550,@stary-2.25,0,-0.2)
   drillus(@curxo+2.250,@stary+2.25,0,-0.2)
   drillus(@curxo+4.550,@stary+2.25,0,-0.2)
   box(@curxo+2.4,@stary-2.5,
       @curxo+4.4,@stary+2.5,0,-0.25,2)
   @curxo+= 4.8
   end
  end
 
  @curxo += MARJ
  return @curxo
 end
 def ducatop
 end
 def ducabot
  @myOkuda.bokcho(-@depth,1.0,32,12)
 end
 def duxo
  #@curxo += $bitwidth
  return @curxo
 end
end

stutterat(CornuBot)