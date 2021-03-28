
class Bot
 $bitwidth = 0.125
 $halfwidth = $bitwidth/2
 TIERATE = 0.12
 @@pentrate = 30
 @@feedrate = 40
 
 def initialize()
  @xarg = @yarg = 1 
  unless ARGV[0].nil? then @yarg = Integer(ARGV[0]) end
  unless ARGV[1].nil? then @xarg = Integer(ARGV[1]) end
  @xplankus = $bitwidth + (@width +  $bitwidth) * @xarg
  @yplankus = $bitwidth + (@heigh +  $bitwidth) * @yarg
  @yplankus /= 2.0
  @heighchub = @heigh / 2.0 
  @duxulate =Integer(@depth / TIERATE)
 end
 def retrax(z)
  printf "G0 Z%5.3f\n",z
 end
 def retract
  retrax(0.1)
 end
 def penetrate(z)
  printf "G1 Z%5.3f F%d\n", z, @@pentrate
 end
 def cutoPoint(x,y)
  printf "G1 X%5.3f Y%5.3f F%d\n", x, y, @@feedrate
 end
 def skimtoPoint(x,y,z)
  retrax(z)
  printf "G0 X%5.3f Y%5.3f\n", x, y
 end
 def gotoPoint(x,y)
  skimtoPoint(x,y,0.1)
 end
 def dwellus(tparm)
  printf "G4 P%5.3f \n",tparm
 end
 def drillus(x,y,zstart,zdepth)
  skimtoPoint(x,y,zstart+0.1)
  penetrate(zdepth)
  dwellus(0.5)
 end
 def drawzframe(minx,miny,maxx,maxy)
  dwellus(0.1)
  cutoPoint(minx,miny)
  cutoPoint(minx,maxy)
  cutoPoint(maxx,maxy)
  cutoPoint(maxx,miny)
  cutoPoint(minx,miny)
 end
 def drawzsquare(minx,miny,maxx,maxy)
  minx += $halfwidth
  miny += $halfwidth
  maxx -= $halfwidth
  maxy -= $halfwidth
  #drawzframe(minx,miny,maxx,maxy)
  while (minx < maxx) and (miny < maxy) 
   drawzframe(minx,miny,maxx,maxy)
   minx += $bitwidth 
   miny += $bitwidth
   maxx -= $bitwidth
   maxy -= $bitwidth
   
  end
 end
 def dux(starx,stary,dendx,dendy,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(starx,stary,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   if  (i.divmod(2)[1] != 0) then
    cutoPoint(dendx, dendy) else
    cutoPoint(starx, stary) end
  end
 end

 def box(minx,miny,maxx,maxy,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(minx+$halfwidth,miny+$halfwidth,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   drawzsquare(minx,miny,maxx,maxy)
  end
 end   

 NUMSEGS = 32
 def drawzcirque(x,y,r)
  numsegs = Integer(r*32+1)
  for i in 0..NUMSEGS do
   xx = r * Math.sin(2 * i * Math::PI / NUMSEGS)
   yy = r * Math.cos(2 * i * Math::PI / NUMSEGS)
   cutoPoint(x+xx,y+yy)
  end
 end
 def drawzarc(x,y,r)
  numsegs = Integer(r*32+1)
  for i in 0..NUMSEGS do
   xx = r * Math.sin(i * Math::PI / NUMSEGS)
   yy = r * Math.cos(i * Math::PI / NUMSEGS)
   cutoPoint(x+xx,y+yy)
  end
 end
 def drawzdisque(x,y,r)
  r -= $halfwidth
  while r > 0
   drawzcirque(x,y,r)
   r -= $bitwidth
  end
 end
 def drawzlun(x,y,r)
  if (r<0) then
   r += $halfwidth
   while r < 0
    drawzarc(x,y,r)
    r += $bitwidth
   end
  else 
   r -= $halfwidth
   while r > 0
    drawzarc(x,y,r)
    r -= $bitwidth
   end
  end
 end
 def tubo(x,y,r,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(x,y,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   drawzdisque(x,y,r)
  end
 end
 def luno(x,y,r,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(x,y,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   drawzlun(x,y,r)
  end
 end
 def weirdsignale(minx, miny, maxx, maxy, zstart, zdepth)
  margin = 0.25
  da = (Math::PI * 2) / (NUMSEGS)  
  centerptx = (minx + maxx) / 2
  centerpty = (miny + maxy) / 2
  scalex = centerptx - minx - margin
  scaley = centerpty - miny - margin

  for i in 0..(NUMSEGS-1) do
   angle = i * da
   if ((i.divmod(4)[1]) < (1.0)) then weirdscale = 1.5
   else weirdscale = 1 end
   cosa = (Math.cos(angle) * (i.divmod(2)[1]+1) / 2)
   sina = (Math.sin(angle) * (i.divmod(2)[1]+1) / 2)
   cosa = (cosa * scalex * weirdscale) + centerptx
   sina = (sina * scaley * weirdscale) + centerpty
   drillus(cosa,sina,zstart,zdepth) 
  end
 end
 def duxo(startx, starty)
  dux(startx+$halfwidth, starty-@heighchub, startx+$halfwidth, starty+@heighchub, 0, 0-@depth, @duxulate)
  return startx+$bitwidth
 end
 def londux(curyo)
  dux(0, curyo-$halfwidth, 0.5+@xplankus, curyo-$halfwidth, 0, 0-@depth, @duxulate)
 end
 def stutterat()
  curyo = @yplankus
  for i in 1..@yarg do
   curyo -= $bitwidth
   curyo -= @heighchub
   if (i%2) == 0 
	curxo = 0
   else curxo = 0.5 end
   curxo = duxo(curxo,curyo)
   for j in 1..@xarg do
    curxo = boxo(curxo,curyo)
    curxo = duxo(curxo,curyo)
   end
   curyo -= @heighchub
  end
 end
 def londucate()
  curyo = @yplankus
  londux(curyo)
  for i in 1..@yarg do
   curyo -= $bitwidth
   curyo -= @heighchub
   curyo -= @heighchub
   londux(curyo)
  end
 end
end
