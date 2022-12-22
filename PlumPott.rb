
require './Jacksloon.rb'
#require 'Complex'
 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2

class PlumPott < Jacksloon 
 @@engravedeep = -0.05
 def initialize(starx, stary)
  @resinx=0
  @resiny=0
  super(starx, stary)
 end

 def resin(x,y)
    @resinx=x
  @resiny=y
 end
 def cutoPointSpesal(x,y)
  pyth = ((x-@resinx)**2 + (y-@resiny)**2)**0.5
  if pyth>0.04 then
  printf "G1 X%5.5f Y%5.5f\n", x, y #@@feedrate
  resin(x,y)
  end
 end
 
 def organoPHORM(arr,x,y,sig)
  skimtoPoint(x+(sig*arr[0][1]),
             y+(sig*arr[0][0]),0.1)
  penetrate(@@engravedeep)
  resin(x+(sig*arr[0][1]),y+(sig*arr[0][0]))
  arr.each{|rr| cutoPointSpesal(x+(sig*rr[1]),y+(sig*rr[0]))}
  #skimtoPoint(x+(sig*arr[0][1]),
  #          y+(sig*arr[0][0]),0.1)
  #penetrate(@@engravedeep)
  #resin(x+(sig*arr[0][1]),y+(sig*arr[0][0]))
  #arr.each{|rr| cutoPointSpesal(x+(sig*rr[1]),y+(sig*rr[0]))}
  #arr.reverse_each{|rr| cutoPointSpesal(x+(sig*rr[1]),y+(sig*rr[0]))}
  retrax(0.1)
 end

 def johnson(x,y)
 spyrtub(x,y,5.0/32,0.15/32)
  #pipe(x,y,5.1/32,0,-@depth)#spyrtub(x,y,5.25/32,5.0/32)
 end
  def johnsoninv(x,y,theta)
  johnson(x,y)
  #spyrtub(x,y,5.1/32,5.0/32)
  retract
  r = 0.275
  for i in 1..6 do
   xx = r * Math.sin(theta * Math::PI / 180)
   yy = r * Math.cos(theta * Math::PI / 180)
   drillus(x+xx,y+yy,0,@@engravedeep)
   theta += 360/6
  end
 end
 
 
 def looscrew(x,y) 
  if $bitwidth == 0.125 then
   drillus(x,y,0,-@depth)
  else
   pipe(x,y,1.0/14,0,-@depth)
  end
 end
 def lediode(x,y)
  pipe(x,y,3.3/32,0,-@depth)
 end
  #NUMSEGS = 32
 def alpscirque(x,y,theta)
  innerrad = 0.28
  outerrad = 0.31
  for i in 0..32 do
   thetai = i
   radioi = innerrad
   #@@feedrate = 40
   if i < 3 then 
    thetai = 2 
	radioi = outerrad
	#@@feedrate = 20
   end
   if i >29 then 
    thetai = 30
	radioi = outerrad
	#@@feedrate = 20
   end
   thetai += theta*NUMSEGS/360
   yy = radioi * Math.sin(2 * thetai * Math::PI / NUMSEGS)
   xx = radioi * Math.cos(2 * thetai * Math::PI / NUMSEGS)
   cutoPoint(x+xx,y+yy)
  end
  thetai = 2 + theta*NUMSEGS/360
  #@@feedrate = 20
  yy = outerrad * Math.sin(2 * thetai * Math::PI / NUMSEGS)
  xx = outerrad * Math.cos(2 * thetai * Math::PI / NUMSEGS)
  cutoPoint(x+xx,y+yy)
  #@@feedrate = 40
 end
 
 def alpscirqueconventional(x,y,theta)
  innerrad = 0.28
  outerrad = 0.31
  for i in 0..32 do
   thetai = 32-i
   radioi = innerrad
   @@feedrate = 40
   if thetai < 3 then 
    thetai = 2 
	radioi = outerrad
	@@feedrate = 20
   end
   if thetai >29 then 
    thetai = 30
	radioi = outerrad
	@@feedrate = 20
   end
   thetai += theta*NUMSEGS/360
   yy = radioi * Math.sin(2 * thetai * Math::PI / NUMSEGS)
   xx = radioi * Math.cos(2 * thetai * Math::PI / NUMSEGS)
   cutoPoint(x+xx,y+yy)
  end
  thetai = 30 + theta*NUMSEGS/360
  @@feedrate = 20
  yy = outerrad * Math.sin(2 * thetai * Math::PI / NUMSEGS)
  xx = outerrad * Math.cos(2 * thetai * Math::PI / NUMSEGS)
  cutoPoint(x+xx,y+yy)
  @@feedrate = 40
 end
 
 def alpspot(x,y,theta)
  incro = (Float(0-@depth) / Float(@zstep))
  skimtoPoint(x,y,0.1)
  for i in 1..@zstep do
   penetrate((incro * i))
   alpscirque(x,y,theta)
  end
 end
 
   def alpsdot(x,y,theta)
   skimtoPoint(x,y,0.1)
   #innerrad = 

  outerrad = 3.55/25.4 - $halfwidth
   i = 0
   z = 0
   deepak = -0.35
   incro = (Float(-deepak) / Float(@zstep)) 
   while z > deepak do
    z -= incro / NUMSEGS
    thetai = i % NUMSEGS
    radioi = outerrad
    if thetai < 6 then 
     thetai = 7 
    end
    if thetai >26 then 
     thetai = 25
    end
    thetai += theta*NUMSEGS/360
    yy = radioi * Math.sin(2 * thetai * Math::PI / NUMSEGS)
    xx = radioi * Math.cos(2 * thetai * Math::PI / NUMSEGS)
    cutoPointDeepo(x+xx,y+yy,z)
    i += 1
   end
   cutoPoint(x,y)
 end
 def alpsdot(x,y,theta)
  drillus(x,y,0,-@depth)
 end
  def alpspot(x,y,theta)
  
   
   alpsdot(x,y,theta)
   skimtoPoint(x,y,0.1)
   innerrad = 0.3 #0.28
  outerrad = 0.33 #0.31
   i = 0
   z = 0
   incro = (Float(@depth) / Float(@zstep)) 
   while z > -@depth - incro do
    z -= incro / NUMSEGS
    thetai = i % NUMSEGS
    radioi = innerrad
    if thetai < 3 then 
     thetai = 2 
	 radioi = outerrad
    end
    if thetai >29 then 
     thetai = 30
	 radioi = outerrad
    end
    thetai += theta*NUMSEGS/360
    yy = radioi * Math.sin(2 * thetai * Math::PI / NUMSEGS)
    xx = radioi * Math.cos(2 * thetai * Math::PI / NUMSEGS)
    cutoPointDeepo(x+xx,y+yy,z)
    i += 1
   end
 end
 def pyth(x,y,th,r,z)
  yy = r*Math.sin(2 * th * Math::PI)
  xx = r*Math.cos(2 * th * Math::PI)
  cutoPointDeepo(x+xx,y+yy,z)
 end
 def pyrc(x,y,th,r,z,lth)
  yy = r*Math.sin(2 * th * Math::PI)
  xx = r*Math.cos(2 * th * Math::PI)
  
  ly = r*Math.sin(2 * lth * Math::PI)
  lx = r*Math.cos(2 * lth * Math::PI)
  
  if $DEBUG then
   printf "G3 X%5.5f Y%5.5f I%5.5f J%5.5f Z%5.5f\n", 
   x+xx, y+yy, x, y, z
  else
   printf "G3 X%5.5f Y%5.5f I%5.5f J%5.5f Z%5.5f\n", 
   x+xx, y+yy, -lx, -ly, z
  end
 end
 
 
 
 
 def alpspot(x,y,theta) 
  drillus(x,y,0,-@depth)
  retract()
  z=0
  incro = (Float(@depth) / Float(@zstep)) 
  incro /= 4.0
  theta = Float(theta)/360
  while z>-@depth - incro do  
   pyth(x,y,30.0/32.0+theta,0.33,z)
   z-=incro
   pyth(x,y,2.0/32.0+theta,0.33,z)
   z-=incro
   pyth(x,y,3.0/32.0+theta,0.3,z)
   z-=incro
   pyrc(x,y,29.0/32.0+theta,0.3,z,3.0/32+theta)
   z-=incro
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
 
 
 def swdpdt(x,y,theta)
  rotabox(x,y,0.37,0.35+$bitwidth,theta) 
 end
 def swdpst(x,y,theta)
  rotabox(x,y,0.37,0.25,theta) 
 end


 def cutoPointz(x,y,z)
  if z<0 then
  printf "G1 X%5.3f Y%5.3f Z%5.3f\n", x, y, z
  end
 end 
 
 def parabolza(x,y,z,xx,yy)
  
  x/=12.0
  y/=12.0
  z/=10.0
  cutoPointz(xx+x,yy+y,(x**4)+8*(y**4)-z)
 end
 def shallot(x,y,xs)
  skimtoPoint(x,y,0.1)
  signx = signy = 1
  for k in 0..3 do
   for j in 0..12 do
    for i in -13..14 do
     parabolza(xs*j,signy*i,k,x,y)
    end
    signy*=-1
   end
   signx*=-1
  end
 end
end
