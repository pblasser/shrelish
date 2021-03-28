
require './Jacksloon.rb'
require './Okuda.rb'
require './plumbENGRAVE/cornuSZILK.rb'

 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2

class CornuTop < Jacksloon
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 6
  @heigh = 4.7 ###1.95 ####wasz 2!!!
  @depth = 0.55
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end
 def organoPHORM(arr,x,y,sig)
  skimtoPoint(x+(sig*arr[0][1]),
             y+(sig*arr[0][0]),0.1)
  penetrate(-0.08)
  arr.each{|rr| cutoPoint(x+(sig*rr[1]),y+(sig*rr[0]))}
 end
 def johnson(x,y)
  grantubo(x,y,5.1/32,5.0/32,0,-@depth,3)
 end
  NUMSEGS = 32
 def alpscirque(x,y,theta)
  innerrad = 0.28
  outerrad = 0.31
  for i in 0..32 do
   thetai = i
   radioi = innerrad
   if i < 3 then 
    thetai = 2 
	radioi = outerrad
   end
   if i >29 then 
    thetai = 30
	radioi = outerrad
   end
   thetai += theta*NUMSEGS/360
   yy = radioi * Math.sin(2 * thetai * Math::PI / NUMSEGS)
   xx = radioi * Math.cos(2 * thetai * Math::PI / NUMSEGS)
   cutoPoint(x+xx,y+yy)
  end
  thetai = 2 + theta*NUMSEGS/360
  yy = outerrad * Math.sin(2 * thetai * Math::PI / NUMSEGS)
  xx = outerrad * Math.cos(2 * thetai * Math::PI / NUMSEGS)
  cutoPoint(x+xx,y+yy)
 end
 
 def alpspot(x,y,theta)
  incro = (Float(0-@depth) / Float(@zstep))
  skimtoPoint(x,y,0.1)
  for i in 1..@zstep do
   penetrate((incro * i))
   alpscirque(x,y,theta)
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
 def rotabox(x,y,wido,hido,theta) 
  incro = (Float(0-@depth) / Float(@zstep))
  skimtoPoint(x,y,0.1)
  for i in 1..@zstep do
   penetrate((incro * i))
   rotaframe(x,y,wido,hido,theta)
  end
 end
 def swdpdt(x,y,theta)
  #rotabox(x,y,0.32+$bitwidth,0.36,theta) 
  #rotabox(x,y,0.36,0.32+$bitwidth,theta) 
  rotabox(x,y,0.35,0.36+$bitwidth,theta) 
 end
 def looscrew(x,y) 
  if $bitwidth == 0.125 then
   drillus(x,y,0,-@depth)
  else
   tubo(x,y,1.0/14,0,-@depth,@zstep)
  end
 end
 def boxo()
  @curxo += MARJ
  widochub = @width/2
  organoPHORM($cornuSZILK,@curxo+widochub,@heighchub,1)
  #alpspot(0,0,0)
  drillus(@curxo+widochub-2.2,@heighchub-1.6,0,-@depth)
  #drillus(@curxo+widochub-2.25,@heighchub-2.25,0,-@depth)
  looscrew(@curxo+widochub-2.25,@heighchub-2.25)
  tubo(@curxo+widochub-2.255,@heighchub-2.626,3.3/32,0,-@depth,@zstep)
  #drillus(@curxo+widochub-2.25,@heighchub-4.55,0,-@depth)
  looscrew(@curxo+widochub-2.25,@heighchub-4.55)
  
  swdpdt(@curxo+widochub-1.443,@heighchub-2.740,-17)
  alpspot(@curxo+widochub-1.665,@heighchub-3.274,180+163)
  alpspot(@curxo+widochub-0.848,@heighchub-2.765,180+163)
  alpspot(@curxo+widochub-1.058,@heighchub-3.709,180+163)
  
  johnson(@curxo+widochub-0.131,@heighchub-2.748)
  johnson(@curxo+widochub-0.426,@heighchub-4.016)
  johnson(@curxo+widochub+0.521,@heighchub-2.681)
  alpspot(@curxo+widochub+0.637,@heighchub-4.021,180+169)
  johnson(@curxo+widochub+1.155,@heighchub-2.640)
  tubo(@curxo+widochub+1.293,@heighchub-3.196,3.3/32,0,-@depth,@zstep)
  johnson(@curxo+widochub+1.322,@heighchub-3.849)
  johnson(@curxo+widochub+1.725,@heighchub-2.650)
  tubo(@curxo+widochub+1.785,@heighchub-3.115,3.3/32,0,-@depth,@zstep)
  johnson(@curxo+widochub+1.844,@heighchub-3.643)
  
  drillus(@curxo+widochub+2.2,@heighchub-1.6,0,-@depth)
  #drillus(@curxo+widochub+2.25,@heighchub-2.25,0,-@depth)
  looscrew(@curxo+widochub+2.25,@heighchub-2.25)
  tubo(@curxo+widochub+2.234,@heighchub-2.697,3.3/32,0,-@depth,@zstep)
  #drillus(@curxo+widochub+2.25,@heighchub-4.55,0,-@depth)
  looscrew(@curxo+widochub+2.25,@heighchub-4.55)
  
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.3)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoy(-@depth,1.0,12,10)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end

stutterat(CornuTop)