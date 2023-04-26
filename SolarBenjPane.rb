

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
 def dy(y)
  return @stary+mm(y)
 end
 def dx(x)
  return @curxo+mm(x)
 end
 def initialize(starx,stary)
  
   @width = mm(140)
    @xarg=PAINSWITCH
    if (@xarg==0) then
  @heigh = mm(30)
   else @heigh = mm(250)
   end
  @depth = mm(7)
  
  super(starx,stary)
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
  #pipe(x,y,1.0/14,0,-@depth)
  spyrtub(x,y,1/14.0,0)
  #drillus(x,y,0,-@depth)
 end


 def boxo()  
  w = @width/2.0
  h = @heigh/2.0


  
  @curxo=@starx+w
    if (@xarg==0) then
      #screw(dx(-123/2),dy(0))

    JAX(dx(-42),dy(-00))
    JAX(dx(-14),dy(-00))
      POW(dx(14),dy(-00))
        POT(dx(42),dy(-00))
        #screw(dx(123/2),dy(0))
    else
      for i in -4..4
       screw(dx(-123/2),dy(220*i/8))
       screw(dx(123/2),dy(220*i/8))
      end
        #screw(dx(-123/2),dy(-220/2))
         #screw(dx(123/2),dy(220/2))
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

 xarg = 0
$rimmer = 0.01
stutterat(Shplorer) 
