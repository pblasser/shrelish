

$LOAD_PATH << "C:\cygwin64\lib\ruby\mathn\2.3.0"
require 'complex'
$rimmer = 0.1

#zer introduces "z"
#uno bitwidth ducked
#duo
#tri
#qua
#bot bitwidth declared composition?
#top bitwifth decreased



class Bo #also _is_ an affine
 depth = 0
end
class Duo < Bo
 x=0
 y=0
 content = [] #composition
 affines = []
end
class Trio < Duo
 r=0
end
class Tetro < Trio
 angola=45
 #initiate also with Duo, Duo for bounds instance cut
end

class Bot
 $bitwidth = 0.125
 $halfwidth = $bitwidth/2
 TIERATE = 0.12
 @@lipp = 0.05
 @@pentrate = 30
 @@feedrate = 40
 @@numero = 0
 @@deepana = -0.25
 
 
 def initialize(starx, stary)
  @heighchub = @heigh / 2.0 
  @duxulate =Integer(@depth / TIERATE)
  @starx = starx
  @stary = stary
  @curxo = starx
  printf"F40\n"
 end

 def retrax(z)
  printf "G0 Z%5.4f\n",z
 end
 def retract
  retrax(0.1)
 end
 def penetrate(z)
  printf "G1 Z%5.4f\n", z #@@pentrate
 end
 def cutoPoint(x,y)
  printf "G1 X%5.4f Y%5.4f\n", x, y #@@feedrate
 end
 def skimtoPoint(x,y,z)
  retrax(z)
  printf "G0 X%5.4f Y%5.4f\n", x, y
 end
 def gotoPoint(x,y)
  skimtoPoint(x,y,0.1)
 end
 def dwellus(tparm)
  printf "G4 P%5.4f \n",tparm
 end
 def drillus(x,y,zstart,zdepth)
  skimtoPoint(x,y,zstart+0.1)
  penetrate(zdepth)
  #boom!dwellus(0.5)
 end
 def drawzframe(minx,miny,maxx,maxy)
  #dwellus(0.1)
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
 #hacked to change random bitsiwth fiox with classvar
  def randdrawzsquare(minx,miny,maxx,maxy,bronk)
  minx += $halfwidth
  miny += $halfwidth
  maxx -= $halfwidth
  maxy -= $halfwidth
  #drawzframe(minx,miny,maxx,maxy)
  while (minx < maxx) and (miny < maxy-(bronk*2)) 
   drawzframe(minx,miny,maxx,maxy)
   minx += bronk
   miny += bronk
   maxx -= bronk
   maxy -= bronk
   #drawzframe(minx,miny,maxx,maxy)
  end
  midx = (minx + maxx) / 2
  #cutoPoint(midx,maxy)
  #cutoPoint(midx,miny)
 end
 def randbox(minx,miny,maxx,maxy,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(minx+$halfwidth,miny+$halfwidth,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   randdrawzsquare(minx,miny,maxx,maxy,Float(rand(6))/18.0 + 1.0/8.0)
  end
 end   
  def bronx(minx,miny,maxx,maxy,zstart,zdepth,step, bron)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(minx+$halfwidth,miny+$halfwidth,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   randdrawzsquare(minx,miny,maxx,maxy,bron)
  end
 end   
 
 def fox(minx,miny,maxx,maxy,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(minx+$halfwidth,miny+$halfwidth,zstart+0.1)
  minx += $halfwidth
  miny += $halfwidth
  maxx -= $halfwidth
  maxy -= $halfwidth
  for i in 1..step do
   penetrate(zstart + (incro * i))
   drawzframe(minx,miny,maxx,maxy)
  end
 end   

 def arc(x,y,z,r)
  if $DEBUG then
   printf "G2 X%5.4f Y%5.4f I%5.4f J%5.4f Z%5.4f\n", 
   x+r, y, x, y, z
  else
   printf "G2 X%5.4f Y%5.4f I%5.4f J%5.4f Z%5.4f\n", 
   x+r, y, -r, 0, z
  end
 end
 
 def pipe(x,y,r,s,e)
  r -= $halfwidth
  skimtoPoint(x+r,y,0.1)
  penetrate(s)
  z = s
  incro = 0.15 
  while z > (e - incro) do
   z -= incro
   ee = z   
   if (z < e) then ee = e-0.001 end
   arc(x,y,ee,r)
  end
  if $DEBUG then arc(x,y,e-0.002,r) end
 end
 
 NUMSEGS = 32
 @@twiddle = 0.001
 def drawzcirque(x,y,r,z)
  cutoPoint(x+r,y)
  arc(x,y,z-@@twiddle,r)
  @@twiddle=@@twiddle*(-1.0)

 end
 
 def drawzdisque(x,y,r,z)
  r -= $halfwidth
  while r > 0
   drawzcirque(x,y,r,z)
   r -= $bitwidth
  end
 end

 def tubo(x,y,r,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(x,y,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   drawzdisque(x,y,r,zstart + (incro * i))
  end
 end
 
 def grancirque(x,y,xr,yr)
  xr -= $halfwidth
  yr -= $halfwidth
  numsegs = Integer(xr*32+1)
  for i in 0..NUMSEGS do
   xx = xr * Math.sin(2 * i * Math::PI / NUMSEGS)
   yy = yr * Math.cos(2 * i * Math::PI / NUMSEGS)
   cutoPoint(x+xx,y+yy)
  end
 end
 def grantubo(x,y,xr,yr,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(x,y,zstart+0.1)
  for i in 1..step do
   penetrate(zstart + (incro * i))
   grancirque(x,y,xr,yr)
  end
 end
 def flip() end
 def duxo()
  @curxo += $halfwidth
  dux(@curxo, @stary-getBrot, @curxo, @stary+getBrot, 0, 0-@depth, @duxulate) 
  @curxo += $halfwidth
  return @curxo
 end
 def duxong(pranska)
  incro = (Float(@depth) / Float(@duxulate))
  skimtoPoint(pranska[0][0],pranska[0][1],0.1)
  for i in 1..@duxulate do
   penetrate(0-(incro * i))
   if  (i.divmod(2)[1] != 0) then
    pranska.each {|x| cutoPoint(x[0],x[1])} else
    pranska.reverse.each {|x| cutoPoint(x[0],x[1])} 
   end
  end
 end
 def getBrot()
  return @heighchub + $halfwidth + @@lipp
 end
 def getTopPranska()
  pranska = [[@starx,@stary+getBrot], [@curxo,@stary+getBrot]]
 end
 def getBotPranska()
  pranska = [[@starx,@stary-getBrot], [@curxo,@stary-getBrot]]
 end
 def ducatop()
  brot = getBrot()
  dux(@starx,@stary+brot,@curxo,@stary+brot,0,0-@depth,@duxulate)
 end

 def ducabot()
  brot = getBrot()
  dux(@starx,@stary-brot,@curxo,@stary-brot,0,0-@depth,@duxulate)
 end
 def numerize 
 end
 def numerset(t)
  @@numero = t
 end
 def getWido
 end
end

def indostutterat(clasz)
  xarg = 1
  unless ARGV[1].nil? then xarg = Integer(ARGV[1]) end
  browblank = []
  mystuff = clasz.new(0,0)
  mystuff = clasz.new(mystuff.duxo(), 0)
  for j in 1..xarg do
   browblank.push(mystuff)
   mystuff.boxo()
   mystuff = clasz.new(mystuff.duxo(),0)
  end
  browblank.reverse.each {|y| y.ducabot}
  browblank.each {|y| y.ducatop}
  printf "G0 Z0.5\n"
  printf "G0 X0 Y0 \n"
end

def oldestutterat(clasz)
 xarg = yarg = 1
 unless ARGV[0].nil? then yarg = Integer(ARGV[0]) end
 unless ARGV[1].nil? then xarg = Integer(ARGV[1]) end
 if yarg == 0 then return indostutterat(clasz) end
 
 curyo = clasz.new(0,0).getBrot #* (yarg-1)
 curyop = curyo + 0.05 + (2*curyo*(yarg-1)) + (yarg*$rimmer)
 curyob = 0 - curyop
 rowse = []
 toprowse = []
 botrowse = []
 for i in 1..yarg do
  
  curxo = 0
  trowblank = []
  mystuff = clasz.new(curxo,curyop)
  mystuff = clasz.new(mystuff.duxo(), curyop)
  if i == 1 then mystuff.numerize end
  for j in 1..xarg do
   trowblank.push(mystuff)
   mystuff.boxo()
   mystuff = clasz.new(mystuff.duxo(), curyop)
  end
  #toprowse.push(rowblank)
 
  browblank = []
  mystuff = clasz.new(curxo,-curyop)
  mystuff = clasz.new(mystuff.duxo(),-curyop)
  for j in 1..xarg do
   browblank.push(mystuff)
   mystuff.boxo()
   mystuff = clasz.new(mystuff.duxo(),-curyop)
  end
  trowblank.each {|y| y.ducatop}
  trowblank.reverse.each {|y| y.ducabot}
  browblank.reverse.each {|y| y.ducabot}
  browblank.each {|y| y.ducatop}
  #botrowse.push(rowblank)
  
  curyop -= mystuff.getBrot
  curyop -= mystuff.getBrot
  curyop -= $rimmer
 end
 printf "G0 Z0.5\n"
  printf "G0 X0 Y0 \n"
 #toprowse.reverse.each {|x| 
 # x.each {|y| y.ducatop}
 # x.reverse.each {|y| y.ducabot}
 #}
 #botrowse.reverse.each {|x| 
 # x.reverse.each {|y| y.ducabot}
 # x.each {|y| y.ducatop}
 #}
end
$rimmer = 0.01
def stutterat(clasz)
 xarg = yarg = 1
 unless ARGV[0].nil? then yarg = Integer(ARGV[0]) end
 unless ARGV[1].nil? then xarg = Integer(ARGV[1]) end
 broth = clasz.new(0,0).getBrot + $rimmer
 curyop = (yarg-1)*broth
 curxo = 0
 mystuff = clasz.new(curxo,0)
 for i in 1..xarg do
  if i == 1 then mystuff.numerize end
  curyo = curyop
  for j in 1..yarg do
   mystuff = clasz.new(curxo,curyo)
   mystuff.boxo()
   mystuff.ducabot()
   curyo -= broth*2
  end
  curxo = mystuff.duxo() + $rimmer
 end
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"
end



def nummerat(clasz,num)
 xarg = yarg = 1
 unless ARGV[0].nil? then yarg = Integer(ARGV[0]) end
 unless ARGV[1].nil? then xarg = Integer(ARGV[1]) end
 broth = clasz.new(0,0).getBrot + $rimmer
 curyop = (yarg-1)*broth
 curxo = 0
 mystuff = clasz.new(curxo,0)
 #curxo = mystuff.duxo()
 for i in 1..xarg do
  curyo = curyop
  for j in 1..yarg do
   mystuff = clasz.new(curxo,curyo)
   mystuff.numerset(num) 
   mystuff.boxo()
   mystuff.ducabot()
   curyo -= broth*2
  end
  curxo = mystuff.duxo() + $rimmer
 end
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"
end




