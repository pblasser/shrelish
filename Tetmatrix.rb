
require './PlumPott.rb'
require './Okuda.rb'
class Tetmatrix < PlumPott
 $bitwidth = 0.125
 $halfwidth = $bitwidth/2
 #because plumpott is 2mm
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 5.0
  @heigh = 1.95 ###1.95 ####wasz 2!!!

  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end
  def cronktor(x,y)
  for i in 0..5 do
   box(x-0.6+Float(i)/10,
       y-0.333,x,y+0.333,
	   -Float(i)/15,-Float(i+1)/15,1)
  end
 end
  
 def boxo()
  @curxo += MARJ
  rune(@curxo+0.5, @stary-1, 1.0/3, 0,-@depth,3)
  rune(@curxo+0.5, @stary+1, -1.0/3, 0,-@depth,3)
  for i in 0..6 do
   for j in 0..3 do #wasz 5/32
    johnson(@curxo+(5.0/4)+(i/2.0),@stary-(3.0/4)+(j/2.0))
   end
  end
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.05)
  @curxo += @width /2
  #@curxo += @width
  cronx = @curxo - $bitwidth
  cronx -= 0.5
    # cronktor(@curxo,@stary-0.5)
	#    cronktor(@curxo,@stary)
  # cronktor(@curxo,@stary+0.5)
  for i in 1..5 do

    dux(cronx+(i*$bitwidth), 
	 @stary-getBrot, 
	 cronx+(i*$bitwidth), 
	 @stary+getBrot, 
     0, -0.06 - i*(0.06), i)
  end
  @curxo += MARJ
  return @curxo
 end
 def ducatop
 end
 def ducabot
  #@myOkuda.bokchoy(-@depth,1.0)
  @myOkuda.bokchoy(-@depth,1.0,12,8)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01
unless ARGV[3].nil? then $rimmer = Float(ARGV[3]) end
stutterat(Tetmatrix)