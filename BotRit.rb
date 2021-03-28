
module BotRit
  $bitwidth = 0.125
 $halfwidth = $bitwidth/2
 TIERATE = 0.12

 def drawzframe(minx,miny,maxx,maxy)
  dwellus(0.1)
  if minx > maxx then minx = maxx = (minx+maxx)/2 end
  if miny > maxy then miny = maxy = (miny+maxy)/2 end
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
  drawzframe(minx,miny,maxx,maxy)
  while (minx < maxx) and (miny < maxy) 
   
   minx += $bitwidth 
   miny += $bitwidth
   maxx -= $bitwidth
   maxy -= $bitwidth
   drawzframe(minx,miny,maxx,maxy)
  end
  midx = (minx + maxx) / 2
  #cutoPoint(midx,maxy)
  #cutoPoint(midx,miny)
 end
 
 def box(minx,miny,maxx,maxy,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(minx+$halfwidth,miny+$halfwidth,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   drawzsquare(minx,miny,maxx,maxy)
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
end
