

require './PlumPott.rb'
require './Okuda.rb'

#$bitwidth=0.001
#$halfwidth=$bitwidth/2

class Shplorer < PlumPott
#MARJ = 0.42
@@lipp = 0.00
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
 def initialize(xarg)
  
   @width = 135
    @xarg=xarg
    if (@xarg==0) then
  @heigh = 250
   else @heigh = 270
   end
  @depth = mm(7)

  super($halfwidth,0)
 end

 def JAX(x,y)
  tubo(x,y,mm(12.7),0,mm(-2),1)
  spyrtub(x,y,mm(6),0)

 end
 def POW(x,y)
  spyrtub(x,y,mm(6.35),0)
 end
 def POT(x,y)
  tubo(x,y,mm(7.12),0,mm(-2),1)
  spyrtub(x,y,mm(3.6),0)
 end

 def screw(x,y)
  spyrtub(x,y,mm(1.5),0)
 end


 def boxo()  
  w = @width/2.0
  h = @heigh/2.0


  
  @curxo=@starx+mm(w)
    if (@xarg==0) then
    JAX(dx(-42),dy(-100))
    JAX(dx(-14),dy(-100))
      POW(dx(14),dy(-100))
        POT(dx(42),dy(-100))
      end
  @myOkuda = Okuda.new(@curxo,@stary,mm(@width)+$bitwidth,mm(@heigh)+$bitwidth,0.02)
  @curxo=dx(w)
  return  @curxo

 end
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoydeluxe(-@depth,1.0,10,30, [], [])
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01

 xarg = 0
 unless ARGV[0].nil? then xarg = Integer(ARGV[0]) end

  broth = Shplorer.new(xarg)
  broth.boxo()
  broth.ducabot()
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"

