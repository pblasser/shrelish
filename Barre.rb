
require './Jacksloon.rb'
require './PlumPott.rb'
require './Okuda.rb'
 $bitwidth = 0.125
 $halfwidth = $bitwidth/2
class Barre < PlumPott
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 4.0
  @heigh = 1.0
  @depth = 0.420
  @@lipp = 0.0
  super
 end
 def getWido
  return @width + MARJ
 end
 def numerize
  unless ARGV[2].nil? then @@numero = Integer(ARGV[2]) end
 end
    def spyrtube(x,y,xr,yr,zstart)
  skimtoPoint(x,y,zstart+0.1)
  xr -= $halfwidth
  yr -= $halfwidth
  i = 0
  z = zstart
  incro = (Float(@depth) / Float(4)) 
  while z > -@depth - incro do
   z -= incro / NUMSEGS
   xx = xr * Math.sin(2 * i * Math::PI / NUMSEGS)
   yy = yr * Math.cos(2 * i * Math::PI / NUMSEGS)
   cutoPointDeepo(x+xx,y+yy,z)
   i += 1
  end
 end
 
 
 def boxo()
  @curxo += MARJ
  midx = @width/2
  endor = @curxo + @width
  drillus(@curxo+0.25,@stary,0,0-@depth)
  
  drillus(endor-0.25,@stary,0,0-@depth)
  
  tier = -0.045
  box(endor-midx+0.433,@stary-@heighchub,endor-0.325,@stary+@heighchub,0,tier,1)
  
  tier = -0.210
  box(@curxo+0.325,@stary-@heighchub,endor-midx+0.433,@stary+@heighchub,0,tier,2)
  
  if @@numero < 2 then signo = -0.2 
  else signo = 0.2 end
  #tubo(@curxo+0.65,@stary+signo,0.21,-0.2,0-@depth,2)
  #tubo(@curxo+1.2,@stary-signo,0.21,-0.2,0-@depth,2)
  #grantubo(@curxo+0.65,@stary+signo,0.22,0.21,-0.2,0-@depth,2)
  #grantubo(@curxo+1.2,@stary-signo,0.22,0.21,-0.2,0-@depth,2)
  @zstep = 4
  

 
 
 spyrtube(@curxo+0.65,@stary+signo,0.22,0.21,-0.2)
  spyrtube(@curxo+1.2,@stary-signo,0.22,0.21,-0.2)
  
  tier = -0.27
  tier = -0.29
  #slitdepth = -0.2
  tubo(@curxo+midx,@stary,0.433,-0.15,tier,1)
  cutoPoint(@curxo+midx,@stary)
  dux(@curxo+midx,@stary-@heighchub,@curxo+midx,@stary+@heighchub,-0.15,tier+0.025,1)
  
  edge = @stary-(signo*2.75)
  if @@numero == 1 or @@numero == 2 then
   rune(endor-0.9, edge, signo*1.8, 0, -0.2, 2) #tarb
   rune(endor-0.9, edge, signo*1.2, -0.2, 0-@depth,2)
   rune(endor-1.65, edge, signo, 0, -0.2, 1) #mike
  end
  
  
  
 
  tubo(endor-0.55,@stary+0.25,0.2,-0,-0.1,1)
  tubo(endor-0.55,@stary+0.25,0.1,-0.1,0-@depth,3)
  tubo(endor-0.55,@stary-0.25,0.2,-0,-0.1,1)
  tubo(endor-0.55,@stary-0.25,0.1,-0.1,0-@depth,3)
 
 if @@numero == 3 then
   drillus(endor-0.45,@stary-0.35,0,-0.1) #kyconsterprong
   drillus(endor-1.5,@stary-0.1,0,-0.1) #hedrprong
  end
  if @@numero == 2 then
   drillus(endor-0.45,@stary+0.35,0,-0.1) #kyconsterprong
   drillus(endor-0.35,@stary-0.31,0,-0.1) #adamusbthorn
  end
  if @@numero == 1 then
   drillus(endor-0.35,@stary+0.31,0,-0.1) #adamusbthorn
   drillus(endor-0.31,@stary-0.27,0,-0.1) #alpswitchthr
   drillus(endor-0.25,@stary-0.48,0,-0.1) #alpswitchthr
   
   drillus(endor-0.75,@stary+0.15,0,-0.1) #ohmage
   drillus(endor-0.8,@stary-0.175,0,-0.1) #ohmage
   drillus(endor-0.925,@stary-0.48,0,-0.1) #ohmage
  end
  if @@numero == 0 then
   drillus(endor-0.31,@stary+0.27,0,-0.1) #alpswitchthr
   drillus(endor-0.25,@stary+0.48,0,-0.1) #alpswitchthr
   
   drillus(endor-0.85,@stary+0.35,0,-0.1) #ohmage
   
   
  end
 
  @@numero += 1
  @@numero %= 4
  
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.05)
  @curxo += @width /2
  @curxo += MARJ
  
  #@curxo += @width
  #@curxo += MARJ
  return @curxo
 end
 def ducatop
 end
 def ducabot
 
  @myOkuda.bokchoy(-0.425,1.0,8,4)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01


unless ARGV[3].nil? then 
 nummerat(Barre,Integer(ARGV[3]))
else stutterat(Barre) end

#stutterat(Barre)
#stutterat(Barre)