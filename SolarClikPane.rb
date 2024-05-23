

require './PlumPott.rb'
require './Okuda.rb'

#$bitwidth=0.001
#$halfwidth=$bitwidth/2
PAINSWITCH=0
PAINSWITCH=Integer(ARGV[2]) or 0
class Shplorer < PlumPott
#MARJ = 0.42
@@lipp = 0.00
 def cmil(cm)
  return cm/2.54
 end

 def mm(i) return i/25.4 end
 def unmm(i) return i*25.4 end
 def dy(y)
  return @stary+mm(y)
 end
 def dx(x)
  return @curxo+mm(x)
 end
 def initialize(starx,stary)
  
   @width = mm(110)
    @xarg=PAINSWITCH
    if (@xarg==0) then @heigh = mm(40)
    elsif (@xarg==1) then @heigh = mm(50)
   end
   
  
  super(starx,stary)
  @depth = mm(7)
 end


 def boxo()  
  w = @width/2.0
  h = @heigh/2.0
  @curxo=@curxo+w
  if (@xarg==0) then
   tubo(dx(0),dy(0),0.55,-0,mm(-3),2)
   dux(dx(0),dy(-20),dx(0),dy(20),0,mm(-2.5),1)
  end
  @myOkuda = Okuda.new(@curxo,@stary,@width+$bitwidth,@heigh+$bitwidth,0.02)
  @curxo=@curxo+w
  return  @curxo

 end
 def ducatop
 end
 def ducabot
  #chubb=Integer()
  @myOkuda.bokchoydeluxe(-@depth,1.0,20,@heigh.round*4, [], [])
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end

$rimmer = 0.01
stutterat(Shplorer) 
