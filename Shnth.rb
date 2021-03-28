
require './Jacksloon.rb'
require './Okuda.rb'

class Shnth < Jacksloon
LIPP = 0.1
MARJ = 0.05
 def initialize(starx, stary)
  @width = 4.3
  @heigh = 4
  @depth = 0.8
  super(starx, stary)
 end

 def boxo()
  botrail = @stary-@heighchub+0.4
  toprail = @stary+@heighchub-0.4
  @curxo += MARJ
  
  drillerx = @curxo+0.5
  for i in 0..3 do
   drillus(drillerx,botrail-0.15,0,-0.15)
   drillus(drillerx,toprail+0.15,0,-0.15)
   drillerx += 1.1
  end
  
  midx = @width/2   
  midx += @curxo
  adamusb(midx, @stary+@heighchub)
  midx -= 1.1
  alpswitch(midx, @stary+@heighchub)
  midx += 2.2
  kyconster(midx, @stary+@heighchub)
  dux(@curxo+@width-0.2,@stary,@curxo+@width-0.2,@stary+0.5,0,-0.333,3)
  drillus(@curxo+@width-0.2,@stary-1.1,0,-0.1)
  drillus(@curxo+@width-0.2,@stary-1.6,0,-0.1)
  kyconsterupsidedown(@curxo+@width/2,@stary-@heighchub )
  drillus(@curxo+0.2,@stary-1.1,0,-0.1)
  drillus(@curxo+0.2,@stary-1.6,0,-0.1)
  box(@curxo+0.2,botrail,@curxo+@width-0.2,toprail,0,-0.420,3)
  weirdsignale(@curxo+0.2,botrail,@curxo+@width/2,toprail,-0.42,-@depth)
  weirdsignale(@curxo+@width/2,botrail,@curxo+@width-0.2,toprail,-0.42,-@depth)

  #@curxo += @width
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.05)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
 
 def ducatop
  midx = @width/2   
  midx += @starx
  midx += MARJ
  middx = midx - 1.5
  midx += 1.5
  brot = getBrot()
  pranska = [[@starx-$bitwidth,@stary+brot],
   [middx,@stary+brot],
   [middx,@stary+@heighchub+$halfwidth],
   [midx,@stary+@heighchub+$halfwidth],
   [midx,@stary+brot],
  
   [@curxo,@stary+brot]]
  incro = (Float(@depth) / Float(@duxulate))
  skimtoPoint(pranska[0][0],pranska[0][1],0.1)
  for i in 1..@duxulate do
   penetrate(0-(incro * i))
   if  (i.divmod(2)[1] != 0) then
    pranska.each {|x| cutoPoint(x[0],x[1])} else
    pranska.reverse.each {|x| cutoPoint(x[0],x[1])} 
   end
  end
 end
 #begin okuda overloads
 def ducatop
 end
 def ducabot
 topnuys = [[2,11]]
 botnuys = [[5,8]]#[33-11,33-3],[33-19,33-16]]
  @myOkuda.bokchoydeluxe(-0.8,1.0,12,12,topnuys,botnuys)
  #@myOkuda.bok(-0.767,1.0)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end

$rimmer = 0.01
stutterat(Shnth)
