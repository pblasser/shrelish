
#require './PlumPott.rb'
require './Jacksloon.rb'
require './Okuda.rb'
class Plate < Jacksloon

 $bitwidth = 0.125
 $halfwidth = $bitwidth/2
 #because plumpott is 2mm
 MARJ = 0.0 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 12 #6.0
  @heigh = 9.4
  @depth = 1.00 #0.75 #0.55
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end



  def ddrawzframe(x,y)
  cutoPoint(-x,-y)
  cutoPoint(-x,y)
  cutoPoint(x,y)
  cutoPoint(x,-y)
  cutoPoint(-x,-y)
 end
 def odrawzframe(x,y,r)
  cutoPoint(-x,-y+r)
  cutoPoint(-x,y-r)
  printf "G2 X%5.3f Y%5.3f I%5.3f J%5.3f  F%d\n", -x+r, y, r, 0,  @@feedrate
  cutoPoint(x-r,y)
  printf "G2 X%5.3f Y%5.3f I%5.3f J%5.3f  F%d\n", x, y-r, 0, -r,  @@feedrate
  cutoPoint(x,-y+r)
  printf "G2 X%5.3f Y%5.3f I%5.3f J%5.3f  F%d\n", x-r, -y, -r, 0,  @@feedrate
  cutoPoint(-x+r,-y)
  printf "G2 X%5.3f Y%5.3f I%5.3f J%5.3f  F%d\n", -x, -y+r, 0, r,  @@feedrate
 end
 def odrawzsquare(x,y,r)
  x -= $halfwidth
  y -= $halfwidth
  #r -= $halfwidth
  odrawzframe(x,y,r)
  while (x>0) and (y>0) 
   x -= $bitwidth
   y -= $bitwidth
   r-= $bitwidth
   if (r>0) then odrawzframe(x,y,r)
   else ddrawzframe(x,y)
   end
  end
 end

 def obox(x,y,r,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(-x+$halfwidth,-y+$halfwidth+r,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   odrawzsquare(x,y,r)
  end
 end   
 
 def boxo()
  obox(@width/2-0.5,@heigh/2-0.5,0.5,0,-0.5,4)
  @myOkuda = Okuda.new(0,0,@width+$bitwidth,@heigh+$bitwidth,1.0)
 end
 
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoy(-@depth,1.0,16,16)
 end
 def numerize
  unless ARGV[2].nil? then @@numero = Integer(ARGV[2]) end
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01
stutterat(Plate)