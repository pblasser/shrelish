

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
def omron_side(x,y,r)
  #shallot(dx(y),dy(x),-1)
 end

 def omron(x,y,r)
  fox(dx(y-7.5),dy(x+7.5),dx(y+7.5),dy(x-7.5),0,-@depth,4)
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

   def led(x,y,r)
   tubo(dx(y),dy(x),mm(6),0,-0.05,1)
   spyrtub(dx(y),dy(x),mm(5),0)
   
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
  elsif (@xarg==2) then
   tubo(dx(w),dy(0),cmil(3.5),0,-0.25,2)
   for i in 0..5 do
    x = dx(w+20*Math.cos(2*i*Math::PI/6))
    y = dy(20*Math.sin(2*i*Math::PI/6))
    pipe(x,y,0.3,0,-@depth)
   end
   pipe(dx(w),dy(0),0.3,0,-@depth)
  else
    @curxo=dx(10)

omron_side(13,0,0)
omron(0,6.5,0)
screw(27,6,0)
balpspot(27,18,135)
JOHNSON(39,9,0)
balpspot(0,63,135)
JOHNSON(0,84,0)
balpspot(27,72,135)
JOHNSON(39,81,0)
screw(27,84,0)
balpspot(-18,45,135)
JOHNSON(-35.4209,42.87299,-6)
JOHNSON(-38.86525,31.42022,-6)
led(0,45,0)
JOHNSON(-39,63,0)
balpspot(-27,72,135)
screw(-27,84,0)
JOHNSON(-39,81,0)
JOHNSON(-27.42719,33.60718,-6)
balpspot(-27,18,135)
screw(-27,6,0)
omron_side(-13,0,0)
balpspot(18,45,135)
JOHNSON(35.14946,41.63133,10)
JOHNSON(27.13615,32.93424,10)
JOHNSON(38.70401,30.44284,10)
JOHNSON(39,63,0)
balpspot(0,27,135)
JOHNSON(-39,9,0)
KOBICONDC(-13,90,-90)
KYCONMINIJACK(13,90,0)

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

