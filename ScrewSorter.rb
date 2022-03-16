
require './Jacksloon.rb'
require './Okuda.rb'



class Tocante < Jacksloon
#MARJ = 0.42
@@lipp = 0.00
 def cmil(cm)
  return cm/2.54
 end
 def dy(y)
  return @stary+cmil(y)
 end
 def dx(x)
  return @curxo+cmil(x)
 end
 def initialize(starx, stary)
  @width = cmil(31)
  @heigh = cmil(10)
  @depth = 0.8
  super(starx, stary)
 end

 def boxo()
  h=7.6/2.0
  s=1
  c=lambda(){
   box(dx(s), dy(-h) , dx(s+4), dy(h), 0, -0.375, 3)
   box(dx(s), dy(h-0.7) , dx(s+4), dy(h), -0.375, -0.5, 1)
   box(dx(s), dy(-h) , dx(s+4), dy(-h+0.7), -0.375, -0.5, 1)
  }
  #c.call()

  h=7.6/2.0
  s=1
  c=lambda(){
   box(dx(s), dy(-h) , dx(s+9), dy(h), 0, -0.375, 3)
   box(dx(s), dy(h-0.7) , dx(s+9), dy(h), -0.375, -0.5, 1)
   box(dx(s), dy(-h) , dx(s+9), dy(-h+0.7), -0.375, -0.5, 1)
  }
  c.call()


  h=7.1/2.0
  s=11
  c.call()

  h=6.6/2.0
  s=21
  c.call()

  
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+$bitwidth,@heigh+$bitwidth,cmil(1))
  @curxo += @width /2
  return @curxo
 end
 def ducatop
 end
 def ducabot
  topnuys = []
  botnuys = []#[33-11,33-3],[33-19,33-16]]
  @myOkuda.bokchoydeluxe(-@depth,1.0,24,10,topnuys,botnuys)
 end
 def duxo
 @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01

 stutterat(Tocante) 