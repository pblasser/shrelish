
require './Jacksloon.rb'
require './Okuda.rb'



  $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2
 


class Tetbar < Jacksloon

MARJ = 0.05 #0.25
@@numero = 0

 def initialize(starx, stary)
   
  @width = 5.0
  @heigh = 1.12  #####wasz 1.1
  @depth = 0.55 #phor .5
  @@lipp = 0.0
  super(starx, stary)
 end
 def drillus(x,y,s,e) 
 pipe(x,y,2.2/32,0,-@depth)#0.15/32)
 end
 def boxo()
  bronxner = $bitwidth
  @curxo += MARJ
  drillus(@curxo+0.25,@stary,0,0-@depth)
  bronx(@curxo+1.75,@stary-@heighchub,@curxo+(5-0.325),@stary+@heighchub,0,-0.05,1,bronxner)
  drillus(@curxo+4.75,@stary+0.35,0,0-@depth)
  drillus(@curxo+4.75,@stary-0.35,0,0-@depth)

  dux(@curxo+5+MARJ+$halfwidth,@stary-0.25,@curxo+5+MARJ+$halfwidth,@stary+0.25,0,0-@depth,5)
  bronx(@curxo+0.325,@stary-@heighchub,@curxo+1.75,@stary+@heighchub,0,-0.3,3,bronxner)
  
  unless @@numero == 0 then
   rune(@curxo+0.5, @stary-0.6, 0.333, 0, -@depth,4)
  end
  unless @@numero == 3 then
   rune(@curxo+0.5, @stary+0.6, -0.333, 0, -@depth,4)
  end
  
  @@numero += 1
  @@numero %= 4
  pizdepth = -0.43 #-0.4 #-0.355 #phor 0.5
  slitdepth = pizdepth
  tubo(@curxo+1.2,@stary,0.55,-0.3,pizdepth,1)
  dux(@curxo+1.2,@stary-@heighchub, 
   @curxo+1.2,@stary+@heighchub, -0.3, pizdepth,1)

  bronx(@curxo+1.95,@stary-0.2,@curxo+5+MARJ+$halfwidth,@stary+0.2,-0.05,slitdepth,3,bronxner) #0.078
  fox(@curxo+2.06,@stary-1.0/18.0,@curxo+5+MARJ+$halfwidth,@stary+1.0/18.0,slitdepth,0-@depth,1)


  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.05)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
 def numerize
  unless ARGV[2].nil? then @@numero = Integer(ARGV[2]) end
 end
 #okuda overrides
 def ducatop
 end
 def ducabot
  #@myOkuda.bokchoy(-@depth,-1.0,4,12)
  @myOkuda.bokchoy(-@depth,1.0,12,4)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end

$rimmer = 0.005
unless ARGV[3].nil? then 
 nummerat(Tetbar,Integer(ARGV[3]))
else stutterat(Tetbar) end