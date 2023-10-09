
require './Jacksloon.rb'
require './Okuda.rb'

class Grblard < Jacksloon
  def mm(x) return x/25.4 end
  MARJ = 2.0/25.4
 def initialize(starx, stary)
  @width = mm(86)
  @heigh = mm(60)
  @depth = 0.8
  super(starx, stary)
 end

 def dx(x)
  return @curxo + mm(x) 
 end
 def dy(y)
  return @stary + mm(y)
 end
 def omron(x,y)
  box(x-mm(4),y-mm(8),x+mm(4),y+mm(8),0,-0.15,1)
 end
 def boxo()
    @curxo += $halfwidth
  @curxo += MARJ
  drillus(dx(6),dy(24),0,-0.15)
  drillus(dx(32),dy(24),0,-0.15) 
  drillus(dx(80),dy(24),0,-0.15) 
  drillus(dx(6),dy(-24),0,-0.15)
  drillus(dx(32),dy(-24),0,-0.15) 
  drillus(dx(80),dy(-24),0,-0.15)

  omron(dx(7),dy(12))
  omron(dx(7),dy(-12))
  

  box(dx(12),dy(-22),dx(76),dy(22),0,-0.5,4)
  box(dx(76),dy(-3),dx(88),dy(3),0,-mm(6),2)

  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+MARJ*2+$bitwidth,mm(8))
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
 
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoydeluxe(-0.8,1.0,12,12,[],[])
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end

$rimmer = 0.01
stutterat(Grblard)
