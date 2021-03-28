
#require './PlumPott.rb'
require './Jacksloon.rb'
require './Okuda.rb'
class Sidmatrix < Jacksloon
 $bitwidth = 0.125
 $halfwidth = $bitwidth/2
 #because plumpott is 2mm
 MARJ = 0.05 #0.25
 @@numero = 0
 
 def initialize(starx, stary)
  @width = 5.0
  @heigh = 1.95 ###1.95 ####wasz 2!!!
  @depth = 0.55
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
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
 def jamesjohns(x,y)
  #x = dx(x)
  if $nodes=="JAMES" then brasso_specifico(x,y)
  else johnson(x,y) end
 end
 
 def boxo()
  @curxo += MARJ
  signo = (@@numero*2) - 1
  rune(@curxo+0.5, @stary-signo, Float(signo)/3, 0, -@depth,@zstep)
  jamesjohns(@curxo+(17.0/4),@stary-signo*0.75)
  for i in 0..5 do
   for j in 0..3 do #wasz 5/32
    unless j == 3 then
     jamesjohns(@curxo+(5.0/4)+(i/2.0),@stary-signo*((3.0/4)-(j/2.0)))
	end 
	if j == 3 and (i%2)==0 then
	 jamesjohns(@curxo+(7.0/4)+((i-@@numero)/2.0),@stary-signo*((3.0/4)-(j/2.0)))
	end
   end
  end
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.05)
  @curxo += @width /2
  @curxo += MARJ
  
  if @@numero == 0 then
   cronktor(@curxo,@stary)
  else 
   cronktor(@curxo,@stary-0.5)
   cronktor(@curxo,@stary+0.5)
  end
  
  @@numero += 1
  @@numero %= 2
  return @curxo
 end
 
 
 def cronktor(x,y)
  for i in 0..5 do
   box(x-0.6+Float(i)/10,
       y-0.333,x,y+0.333,
	   -Float(i)/15,-Float(i+1)/15,1)
  end
  #box(x-0.5,y-0.333,x,y+0.333,0,-0.1,1)
  #box(x-0.4,y-0.333,x,y+0.333,-0.1,-0.2,1)
  #box(x-0.3,y-0.333,x,y+0.333,-0.2,-0.3,1)
  #box(x-0.2,y-0.333,x,y+0.333,-0.3,-0.4,1)
 end
 def ducatop
 end
 def ducabot
   @myOkuda.setbarscape
  @myOkuda.bokchoy(-@depth,1.0,10,4)
 end
 
 def numerize
  unless ARGV[2].nil? then @@numero = Integer(ARGV[2]) end
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01

$nodes="JOHNS"
unless ARGV[2].nil? then 
 #$nodes = String(ARGV[2]) 
end

unless ARGV[3].nil? then 
 nummerat(Sidmatrix,Integer(ARGV[3]))
else stutterat(Sidmatrix) end