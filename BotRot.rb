
require './BotRit.rb'

module BotRot
 include BotRit
 NUMSEGS = 32



 def drawzcirque(x,y,r)
  numsegs = Integer(r*32+1)
  for i in 0..NUMSEGS do
   xx = r * Math.sin(2 * i * Math::PI / NUMSEGS)
   yy = r * Math.cos(2 * i * Math::PI / NUMSEGS)
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

 def tubo(x,y,r,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(x,y,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   drawzdisque(x,y,r)
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
 def drawzare(x,y,r)
  numsegs = Integer(r*32+1)
  for i in 0..NUMSEGS do
   yy = r * Math.sin(i * Math::PI / NUMSEGS)
   xx = r * Math.cos(i * Math::PI / NUMSEGS)
   cutoPoint(x+xx,y+yy)
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
 def drawzrun(x,y,r)
  if (r<0) then
   r += $halfwidth
   while r < 0
    drawzare(x,y,r)
    r += $bitwidth
   end
  else 
   r -= $halfwidth
   while r > 0
    drawzare(x,y,r)
    r -= $bitwidth
   end
  end
 end
 def lune(x,y,r,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(x,y,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   drawzlun(x,y,r)
  end
 end
 def rune(x,y,r,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(x,y,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   drawzrun(x,y,r)
  end
 end
end
