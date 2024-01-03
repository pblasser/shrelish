
require './PlumPott.rb'
require './Okuda.rb'
class Quamat < Jacksloon
 MARJ = 0.05 #0.25
 @@numero = 0
 
 def initialize(starx, stary)
  @width = 5.0
  @heigh = 1.95 ###1.95 ####wasz 2!!!

  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end
 
 
 def boxo()
  @curxo += MARJ
  signo = ((@@numero%2)*2) - 1
  digno = ((@@numero/2)*2)-1
  if @@numero == 0 or @@numero==3 then 
   rune(@curxo+0.5, @stary+signo, Float(-signo)/3, 0, -@depth,@zstep)
  end
  designo = signo*digno
   
  for j in 0..3 do #wasz 5/32
   jig = ((j%2)*2)-1
   unless @@numero==3 and j==3 then 
   johnson(@curxo+((10.0-(7*digno*jig))/4),@stary-signo*((3.0/4)-(j/2.0)))
   else johnson(@curxo+(15.0/4),@stary-((3.0/4)-(3/2.0)))
   end
  for i in 0..5 do
    unless j == 3 then
     johnson(@curxo+(5.0/4)+(i/2.0),@stary-signo*((3.0/4)-(j/2.0)))
	end 
	if j == 3 and (i%2)==0 then
	 johnson(@curxo+(7.0/4)+((i-(@@numero%2))/2.0),@stary-signo*((3.0/4)-(j/2.0)))
	end
   end
  end
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.05)
  @curxo += @width /2
  @curxo += MARJ
  
  if @@numero == 0 then
   cronktor(@curxo,@stary)
   end
  if @@numero == 3 then
   cronktor(@curxo,@stary-0.5)
   cronktor(@curxo,@stary+0.5)
  end
  
  @@numero += 1
  @@numero %= 4
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
   #@myOkuda.setbarscape
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
$rimmer = 0.005

$nodes="JOHNS"
unless ARGV[2].nil? then 
 #$nodes = String(ARGV[2]) 
end

unless ARGV[3].nil? then 
 nummerat(Quamat,Integer(ARGV[3]))
else stutterat(Quamat) end