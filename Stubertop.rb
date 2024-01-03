
require './PlumPott.rb'
require './stubefunks.rb'


 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2
class Stuberon < PlumPott
 def initialize(n)

   @zstep = 4
  @nodes = n
  @nux = 0
  @nuy = 0
  @wido = 8.0
  @hawi = @wido + @@lipp + $halfwidth
  @hido= 2.5
  @width=@wido*2
  @heigh=@hido*2
  super(0,0)
 end
 def max (x,y)
  if (x>y) then return x
  else return y end
 end
  def brasso_specifico(x,y)
  skimtoPoint(x,y,0.1)
  thetai = 0
  maxrad = 1.0/8.0 - 1.0/25.4
  radif = 1.0/8.0 - 2.0/25.4
   i = 0
   z = 0
   incro = (Float(@depth) / Float(@zstep)) 
   while z > -@depth do
    z -= incro / NUMSEGS
    radioi = maxrad - (z/-@depth)*radif
    radioi /= 2.0
    yy = radioi * Math.sin(2 * i * Math::PI / NUMSEGS)
    xx = radioi * Math.cos(2 * i * Math::PI / NUMSEGS)
    cutoPointDeepo(x+xx,y+yy,z)
    i += 1
   end
   while z < 0 do
    z += incro / NUMSEGS
    radioi = maxrad - (z/-@depth)*radif
    radioi /= 2.0
    yy = radioi * Math.sin(2 * i * Math::PI / NUMSEGS)
    xx = radioi * Math.cos(2 * i * Math::PI / NUMSEGS)
    cutoPointDeepo(x+xx,y+yy,z)
    i += 1
   end
 end
  def dx(x)
  return @@lipp + $halfwidth + x # (@wido*2)-x
 end
def ova(w,h,theta)
  xx = w * Math.cos(2*theta * Math::PI)
  yy = h * Math.sin(2*theta * Math::PI)
  return [@hawi+xx,yy]
 end
 def rim(theta)
  star = ova(@wido+$halfwidth+@@lipp,@hido+$halfwidth+@@lipp,theta)
  return star
 end
 
 def ducabot()
  nuz = 0
  retrax 0.1
  star = rim(0)
  skimtoPoint(star[0],star[1],0.1)
  tier = Integer(@depth / 0.15) 
  tier = @depth / tier
  oscacc = 0
  numzegs=64.0
  while (nuz >= -@depth) do
   nuz -= tier
   for i in 1..numzegs 
    oscacc += 1
    trank = (oscacc % 2) * 2 - 1
    here = rim(i/numzegs)
    nuz += 0.2 * trank 
    cutoPointDeepo(here[0],here[1],nuz)
   end
  end
 end
 def alpstot(x,y,theta)
   skimtoPoint(x,y,0.1)
   #innerrad = 

  outerrad = 3.0/25.4 - $halfwidth #3.2!
   i = 0
   z = 0
   deepak = -0.45 #was 40
   incro = (Float(-deepak) / Float(@zstep)) 
   drepak = deepak - incro
   while z > drepak do
    z -= incro / NUMSEGS
	zz = max(z,deepak)
    thetai = i % NUMSEGS
    radioi = outerrad
    if thetai < 6 then 
     thetai = 6 
    end
    if thetai >26 then 
     thetai = 26
    end
    thetai += theta*NUMSEGS/360
    yy = radioi * Math.sin(2 * thetai * Math::PI / NUMSEGS)
    xx = radioi * Math.cos(2 * thetai * Math::PI / NUMSEGS)
    cutoPointDeepo(x+xx,y+yy,zz)
    i += 1
   end
   while z < 0 do
    z += incro / NUMSEGS
	zz = max(z,deepak)
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
    cutoPointDeepo(x+xx,y+yy,zz)
    i += 1
   end

 end
 
 def balpsMET(x,y,t)
 x = dx(x)
 alpstot(x,y,90)
 alpstot(x,y,90)
 #alpsdot(x,y,90)
 tubo(x,y,0.35,0,-0.12,2)
 spyrtub(x,y,1.5,0)
end
 
 def balpsQMET(x,y,t) 
  
  x = dx(x)
  alpspot(x,y,t-90)
  if (t<0) then 
   box(x-0.5,y-0.25,x-0.3,y+0.25,0,-0.1,1)
  else
   box(x+0.3,y-0.25,x+0.5,y+0.25,0,-0.1,1)
  end  
 end
 def eights(x,y,t)
  x = dx(x)
  spyrtub(x,y,1.0/14,0.15/32)
 end

 def omronish(x,y)
   x = dx(x)
  tubo(x,y,0.35,0,-0.11,1)
  tubo(x,y,0.38/2.0,-0.11,-0.4,3)
  spyrtub(x,y,0.5,0)
  end
 def omron(x,y,t) 
  omronish(x,y)
  x=dx(x)
  
  tubo(x,-y,0.125,0,-0.333,3)
  spyrtub(x,-y,1.0/14,0)
 end
 def BRASSO(x,y,t)  
  x = dx(x)
  if @nodes=="BRASSO" then  
  brasso_specifico(x,y)
  elsif @nodes=="STUDS" then
  spyrtub(x,y,0.05,0)
  else johnson(x,y) end
 end
 def swDPDT(x,y,t) 
 x = dx(x)
  swdpdt(x,y,90+t)
 end
 
  def cronktor(x,y)
  for i in 0..5 do
   box(x-0.7,y-0.5+Float(i)/10,
       x+0.7,y,
	   -Float(i)/15,-Float(i+1)/15,1)
  end
 end
 
  def cronktori(x,y)
  for i in 0..5 do
   box(x-0.7,y,
       x+0.7,y+0.5-Float(i)/10,
	   -Float(i)/15,-Float(i+1)/15,1)
  end
 end
 def boxo
  stube()
  xoff=0.70
  yoff=1.95
  #omronish(dx(xoff),yoff)
  #omronish(dx(16-xoff),yoff)
  #omronish(dx(16-xoff),-yoff)
  #omronish(dx(xoff),-yoff)
  
  cronktor(@hawi, 2.4)
  cronktori(@hawi, -2.4)
 end 

end

def stuberat()
 nodes = "BRASSO"
 unless ARGV[0].nil? then nodes = String(ARGV[0]) end
 broth = Stuberon.new(nodes)
 broth.boxo()
 broth.ducabot()
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"
 #print nodes
 #print zygot
end
stuberat()


