
require './Jacksloon.rb'
require './Okuda.rb'
require './Curxuda.rb'



class Shplorer < Jacksloon
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
 def initialize(xarg,yarg)
  if xarg==0 then @width=11.55#*2.0
  else  @width=19.55 end #*2.0 end
  if xarg==0 then @heigh=11.55/2.0
  else @heigh=12.55/2.0 end  
  @xarg = xarg
  @yarg=yarg

  super(0, 0)
 end

 @@fatty = 4.25


 def boxo() 
  w = @width/2.0
  x = w
  h = @heigh
  dd=-0.25
@curxo=-0.7
@curxo=1+cmil((@xarg-1)*20)
 @stary=cmil(1-@yarg*2)/6.28
  if (@yarg==0) then
    xxx=@xarg or 1

   for i in 1..xxx do
    @curxo=1+cmil((i-1)*21)+cmil((xxx-1)*9)
    drillus(dx(x-w),dy(-h),0,dd)
    drillus(dx(x-w),dy(h),0,dd)
    drillus(dx(x+w),dy(h),0,dd)
    drillus(dx(x+w),dy(-h),0,dd)
    box(dx(x-w),dy(-h),dx(x+w),dy(h),0,dd,2)
    y =(5.9/2)
  #fox(dx(x-w),0-y,dx(x+w),y,-0.125,-0.25, 1)
    if @xarg>0 then  
      y =5.9/2
    else y = 5.4/2 end
    cw = w-0.5
    tubo(dx(x-cw),dy(-y),cmil(0.5),dd,dd-0.125,1)
    dux(dx(x-cw),dy(-y),dx(x-cw)+0.5,dy(-y),dd,dd-0.125,1) 

    tubo(dx(x-cw),dy(y),cmil(0.5),dd,dd-0.125,1)
    dux(dx(x-cw),dy(+y),dx(x-cw)+0.5,dy(+y),dd,dd-0.125,1) 

    tubo(dx(x+cw),dy(y),cmil(0.5),dd,dd-0.125,1)
    dux(dx(x+cw),dy(+y),dx(x+cw)-0.5,dy(+y),dd,dd-0.125,1)

    tubo(dx(x+cw),dy(-y),cmil(0.5),dd,dd-0.125,1)
    dux(dx(x+cw),dy(-y),dx(x+cw)-0.5,dy(-y),dd,dd-0.125,1)
   

   #x = dx(x+w)
   y = 0.5
   if @xarg>0 then
    fox(dx(x+w-4),0-y,dx(x+w-2),y,dd,-@depth, 2)
   else 
     fox(dx(x-3),0-y,dx(x+3),y,dd,-@depth, 2)
   end
 end
  @curxo-=cmil((xxx-1)*11)
  end
  if (@yarg==1) then
#    drillus(dx(x),dy(0),0,cmil(0.3),-@depth)
    spyrtub(dx(x),dy(0),cmil(6.6/2.0),0)
  end
  @stary=0

  
  ss=-2*@yarg+1
  ff=cmil(6.5)*ss
  mi=cmil(x+1+(@xarg-1)*20)*ss
  ma=cmil(x+3+(@xarg-1)*20)*ss
  puff=1.2
  ptoo=puff*2
  psqu=puff**2
  mih=cmil((x+1+(@xarg-1)*20)**2/ptoo-psqu/ptoo)
  mah=cmil((x+3+(@xarg-1)*20)**2/ptoo-psqu/ptoo)
  Curxuda.new(

   cmil(w)+@curxo,0,@depth,
   [#[-ma,ff],
   [-mi,-ff],
   [mi,-ff,-mih],
   [ma,ff],
   [-ma,ff,-mah]
   ]).bok()



  @curxo += x*2
  return @curxo
 end


 def duxo
 @curxo += $bitwidth
  return @curxo
 end
end

$rimmer = 0.01

 xarg = 0
 yarg = 0
 unless ARGV[0].nil? then xarg = Integer(ARGV[0]) end
 unless ARGV[1].nil? then yarg = Integer(ARGV[1]) end
  broth = Shplorer.new(xarg,yarg)
  broth.boxo()
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"


