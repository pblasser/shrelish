

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
  @width = 135
  @heigh = 300
  @depth = mm(7)
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


  @curxo=@starx+mm(w)
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

