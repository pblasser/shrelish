

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
  return @stary+mm(-y)
 end
 def dx(x)
  return @curxo+mm(x)
 end
 def initialize(xarg)
  @width = 110
  @heigh = 110
  @depth = 0.55
  @xarg=xarg
  super($halfwidth,0)
 end

 def KYCON5P(x,y,r)
  
  #shallot(dx(y),dy(x),1)
 end
 def KYCONMINIJACK(x,y,r)
  #shallot(dx(y),dy(x),-1)
 end
 def KOBICONDC(x,y,r)
  #shallot(dx(y),dy(x),-1)
 end
 def JOHNSON(x,y,r)
  johnson(dx(y),dy(x))
 end
 def balpspot(x,y,r) 
  r=r
  alpspot(dx(y),dy(x),180+r)
 end
 def screw(x,y,r)
  drillus(dx(y),dy(x),0,-0.25)
 end


 def boxo()  
  w = @width/2.0
  h = @heigh/2.0
  x = w 
  if(@xarg==0) then
   drillus(dx(w-40),dy(-40),0,-0.25)
   drillus(dx(x-40),dy(+40),0,-0.25)
   drillus(dx(x+40),dy(+40),0,-0.25)
   drillus(dx(x+40),dy(-40),0,-0.25)
   for i in 0..5 do
    x = dx(w+30*Math.cos(2*i*Math::PI/6))
    y = dy(30*Math.sin(2*i*Math::PI/6))
    pipe(x,y,0.4,0,-@depth)
   end
   #pipe(dx(w),dy(0),cmil(1.85),0,-@depth)
   tubo(dx(w),dy(0),cmil(1.85),0,-0.25,2)
   pipe(dx(w),dy(0),0.4,0,-@depth)
  else
    @curxo=dx(5)
  KYCON5P(0,0,180)
balpspot(30,20,135)

screw(44,6,0)
JOHNSON(44,30,0)
balpspot(0,70,135)
balpspot(30,80,135)
JOHNSON(44,70,0)
screw(44,94,0)
JOHNSON(30,94,0)
KYCONMINIJACK(15,100,0)
balpspot(20,50,135)
balpspot(0,30,135)
balpspot(-20,50,135)
JOHNSON(-44,70,0)
screw(-44,94,0)
JOHNSON(-30,94,0)
balpspot(-30,80,135)
balpspot(-30,20,135)
screw(-44,6,0)
JOHNSON(-30,6,0)
JOHNSON(-44,30,0)
JOHNSON(-44,50,0)
KOBICONDC(-15,100,-90)
JOHNSON(44,50,0)
  end

  @curxo=@starx+mm(w)
  @myOkuda = Okuda.new(@curxo,@stary,mm(@width)+$bitwidth,mm(@heigh)+$bitwidth,0.02)
  @curxo=dx(w)
  return  @curxo

 end
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoydeluxe(-@depth,1.0,10,10, [], [])
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

