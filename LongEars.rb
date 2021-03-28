
require 'Bot.rb'


class LongEars < Bot
 LIPP = 0.1
 def initialize()
  @width=4.3
  @latowidth=2.2
  @heigh=3.7
  @depth=0.77
  super
 end

 def boxo(startx, starty)
  curxo = startx + @width
  botrail = starty-@heighchub+0.4
  toprail = starty+@heighchub-0.4
  
  drillerx = startx+0.5
  for i in 0..3 do
   drillus(drillerx,botrail-0.15,0,-0.2)
   drillus(drillerx,toprail+0.15,0,-0.2)
   drillerx += 1.1
  end
  
  midx = @width/2   
  nowchub = 0.25 #adamusb
  box(startx+midx-0.25,toprail-0.1,startx+midx+0.25,starty+@heighchub+0.1,0,-0.42,4)
  
  midx -= 1.1
  nowchub = (0.610/2) #alpswitch
  box(startx+midx-nowchub,toprail-0.1,startx+midx+nowchub,starty+@heighchub-LIPP,0,-0.334,3)
  nowchub = (0.2/2) #alpsSHAFT
  box(startx+midx-nowchub,starty+@heighchub-0.2,startx+midx+nowchub,starty+@heighchub+0.1,0,-0.3,3)

  midx += 2.2
  nowchub = (0.474/2) #kyconSTEREO
  box(startx+midx-nowchub,toprail-0.1,startx+midx+nowchub,starty+@heighchub-LIPP,0,-0.334,3)
  dux(startx+midx-nowchub+$halfwidth,toprail,startx+midx-nowchub+$halfwidth,starty+@heighchub-0.1-$halfwidth,-0.334,-0.374,1)
  dux(startx+midx+nowchub-$halfwidth,toprail,startx+midx+nowchub-$halfwidth,starty+@heighchub-0.1-$halfwidth,-0.334,-0.374,1)
  nowchub = (0.250/2) #kyconSHAFT
  box(startx+midx-nowchub,starty+@heighchub-0.2,startx+midx+nowchub,starty+@heighchub+0.1,0,-0.3,3)

  box(startx+0.1,botrail,curxo-0.1,toprail,0,-0.105,1)
  dux(curxo-0.17,starty-0.5,curxo-0.17,starty+0.5,-0.105,-0.305,2)
  box(startx+0.2,botrail,curxo-0.2,toprail,-0.105,-0.420,3)
  #tubo(startx+@width/2,starty-@heighchub+2.850,0.2,-0.42,0-@depth,3)

  return curxo
 end

 def lato(startx, starty)
  curxo = startx + @latowidth
  botrail = starty-@heighchub+0.4
  toprail = starty+@heighchub-0.4
  box(startx+0.2,botrail,curxo-0.2,toprail,0,-0.420,4)
  weirdsignale(startx+0.2,botrail,curxo-0.2,toprail,-0.42,0-@depth)
  return curxo
 end
 def bottop 
  curyo = @yplankus
  for i in 1..@yarg do
   curyo -= $bitwidth
   curyo -= @heighchub
   if (i%2) == 0 
    curxo = 0
   else curxo = 0.5 end
   curxo = duxo(curxo,curyo)
 
   for j in 1..@xarg do
    curxold = curxo
    curxo += @latowidth
    curxo = boxo(curxo,curyo)
	dwellus(60)
    lato(curxold,curyo)
    curxo = lato(curxo,curyo)
    curxo = duxo(curxo,curyo)
   end
   curyo -= @heighchub
  end
  
  @xplankus = @latowidth + @latowidth + @width + ($bitwidth * 2)
 end
end

mystuff = LongEars.new
mystuff.bottop
mystuff.londucate
