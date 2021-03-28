
require './Jacksloon.rb'
require './Okuda.rb'
require './plumbENGRAVE/cornuSZILK.rb'

class CornuPowBord < Jacksloon
 MARJ = 0.00
 $bitwidth = 0.9/25.4
 $halfwidth = $bitwidth/2
 @@numero = 0
 def initialize(starx, stary)
  @width = 6
  @heigh = 1 ###1.95 ####wasz 2!!!
  @depth = 0.08
  @@lipp = 0.0
  @zstep = 2
  super(starx, stary)
 end
 def rectangle(minx,miny,maxx,maxy,deptg)
  skimtoPoint(minx-$halfwidth,miny-$halfwidth,0.1)
  penetrate(0-deptg)
  drawzframe(minx-$halfwidth,
  miny-$halfwidth,
  maxx+$halfwidth,
  maxy+$halfwidth)
 end
  def grancirque(x,y,xr,yr)
  xr -= $halfwidth
  yr -= $halfwidth
  numsegs = Integer(xr*32+1)
  for i in 0..NUMSEGS do
   xx = xr * Math.sin(2 * i * Math::PI / NUMSEGS)
   yy = yr * Math.cos(2 * i * Math::PI / NUMSEGS)
   cutoPoint(x+xx,y+yy)
  end
 end
 def grantubo(x,y,xr,yr,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(x,y,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   grancirque(x,y,xr,yr)
  end
 end
 def powtube(x,y)
  grantubo(x,y,0.138/2,0.138/2,0,-@depth,2)
 end
 def screwtube(x,y)
  grantubo(x,y,0.125/2,0.125/2,0,-@depth,2)
 end
 def staretube(x,y)
  grantubo(x,y,0.081/2,0.081/2,0,-@depth,2)
 end
 def starestud(x,y)
  grantubo(x,y,0.093/2,0.093/2,0,-@depth,2)
 end
 def boxo()
  @curxo += MARJ
  widochub = @width/2
  staretierwon = 0.252
  staretiertwo = 0.448
  staretiermid = (staretierwon + staretiertwo)/2
  
  starestud(@curxo+staretierwon,@stary+0.197)
  staretube(@curxo+staretierwon,@stary)
  starestud(@curxo+staretierwon,@stary-0.197)
  
  staretube(@curxo+staretiertwo,@stary+0.197)
  staretube(@curxo+2.5,@stary+0.197)
  rectangle(@curxo+0.368,@stary+0.117,@curxo+2.6,@stary+0.277,0.01)
  
  starestud(@curxo+staretiertwo,@stary)
  
  staretube(@curxo+staretiertwo,@stary-0.197)
  staretube(@curxo+2.5,@stary-0.197)
  rectangle(@curxo+0.368,@stary-0.277,@curxo+2.6,@stary-0.117,0.01)
  
  screwtube(@curxo+0.25,@stary-0.35)
  screwtube(@curxo+0.25,@stary+0.35)
  
  staretube(@curxo+3,@stary)
  
  powtube(@curxo+5.461,@stary)
  powtube(@curxo+5.577,@stary-0.193)
  powtube(@curxo+5.697,@stary)
  staretube(@curxo+3.5,@stary)
  rectangle(@curxo+3.4,@stary-0.1,@curxo+5.5,@stary+0.1,0.01)
  
  screwtube(@curxo+5.75,@stary-0.35)
  screwtube(@curxo+5.75,@stary+0.35)
  
  for i in 1..3
  rectangle(@curxo,@stary-@heighchub,@curxo+@width,@stary+@heighchub,@depth*i/3)
  end
  retract
  
  @curxo += @width /2
  #@myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.3)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
 def ducatop
 end
 def ducabot
  #@myOkuda.bokchoy(-@depth,1.0)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end

stutterat(CornuPowBord)