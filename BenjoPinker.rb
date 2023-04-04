
require './PlumPott.rb'
require './Okuda.rb'

class BenjoTop < PlumPott
 
 MARJ = 9/25.4

 def initialize(starx, stary)
  @width = mm(162)
  @heigh = mm(162)
  @depth = 0.55
  super(starx, stary)
 end
 def mm(i) return i/25.4 end
 def dx(x)
  return @curxo + mm(x) 
 end
 def dy(y)
  return @stary + mm(y)
  #return @stary + mm(y)
 end


 def JOHNSON(x,y,r)
  johnson(dx(x),dy(y))
 end

 def boxo()
  @curxo += MARJ
  @curxo += $halfwidth
  for i in 0..9 do 
    for j in 0..9 do
      JOHNSON(i*18,j*18-18*4.5,0)
    end
  end
  spyrtub(dx(18*4.5),0,0.25,0)
  @curxo += @width/2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+MARJ*2+$bitwidth,mm(8))
  @curxo += @width/2
  
  @curxo += MARJ
    @curxo += $halfwidth
  return @curxo
 end
 def ducabot
  topnuys = []
  botnuys = []
  @myOkuda.bokchoy(-@depth,1.0,16,16)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end
stutterat(BenjoTop)