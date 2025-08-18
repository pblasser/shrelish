
require './Bot.rb'

class Jacksloon < Bot
attr_accessor :batdepth
 def initialize(starx, stary)
 @zstep = 4
 @magic = 0.023
 @bronk = 0.128
   @depth = 0.55
   
  super(starx, stary)
 end
  NUMSEGS = 32
 def cutoPointDeepo(x,y,z)
  if z < -@depth then z = -@depth end
  printf "G1 X%5.5f Y%5.5f Z%5.5f\n", x, y, z
 end
  def johnson(x,y)
  spyrtub(x,y,5.0/32,0.15/32)
  #pipe(x,y,5.1/32,0,-@depth)
 end
  def yarc(x,y,z,r,s)
  if $DEBUG then
   printf "G2 X%5.5f Y%5.5f I%5.5f J%5.5f Z%5.5f\n", 
   x+s, y-r, x+s, y, z
  else
   printf "G2 X%5.5f Y%5.5f I%5.5f J%5.5f Z%5.5f\n", 
   x+s, y-r, 0, -r, z
  end
 end
 
  def spyrtub(x,y,r,stretch)
  r -= $halfwidth
  skimtoPoint(x+stretch,y+r,0.1)
  penetrate(0)
  z = 0
  incro = 0.075
  while z > (-@depth - incro) do
   
   z -= incro
   ee = z   
   if (z < -@depth) then ee = -@depth end
   yarc(x,y,ee,r,stretch)
   #printf "G2 X%5.5f Y%5.5f I%5.5f J%5.5f Z%5.5f\n", x+stretch, y-r, 0, -r, ee, @@feedrate
   cutoPointDeepo(x-stretch,y-r,ee)
   z -= incro
   ee = z   
   if (z < -@depth) then ee = -@depth end
   
   yarc(x,y,ee,-r,-stretch)
   #printf "G2 X%5.5f Y%5.5f I%5.5f J%5.5f Z%5.5f\n", x-stretch, y+r, 0, r, ee, @@feedrate
   cutoPointDeepo(x+stretch,y+r,ee)
  end
  yarc(x,y,ee,r,stretch)
  
  #oldspyrtub(x,y,xr,yr)
   #pipe(x,y,xr,0,-@depth)
  end
 def oldspyrtub(x,y,xr,yr)
  skimtoPoint(x,y,0.1)
  xr -= $halfwidth
  yr -= $halfwidth
  i = 0
  z = 0
  incro = (Float(@depth) / Float(@zstep)) 
  while z > -@depth - incro do
   z -= incro / NUMSEGS
   xx = xr * Math.sin(2 * i * Math::PI / NUMSEGS)
   yy = yr * Math.cos(2 * i * Math::PI / NUMSEGS)
   cutoPointDeepo(x+xx,y+yy,z)
   i += 1
  end
 end
 


 def rotaframe(x,y,wido,hido,theta) 
  wido -= $bitwidth
  hido -= $bitwidth
  wido /= 2
  hido /= 2
  theta = Math::PI*theta/180
  angol = Math.atan(hido/wido)
  radio = Math.sqrt(hido*hido+wido*wido)
  
  euler=Complex.polar(radio,angol+theta)
  cutoPoint(x+euler.real,y+euler.imag)
  euler=Complex.polar(radio,Math::PI-angol+theta)
  cutoPoint(x+euler.real,y+euler.imag)
  euler=Complex.polar(radio,Math::PI+angol+theta)
  cutoPoint(x+euler.real,y+euler.imag)
  euler=Complex.polar(radio,0-angol+theta)
  cutoPoint(x+euler.real,y+euler.imag)
  euler=Complex.polar(radio,angol+theta)
  cutoPoint(x+euler.real,y+euler.imag)
 end
 def rotaframeconventional(x,y,wido,hido,theta) 
  wido -= $bitwidth
  hido -= $bitwidth
  wido /= 2
  hido /= 2
  theta = Math::PI*theta/180
  angol = Math.atan(hido/wido)
  radio = Math.sqrt(hido*hido+wido*wido)

  euler=Complex.polar(radio,angol+theta)
  cutoPoint(x+euler.real,y+euler.imag)
    euler=Complex.polar(radio,0-angol+theta)
  cutoPoint(x+euler.real,y+euler.imag)
    euler=Complex.polar(radio,Math::PI+angol+theta)
  cutoPoint(x+euler.real,y+euler.imag)
    euler=Complex.polar(radio,Math::PI-angol+theta)
  cutoPoint(x+euler.real,y+euler.imag)
    euler=Complex.polar(radio,angol+theta)
  cutoPoint(x+euler.real,y+euler.imag)
 end
 
  def danger_rotabo(x,y,wido,hido,zstart,zdepth,step,theta) 
  incro = (Float(zdepth-zstart) / Float(step))
  cutoPoint(x,y)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   rotaframe(x,y,wido,hido,theta)
  end
  #retrax(zstart)
 end
 def rotabo(x,y,wido,hido,deep,step,theta) 
  incro = (Float(0-deep) / Float(step))
  skimtoPoint(x,y,0.1)
  for i in 1..step do
   penetrate((incro * i))
   rotaframe(x,y,wido,hido,theta)
  end
 end
 
 def rotabox(x,y,wido,hido,theta) 
  incro = (Float(0-@depth) / Float(@zstep))
  skimtoPoint(x,y,0.1)
  
  for i in 1..@zstep do
   penetrate((incro * i))
   rotaframe(x,y,wido,hido,theta)
  end
  
 end
 def rotabox(x,y,wido,hido,theta) 
  wido -= $bitwidth
  hido -= $bitwidth
  wido /= 2
  hido /= 2
  theta = Math::PI*theta/180
  angol = Math.atan(hido/wido)
  radio = Math.sqrt(hido*hido+wido*wido)
  skimtoPoint(x,y,0.1)
   z = 0
   incro = (Float(@depth) / Float(@zstep)) 
   while z > -@depth - incro do
   euler=Complex.polar(radio,angol+theta)
   cutoPointDeepo(x+euler.real,y+euler.imag,z)
   z -= incro / 4
   euler=Complex.polar(radio,Math::PI-angol+theta)
   cutoPointDeepo(x+euler.real,y+euler.imag,z)
   z -= incro / 4
   euler=Complex.polar(radio,Math::PI+angol+theta)
  cutoPointDeepo(x+euler.real,y+euler.imag,z)
  z -= incro / 4
  euler=Complex.polar(radio,0-angol+theta)
  cutoPointDeepo(x+euler.real,y+euler.imag,z)
  z -= incro / 4
  end
 end














 
 
def kobiconn(x,y)
 nowchub = (0.367/2)
 box(x+nowchub,y-0.5,x+nowchub+$bitwidth,y-0.3,0,-0.211,2)
 box(x-nowchub,y-0.75,x+nowchub,y+$halfwidth,0,-0.433,4)#june23 made 433 back to 4
 #december 2023 made 4 back to 433
end
def adamusb(x,y)
  nowchub = 0.25 #adamusb
  box(x-0.25,y-0.75,x+0.25,y+0.15,0,-0.433,4)
end
 def alpswitch(x,y)
  nowchub = (0.222/2) #alpsSHAFT
  box(x-nowchub,y-0.4,x+nowchub,y+$halfwidth+$halfwidth,0,-0.3,3)
  nowchub = (0.610/2) #alpswitch
  box(x-nowchub,y-0.5,x+nowchub,y-0.1,0,-0.36,3)
end

 def kyconsterupsidedown(x,y)
  nowchub = (0.266/2) #kyconSHAFT
  box(x-nowchub,y-$bitwidth,x+nowchub,y+0.4,0,-0.3,3)
  nowchub = (0.5/2) #kyconSTEREO
  box(x-nowchub,y+0.1,x+nowchub,y+0.65,0,-0.351,3)
  nowchub -= $halfwidth
  dux(x-nowchub,y+0.1+$halfwidth,x-nowchub,y+0.5,-0.351,-0.404,1)
  dux(x+nowchub,y+0.1+$halfwidth,x+nowchub,y+0.5,-0.351,-0.404,1)
end
 def kyconster(x,y)
  nowchub = (0.266/2) #kyconSHAFT
  box(x-nowchub,y-0.4,x+nowchub,y+$halfwidth+$halfwidth,0,-0.3,3)
  nowchub = (0.5/2) #kyconSTEREO
  box(x-nowchub,y-0.65,x+nowchub,y-0.1,0,-0.351,3)
  nowchub -= $halfwidth
  dux(x-nowchub,y-0.5,x-nowchub,y-0.1-$halfwidth,-0.351,-0.404,1)
  dux(x+nowchub,y-0.5,x+nowchub,y-0.1-$halfwidth,-0.351,-0.404,1)
end

def drawzarc(x,y,r,z)
  cutoPoint(x+r,y)
  if $DEBUG then
  printf "G3 X%5.5f Y%5.5f I%5.5f J%5.5f, Z%5.5f\n", 
  x-r, y, x, y, z
  else
  printf "G3 X%5.5f Y%5.5f I%5.5f J%5.5f, Z%5.5f\n", 
  x-r, y, -r, 0, z
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
 
 def drawzlun(x,y,r,z)
  drawzarc(x,y,r,z)
 end

 def drawzrun(x,y,r,z)
  if (r<0) then r += $halfwidth
  else r -= $halfwidth end
  drawzarc(x,y,r,z)
 end
 def lune(x,y,r,zstart,zdepth,step)
  if (r<0) then
   r += $halfwidth
  else 
   r -= $halfwidth
  end
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(x+r,y,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   drawzlun(x,y,r,zstart + (incro * i))
  end
 end
 def rune(x,y,r,zstart,zdepth,step)
   ###do LOONY STUFF HERE IN SID TET QUA
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(x,y,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   drawzrun(x,y,r,zstart + (incro * i))
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
 
end
