
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
  if xarg==1 then @width=19.55#*2.0
  else @width=11.55 end #*2.0 end
  if xarg==1 then @heigh=12.55/2.0
  else @heigh=11.55/2.0 end  
  @xarg = xarg
  @yarg=yarg

  super(0, 0)
 end

 @@fatty = 4.25
 def parabol(x,m,w,s)
   y = s*2*(x**2-@@fatty)
   cutoPoint(dx(m-s*x*w),dy(y))
 end
 def ducabot(m,w,s) 
  numzegs=64
  for i in -numzegs..numzegs 
   x = i/Float(numzegs)
   parabol(x,m,w,s)
  end
 end

#   ducabot(x,-x-1,-f)
#   ducabot(x,-x-5,f)
#    parabol(-1,x,x+5,f)


  def ducabot(m,w,s) 
   y=s*2*(1-@@fatty)
   x=m-s*w
   #parabol(-1,@width/2.0,w,s)
      cutoPoint(dx(@width/2.0+s*w),dy(y))

   printf "G3 X%5.5f Y%5.5f I%5.5f J%5.5f\n", 
   dx(x), dy(y), cmil(-s*w), -s*cmil(-w**2/4-1)
  end

 def boxo() 
  w = @width/2.0
  x = w
  h = @heigh
  dd=-0.23
@curxo=-0.7
@curxo=1
 @stary=cmil(1-@yarg*2)/6.28
  if (@yarg==0) then
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
  if (@yarg==1) then
#    drillus(dx(x),dy(0),0,cmil(0.3),-@depth)
    spyrtub(dx(x),dy(0),cmil(6.6/2.0),0)
  end
  @stary=0

  retrax 0.1
 # skimtoPoint(dx(0),dy(0),0.1)
  nuz = 0
  tier = @depth / 4.0
  nuz -= tier
  f=2*@yarg-1
  parabol(-1,x,x+3,f)
  penetrate(nuz)
  while (nuz >= -@depth) do
   penetrate(nuz)
   ducabot(x,-x-1,-f)
   ducabot(x,-x-3,f)
    parabol(-1,x,x+3,f)
   nuz -= tier

  end

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


