
#require './Dude.rb'
require './Okuda.rb'
require './Jacksloon.rb'


@@numero = 0
class Grassi < Jacksloon
  def initialize(starx, stary)
   @depth=0.55
   @zstep = 4
   @numzegs=64
   @shorter=-6
   @longer=8
   @pampers=[]
   for i in @shorter..@longer
    @pampers = @pampers << i
   end
   @nux = 0
  @nuy = 0
  @wido = 8.0
  @hawi = @wido + @@lipp + $halfwidth
  @hido= 1.8
  @heigh = @hido*2
  super(starx, stary)
  s = ova(@shorter+@numzegs/4)
  d = ova(@longer+@numzegs/4)
  x= s[0]-d[0]
  y = s[1]-d[1]
  
  @sidebide = Math.sqrt(x*x+y*y)
  
 end


 def ova(theta)
  
   theta = theta/Float(@numzegs)
   w = @wido+$halfwidth+@@lipp
   h = @hido+$halfwidth+@@lipp
  xx = w * Math.sin(2*theta * Math::PI)
  yy = h * Math.cos(2*theta * Math::PI)
  return [@hawi+xx,yy+@stary]
 end

 def rim(theta)
 #use closure to return in place
  leftshore = @shorter+@numzegs/4
  leftlore = @longer+@numzegs/4
  if theta>leftshore and theta<leftlore
   start = ova(leftshore)
   endor = ova(leftlore)
   num = theta-leftshore
   seg = leftlore-leftshore
   primp=[]
   primp[0] = num*(endor[0]-start[0])/seg+start[0]
   primp[1] = num*(endor[1]-start[1])/seg+start[1]
   return primp
  end
  leftshore = 3*@numzegs/4- @shorter
  leftlore = 3*@numzegs/4-@longer
  if theta<leftshore and theta>leftlore
   start = ova(leftlore)
   endor = ova(leftshore)
   num = theta-leftlore
   seg = leftshore-leftlore
   primp=[]
   primp[0] = num*(endor[0]-start[0])/seg+start[0]
   primp[1] = num*(endor[1]-start[1])/seg+start[1]
   return primp
  end
  star = ova(theta)
  return star
 end
 def ducabot
  nuz = 0
  retrax 0.1
  star = rim(0)
  skimtoPoint(star[0],star[1],0.1)
  tier = Integer(@depth / 0.15) 
  tier = @depth / tier
  oscacc = 0
  #numzegs=64.0
  while (nuz >= -@depth) do
   nuz -= tier
   for i in 1..@numzegs 
    oscacc += 1
    trank = (oscacc % 2) * 2 - 1
    here = rim(i)
    nuz += 0.2 * trank 
    cutoPointDeepo(here[0],here[1],nuz)
   end
  end
 end
 def boxo
 
  if @@numero == 1 then
   fox(@hawi-2.125,-1.2+@stary,@hawi+2.125,1.2+@stary,0,-@depth,4)
  end
  
  @@numero += 1
  @@numero %= 2
  
  #fox(@hawi-2.125-2.2,-3.5-@sidebide/2,@hawi+2.125-2.2,-3.5+@sidebide/2,0,-@depth,4)
  #fox(@hawi-2.125+2.2,-3.5-@sidebide/2,@hawi+2.125+2.2,-3.5+@sidebide/2,0,-@depth,4)
 end 
  def ducatop
 end
 def eights(x,y) end
 def bomron(x,y) end
 def balmet(x,y) end
 def brasso(x,y) end
 def duxo
  return @curxo
 end
end

stutterat(Grassi)