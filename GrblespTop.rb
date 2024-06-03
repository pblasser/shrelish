

require './PlumPott.rb'
require './Okuda.rb'

#$bitwidth=0.001
#$halfwidth=$bitwidth/2
MARJ = 2/25.4
class GrbespTop < PlumPott
#MARJ = 0.42
 
 @@lipp = MARJ
 def cmil(cm)
  return cm/2.54
 end

  def mm(i) return i/25.4 end
 def dy(y)
  return @stary+mm(y)
 end
 def dx(x)
  return @curxo+mm(x)
 end
 def initialize(starx, stary)
  @width = mm(100)
  @heigh = mm(60)
  super(starx, stary)
 end

def omron_side(x,y,r)
  box(dx(x-5),dy(y+2),dx(x+5),dy(y+10),0,-0.125,1)
 end

 def adamtech(x,y,r)
  box(dx(x-27.5),dy(y-10),dx(x+27.5),dy(y-5),0,-0.125,1)
 end
 def kyocera(x,y,r)
 end



 def screw(x,y,r)
  looscrew(dx(x),dy(y))
 end




 def boxo()  
  @curxo += MARJ
  @curxo += $halfwidth




  @curxo += @width/2



   adamtech(0,30,0)
 screw(-44,24,0)
 screw(44,24,0)
 screw(44,-24,0)
 screw(-44,-24,0)
 omron_side(-20,-30,0)
 omron_side(20,-30,0)
 kyocera(50,0,0)
 box(dx(-42),dy(-20),dx(42),dy(20),0,-1.0/8,1)

  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+MARJ*2+$bitwidth,mm(8))
  @curxo += @width/2
  
  @curxo += MARJ
    @curxo += $halfwidth
  return @curxo

 end
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoy(-@depth,1.0,16,16)
 end
 def duxo
 # @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01

stutterat(GrbespTop)
