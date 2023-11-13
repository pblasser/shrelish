
require './PlumPott.rb'
 $bitwidth = 2.0/25.4
$halfwidth = $bitwidth/2.0

class NobNob < PlumPott
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = mm(50.0)
  @heigh = @width
  @depth = mm(5.2)
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end
 def mm(m)
  return m/25.4
 end

 def joffdisque(x,y,r,z)
  r -= $halfwidth
  while r > mm(5.0)
   drawzcirque(x,y,r,z)
   r -= $bitwidth
  end
 end

 def turbojoff(x,y,r,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(x+r-$halfwidth,y,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   joffdisque(x,y,r,zstart + (incro * i))
   
  end
 end

 def joff(x,y,r)

 #box(x-mm(5.0),y-mm(2.0),x+mm(5.0),y+mm(2.0),0,-mm(1.0),1)
 drillus(x,y,0,-@depth)
 #turbojoff(x,y,@width,0,-mm(2.0),1)
  spyrtub(x,y,@width,0.001)
end
 def boxo()
 joff(0,0,@width)
end

 def ducatop
 end
 def ducabot
 end
 def duxo
 return 0 end
end
stutterat(NobNob)