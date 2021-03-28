
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
  w = 4.5#3
  h = 3.0#3
  x = 8
  drillus(dx(8-w),dy(-h),0,-0.15)
  drillus(dx(8-w),dy(h),0,-0.15)
  drillus(dx(8+w),dy(h),0,-0.15)
  drillus(dx(8+w),dy(-h),0,-0.15)
  box(dx(8-w),dy(-h),dx(8+w),dy(h),0,-0.15,1)
  pipe(dx(x-0.75),dy(0),cmil(1),-0.15,-0.45)
  pipe(dx(x+0.75),dy(0),cmil(1),-0.15,-0.45)
  tubo(dx(x-4),dy(0),cmil(0.5),-0.15,-0.22,1)
  dux(dx(x-4),dy(0),dx(x-3),dy(0),-0.15,-0.22,1)
  tubo(dx(x+4),dy(0),cmil(0.5),-0.15,-0.22,1)
  dux(dx(x+3),dy(0),dx(x+4),dy(0),-0.15,-0.22,1)
 end

 
 def flipmark()
  drillus(0,0,0,-@depth)
  retrax(0.5)
  dwellus(60)
 end
 def boxo()
  for i in 0..2 do
   drillus(dx(i*13+1),dy(-3),0,-@depth)
   drillus(dx(i*13+1),dy(3),0,-@depth)
  end
  spyrtub(dx(22),dy(0),0.25+$bitwidth,0.25+$bitwidth)
  box(dx(1),dy(-3),dx(1+2),dy(3),0,-0.15,1)
  box(dx(27-2),dy(-3),dx(27),dy(3),0,-0.15,1)
  box(dx(1),dy(-1.5),dx(1+2),dy(1.5),-0,-0.480,4)
  fox(dx(1+2),dy(-3),dx(27-2),dy(3),0,-@depth,6)
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
  @myOkuda.bokchoydeluxe(-0.8,1.0,24,10,topnuys,botnuys)
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

stutterat(Tocante)