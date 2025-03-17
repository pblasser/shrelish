
require './Jacksloon.rb'
require './Okuda.rb'

 MARJ = 2/25.4

class GrblespBot < Jacksloon
 
 MARJ = 2/25.4
 @@lipp=MARJ

 def initialize(starx, stary)

  @width = mm(100)
  @heigh = mm(60)
  @depth = 0.77 #0.75

  super(starx, stary)
 end
 def mm(i) return i/25.4 end
 def dx(x)
  return @curxo + mm(x) 
 end
 def dy(y)
  return @stary + mm(y)
 end

 def adamtech(x,y,r)
  box(dx(x-27.5),dy(y-15),dx(x+27.5),dy(y+2),0,-0.5,4)
 end
 def kyocera(x,y,r)
  box(dx(x-2),dy(y-8),dx(x+10),dy(y+8),0,mm(-2),1)
 end

 def screw(x,y,r)
  screw = -0.16
  drillus(dx(x),dy(y),0,screw)
 end
 def omron_side(x,y,r)
   box(dx(x-2.5),dy(y-2),dx(x+2.5),dy(y+6),0,-0.3,3)
   box(dx(x-4.5),dy(y+3),dx(x+4.5),dy(y+10),0,-mm(2),1)
  box(dx(x-4.2),dy(y+3),dx(x+4.2),dy(y+10),-mm(2),-mm(8),2)
 end


 def boxo()
  xard = @curxo
  @curxo += $halfwidth
  @curxo += MARJ
  @curxo+= @width/2

 adamtech(0,30,0)
 screw(-44,24,0)
 screw(44,24,0)
 screw(44,-24,0)
 screw(-44,-24,0)
 omron_side(-20,-30,0)
 omron_side(20,-30,0)
 kyocera(-50,0,0)
 box(dx(-46),dy(-20),dx(42),dy(20),0,-5.0/8,5)
 dux(dx(42),dy(0),dx(52),dy(0),0,-1.0/8,1)
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+MARJ*2+$bitwidth,mm(8))
 @curxo += MARJ
 @curxo += $halfwidth
 @curxo+= @width/2
 return @curxo
 end
 def ducabot
  topnuys = []
  botnuys = [[2,11]]

  @myOkuda.bokchoytwomo(-0.77,1.0,12,12,topnuys,botnuys)
 end
 def duxo
  return @curxo
 end
end


$rimmer=0.01


stutterat(GrblespBot)
