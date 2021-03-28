
require './Jacksloon.rb'
require './Okuda.rb'
class Sidbar < Jacksloon

MARJ = 0.05 #0.25
@@numero = 0
 def initialize(starx, stary)
  @width = 5.0
  @heigh = 1.12  #####wasz 1.1
  @depth = 0.55 #phor .5
  @@lipp = 0.0
  super(starx, stary)
 end

 def boxo()
  @curxo += MARJ
  retrax(0.1)
  drillus(@curxo+0.25,@stary,0,0-@depth)
  box(@curxo+1.75,@stary-@heighchub,@curxo+(5-0.325),@stary+@heighchub,0,-0.05,1)
  drillus(@curxo+4.75,@stary+0.35,0,0-@depth)
  drillus(@curxo+4.75,@stary-0.35,0,0-@depth)
  retrax(0.1)
  dux(@curxo+5+MARJ+$halfwidth,@stary-0.25,@curxo+5+MARJ+$halfwidth,@stary+0.25,0,0-@depth,5)
  box(@curxo+0.325,@stary-@heighchub,@curxo+1.75,@stary+@heighchub,0,-0.25,2)
  
  if @@numero == 5 then
   rune(@curxo+0.5, @stary-0.6, 0.333, 0, -@depth,3)
  end
  if @@numero == 1 then
   rune(@curxo+0.5, @stary+0.6, -0.333, 0, -@depth,3)
  end
  
  @@numero += 1
  @@numero %= 7
  pizdepth = -0.366 #-0.4 #-0.355 #phor 0.5
  slitdepth = -0.366
  tubo(@curxo+1.2,@stary,0.55,-0.2,pizdepth,1)
  cutoPoint(@curxo+1.2,@stary)
  #dux(@curxo+1.25,@stary-@heighchub,@curxo+1.25,@stary+@heighchub,-0.2,0.05+pizdepth,1)
  
  #box(@curxo+1.75,@stary-@heighchub,@curxo+(5-0.325),@stary+@heighchub,0,-0.05,1)
  fox(@curxo+1.95,@stary-0.2,@curxo+5+MARJ,@stary+0.2,-0.05,slitdepth,3)
  dux(@curxo+2.12,@stary,@curxo+5+MARJ,@stary,-0.05,0-@depth,4)
  #drillus(@curxo+4.75,@stary+0.35,0,0-@depth)
  #drillus(@curxo+4.75,@stary-0.35,0,0-@depth)

  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.05)
  @curxo += @width /2
  @curxo += MARJ
  
  #@curxo += @width
  #@curxo += MARJ
  return @curxo
 end
 def numerize
  unless ARGV[2].nil? then @@numero = Integer(ARGV[2]) end
 end
 def ducatop
 end
 def ducabot
  #@myOkuda.setbarscape
  #@myOkuda.bokchoy(-0.5,1.0,10,4)
   @myOkuda.setbarscape
  @myOkuda.bokchoy_barcrisper(-0.5,-1.0,12,4)
 # @myOkuda.bokchoy(-0.55,-1.0,4,10)
 end
 def duxo
  @curxo += $bitwidth
  return @curxo
 end
 
end
$rimmer = 0.01
def stutterat(clasz)
 xarg = yarg = 1
 unless ARGV[0].nil? then yarg = Integer(ARGV[0]) end
 unless ARGV[1].nil? then xarg = Integer(ARGV[1]) end
 broth = clasz.new(0,0).getBrot + $rimmer
 curyop = -(yarg-1)*broth
 curxo = 0
 mystuff = clasz.new(curxo,0)
 for i in 1..xarg do
  if i == 1 then mystuff.numerize end
  curyo = curyop
  for j in 1..yarg do
   mystuff = clasz.new(curxo,curyo)
   mystuff.boxo()
   mystuff.ducabot()
   curyo += broth*2
  end
  curxo = mystuff.duxo() + $rimmer*2
 end
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"
end



def nummerat(clasz,num)
 xarg = yarg = 1
 unless ARGV[0].nil? then yarg = Integer(ARGV[0]) end
 unless ARGV[1].nil? then xarg = Integer(ARGV[1]) end
 broth = clasz.new(0,0).getBrot + $rimmer
 curyop = -(yarg-1)*broth
 curxo = 0
 mystuff = clasz.new(curxo,0)
 for i in 1..xarg do
  if i == 1 then mystuff.numerize end
  curyo = curyop
  for j in 1..yarg do
   mystuff = clasz.new(curxo,curyo)
      mystuff.numerset(num) 
   mystuff.boxo()
   mystuff.ducabot()
   curyo += broth*2
  end
  curxo = mystuff.duxo() + $rimmer*2
 end
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"
end



unless ARGV[3].nil? then 
 nummerat(Sidbar,Integer(ARGV[3]))
else stutterat(Sidbar) end