
require './Bot.rb'
#require 'Complex'
require './Jacksloon.rb'
require './dudefunks.rb'

class Roto < Bot 
 def initialize(star,endd,tier)
  @start=star
  @endor=endd
  @tiero=tier
 end
 def rotate(th) 
  th=Math::PI*th/180
  @arr.map! { |rr|
   angol = Math.atan2(rr[1],rr[0])
   radio = Math.sqrt((rr[1]*rr[1])+(rr[0]*rr[0]))
   euler=Complex.polar(radio,angol+th)
   [euler.real,euler.imag]
  }
 end
end

class Boxx < Roto
 def arrdonk(minx,miny,maxx,maxy)
  @arr = @arr <<
   [minx,miny] <<
   [minx,maxy] <<
   [maxx,maxy] <<
   [maxx,miny] <<
   [minx,miny]
 end
 def initialize(minx,miny,maxx,maxy,star,endd,tier)
  minx += $halfwidth
  miny += $halfwidth
  maxx -= $halfwidth
  maxy -= $halfwidth
  @arr = []
  arrdonk(minx,miny,maxx,maxy)
  while (minx < maxx) and (miny < maxy) 
   minx += $bitwidth 
   miny += $bitwidth
   maxx -= $bitwidth
   maxy -= $bitwidth
   arrdonk(minx,miny,maxx,maxy)
  end
  super(star,endd,tier)
 end
 def cutote(x,y)
  incro = (Float(@endor-@start) / Float(@tiero))
  skimtoPoint(@arr[0][0]+x,@arr[0][1]+y,@start+0.1)
  for i in 1..@tiero do
   penetrate(@start + (incro * i)) 
   @arr.each { |rr|
    cutoPoint(rr[0]+x,rr[1]+y)
   }
  end
 end
end

class Duxx < Roto
 def initialize(starx,stary,dendx,dendy,star,endd,tier)
  @arr = [[starx,stary],[dendx,dendy]]
  super(star,endd,tier)
 end
 def cutote(x,y)
  incro = (Float(@endor-@start) / Float(@tiero))
  skimtoPoint(@arr[0][0]+x,@arr[0][1]+y,@start+0.1)
  for i in 1..@tiero do
   penetrate(@start + (incro * i))
   p = i.divmod(2)[1]
   cutoPoint(@arr[p][0]+x,@arr[p][1]+y)
  end
 end
end
 
class Kobi 
 def initialize(x,y,th)
  nowchub = (0.367/2)
  @parts=[]
  @parts<<Boxx.new(nowchub,-0.5,nowchub+$bitwidth,-0.3,0,-0.211,2)
  @parts<<Boxx.new(-nowchub,-0.75,nowchub,$halfwidth,0,-0.433,3)
  @parts.each{|p| p.rotate(th) 
   p.cutote(x,y) 
  }
 end
end

class Kyco
 def initialize(x,y,th)
  @parts=[]
  nowchub = (0.266/2) #kyconSHAFT
  @parts<<Boxx.new(-nowchub,-0.4,nowchub,$halfwidth+$halfwidth,0,-0.3,3)
  nowchub = (0.5/2) #kyconSTEREO
  @parts<<Boxx.new(-nowchub,-0.65,nowchub,-0.1,0,-0.351,3)
  nowchub -= $halfwidth
  @parts<<Duxx.new(-nowchub,-0.5,-nowchub,-0.1-$halfwidth,-0.351,-0.404,1)
  @parts<<Duxx.new(+nowchub,-0.5,+nowchub,-0.1-$halfwidth,-0.351,-0.404,1)
  @parts.each{|p| p.rotate(th) 
   p.cutote(x,y) 
  }
 end
end

class Dude < Jacksloon
 def initialize(n,z)
  @nodes = n
  @zygot = z
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
 def boxo
 end 
 def eights(x,y) end
 def bomron(x,y) end
 def balmet(x,y) end
 def brasso(x,y) end
 def BRASSO(x,y) end
 def duxo
  return @curxo
 end
end

def dudderat(clasz)
 nodes = "BRASSO"
 zygot = "FYRALL"
 unless ARGV[0].nil? then nodes = String(ARGV[0]) end
 unless ARGV[1].nil? then zygot = String(ARGV[1]) end
 broth = clasz.new(nodes,zygot)
 broth.boxo()
 broth.ducabot()
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"
 #print nodes
 #print zygot
end