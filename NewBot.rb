
#require './BotRit.rb'
#require './BotRot.rb'
require './BotJax.rb'
$rimmer = 0.1

class Bot
 $bitwidth = 0.125
 $halfwidth = $bitwidth/2
 TIERATE = 0.12
 @@lipp = 0.05
 @@pentrate = 30
 @@feedrate = 40
 
 
 def initialize(starx, stary)
  @heighchub = @heigh / 2.0 
  @duxulate =Integer(@depth / TIERATE)
  @starx = starx
  @stary = stary
  @curxo = starx
 end

 def retrax(z)
  printf "G0 Z%5.3f\n",z
 end
 def retract
  retrax(0.1)
 end
 def penetrate(z)
  printf "G1 Z%5.3f F%d\n", z, @@pentrate
 end
 def cutoPoint(x,y)
  printf "G1 X%5.3f Y%5.3f F%d\n", x, y, @@feedrate
 end
 def skimtoPoint(x,y,z)
  retrax(z)
  printf "G0 X%5.3f Y%5.3f\n", x, y
 end
 def gotoPoint(x,y)
  skimtoPoint(x,y,0.1)
 end
 def dwellus(tparm)
  printf "G4 P%5.3f \n",tparm
 end
 def drillus(x,y,zstart,zdepth)
  skimtoPoint(x,y,zstart+0.1)
  penetrate(zdepth)
  dwellus(0.5)
 end
 #include BotRit
 #include BotRot
 include BotJax

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
  printf "G0 Z0.1\n"
end

def stutterat(clasz)
 xarg = yarg = 1
 unless ARGV[0].nil? then yarg = Integer(ARGV[0]) end
 unless ARGV[1].nil? then xarg = Integer(ARGV[1]) end
 if yarg == 0 then return indostutterat(clasz) end
 
 curyo = clasz.new(0,0).getBrot #* (yarg-1)
 curyop = curyo + 0.152 + (2*curyo*(yarg-1)) + (yarg*$rimmer)
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
 printf "G0 Z0.1\n"
 #toprowse.reverse.each {|x| 
 # x.each {|y| y.ducatop}
 # x.reverse.each {|y| y.ducabot}
 #}
 #botrowse.reverse.each {|x| 
 # x.reverse.each {|y| y.ducabot}
 # x.each {|y| y.ducatop}
 #}
end
