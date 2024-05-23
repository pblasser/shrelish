
require './Jacksloon.rb'
require './Okuda.rb'

 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2

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
  @wcent=19
  @width = cmil(@wcent)
  @heigh = cmil(13)
  #@depth = 0.8
  super(starx, stary)
 end
 def flip()
  w = 4.5#3
  h = 3.0#3
  x = @wcent/2
  dils = -0.125
  drillus(dx(x-w),dy(-h),0,dils)
  drillus(dx(x-w),dy(h),0,dils)
  drillus(dx(x+w),dy(h),0,dils)
  drillus(dx(x+w),dy(-h),0,dils)
  box(dx(x-w),dy(-h),dx(x+w),dy(h),0,dils,1)
  pipe(dx(x-0.75),dy(0),cmil(1),dils,-0.45)
  pipe(dx(x+0.75),dy(0),cmil(1),dils,-0.45)
  tubo(dx(x-4),dy(0),cmil(0.5),dils,-0.22,1)
  dux(dx(x-4),dy(0),dx(x-3),dy(0),dils,-0.22,1)
  tubo(dx(x+4),dy(0),cmil(0.5),dils,-0.22,1)
  dux(dx(x+3),dy(0),dx(x+4),dy(0),dils,-0.22,1)
 end
 def fux()
  return @curxo + @width + $bitwidth
 end
 def flipmark()
  drillus(0,0,0,-@depth)
  drillus(fux(),0,0,-@depth)
  retrax(0.5)
    printf "G0 X0 Y0 \n"
    #printf("M 0 \n")#dwellus(60)
 end
 def boxo()
  chubthick=1.3
  panethick=0.5
  frame=1
  wframe=@wcent-frame
  x=@wcent/2
  box(dx(frame),dy(-5.5)-$halfwidth,dx(frame+chubthick),dy(5.5)+$halfwidth,0,cmil(-0.5),2)
  box(dx(frame+chubthick),dy(-5.5),dx(wframe-chubthick),dy(-5.5+panethick),0,cmil(-0.5),2)
  drillus(dx(x-5.5),0,0,-@depth)
  drillus(dx(x+5.5),0,0,-@depth)
  box(dx(frame+chubthick),dy(5.5-panethick),dx(wframe-chubthick),dy(5.5),0,cmil(-0.5),2)  
  box(dx(wframe-chubthick),dy(-5.5)-$halfwidth,dx(wframe),dy(5.5)+$halfwidth,0,cmil(-0.5),2)
  

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

def flipperat(clasz)
 xarg = yarg = 1
 unless ARGV[0].nil? then yarg = Integer(ARGV[0]) end
 unless ARGV[1].nil? then xarg = Integer(ARGV[1]) end
 process=3
 unless ARGV[2].nil? then process = Integer(ARGV[2]) end
 

  broth = clasz.new(0,0).getBrot + $rimmer
  curyop = (yarg-1)*broth
  curxo = $bitwidth
  mystuff = clasz.new(curxo,0)
  #curxo = mystuff.duxo()
 if (process&1)>0 then 
  for i in 1..xarg do
   curyo = curyop
   for j in 1..yarg do
    mystuff = clasz.new(curxo,curyo)
    mystuff.flip()
    curyo -= broth*2
   end
   curxo = mystuff.fux() + $rimmer
  end
  mystuff.flipmark()
 end
 if (process&2)>0 then
 
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
   curxo = mystuff.duxo() + $rimmer
  end
  printf "G0 Z0.5\n"
  printf "G0 X0 Y0 \n"
 end
end
unless ($penisbreath) then flipperat(Tocante) end