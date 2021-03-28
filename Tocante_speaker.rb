
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
  @width = cmil(28)
  @heigh = cmil(8)
  @depth = 0.8
  super(starx, stary)
 end
 def flip()
 
 end
 def flipmark()
  drillus(0,0,0,-@depth)
  retrax(0.5)
    printf("m 0 \n")#dwellus(60)
 end
 def boxo()

  tubo(dx(0),dy(0),1.306,0,-0.55,4)
  for i in 0..5 do
   ii = i+0.5
   x = dx(0) + (Math.cos(2*ii*Math::PI/6) * 0.8)
   y = dy(0) + (Math.sin(2*ii*Math::PI/6) * 0.8)
   pipe(x,y,0.3,-0.55,-@depth)
  end

  return @curxo
 end
 def ducatop
 end
 def ducabot

 end
 def duxo
 @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01

def flipperat(clasz)
 xarg = yarg = 1
 unless ARGV[0].nil? then yarg = Integer(ARGV[0]) end
 unless ARGV[1].nil? then xarg = Integer(ARGV[1]) end
 broth = clasz.new(0,0).getBrot + $rimmer
 curyop = (yarg-1)*broth
 curxo = $bitwidth
 mystuff = clasz.new(curxo,0)
 #curxo = mystuff.duxo()
 for i in 1..xarg do
  curyo = curyop
  for j in 1..yarg do
   mystuff = clasz.new(curxo,curyo)
   mystuff.flip()
   curyo -= broth*2
  end
  curxo = mystuff.duxo() + $rimmer*2
 end
 mystuff.flipmark()
 curxo = $bitwidth
 for i in 1..xarg do
  if i == 1 then mystuff.numerize end
  curyo = curyop
  for j in 1..yarg do
   mystuff = clasz.new(curxo,curyo)
   mystuff.boxo()
   mystuff.ducabot()
   curyo -= broth*2
  end
  curxo = mystuff.duxo() + $rimmer*2
 end
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"
end

flipperat(Tocante)