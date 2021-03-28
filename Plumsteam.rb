
require './PlumPott.rb'
require './Okuda.rb'
require './plumbENGRAVE/plumPHACTORY.rb'
require './plumbENGRAVE/plumDEER.rb'
require './plumbENGRAVE/plumAVDOG.rb'
require './plumbENGRAVE/plumULTRA.rb'
require './plumbENGRAVE/plumGONGUE.rb'

 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2
 $plumPHACTORY.each{|rr| rr[0] /= 7
  rr[1] /= 7
  } 
  $plumDEER.each{|rr| rr[0] /= 4
  rr[1] /= 4
  }
  $plumULTRAarray.each{|rr| rr[0] /= 3
  rr[1] /= 3
  }
  $plumAVDOGarray.each{|rr| rr[0] /= 4
  rr[1] /= 4
  }
  $plumGONGUEarray.each{|rr| rr[0] /= 4
  rr[1] /= 4
  }
 
 
class Plumsteam < PlumPott
 MARJ = 0.05 #0.25
 @@numero = 0
 #@@engravedeep = -0.0625
 def initialize(starx, stary)
  @width = 6
  @heigh = 6-0.05
  @depth = 0.55
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end
 def dy(y)
  return @stary+y
 end
 def dx(x)
  return @curxo+x
 end
 def boxo()
  if (@@numero > 0) then
   @curxo += 0.4
   for i in 1..@@numero do
    alpspot(@curxo,@stary-@heighchub+((i-0.5)*@heigh/(@@numero)),0)
   end
   @curxo += 0.5
  end
  @curxo += MARJ
  widochub = @width/2
  organoPHORM($plumPHACTORYfull,dx(3),dy(0),1)
  

  
  looscrew(dx(0.25),dy(1.75))
  organoPHORM($plumPHACTORY,dx(1),dy(2.5),1)
  alpspot(dx(1),dy(1.5),0)
  organoPHORM($plumAVDOGarray,dx(2),dy(2.5),1)
  alpspot(dx(2),dy(1.5),0)
  organoPHORM($plumULTRAarray,dx(2.85),dy(2.5),1)
  alpspot(dx(3),dy(1.5),0)
  organoPHORM($plumGONGUEarray,dx(4),dy(2.5),1)
  alpspot(dx(4),dy(1.5),0)
  organoPHORM($plumDEER,dx(5),dy(2.5),1)
  alpspot(dx(5),dy(1.5),0)
  looscrew(dx(5.75),dy(1.75))
  
  for i in 0..9 do
   xplaz = dx(5.25-(Float(i)/2))
   johnson(xplaz,dy(0.25))
   if i%2==1 then
    johnson(xplaz,dy(0.75)) else
	johnsoninv(xplaz,dy(0.75),0) end
   if i < 8 then
    lediode(xplaz,dy(-0.25)) end
    #tubo(xplaz,dy(-0.25),3.3/32,0,-@depth,@zstep) end
  end
  out = 0-MARJ-$halfwidth
  box(dx(out),dy(-1.25),dx(0.52),dy(0.75),0,-0.12,1)
  #spyrtub(dx(0.25),dy(0.25),0.22,0.21)
  fox(dx(out),dy(-0.01),dx(0.52),dy(0.51),-0.12,-@depth,3)
  #spyrtub(dx(0.25),dy(-0.75),0.22,0.21)
  fox(dx(out),dy(-1.01),dx(0.52),dy(-0.51),-0.12,-@depth,3)
  looscrew(dx(0.25),dy(-2.75))
  
  johnson(dx(0.75),dy(-2.75))
  johnsoninv(dx(1.25),dy(-2.75),0)
  johnson(dx(1.0),dy(-2.3))
  alpspot(dx(1),dy(-1.5),0)
  johnson(dx(0.75),dy(-0.75))
  johnson(dx(1.25),dy(-0.75))
  
  johnson(dx(1.75),dy(-0.75))
  johnsoninv(dx(2.25),dy(-0.75),180)
  alpspot(dx(2),dy(-1.5),90)
  johnson(dx(1.75),dy(-2.3))
  johnson(dx(2.25),dy(-2.3))
  johnson(dx(2),dy(-2.75))
  
  lediode(dx(2.5),dy(-1.5))
  
  johnson(dx(2.75),dy(-2.75))
  johnson(dx(3.25),dy(-2.75))
  johnson(dx(2.75),dy(-2.25))
  johnson(dx(3.25),dy(-2.25))
  alpspot(dx(3),dy(-1.5),90)
  johnson(dx(2.75),dy(-0.75))
  johnsoninv(dx(3.25),dy(-0.75),180)
  
  johnson(dx(3.75),dy(-0.75))
  johnson(dx(4.25),dy(-0.75))
  johnson(dx(3.75),dy(-1.25))
  johnson(dx(4.25),dy(-1.25))
  alpspot(dx(4),dy(-2),270)
  johnsoninv(dx(3.75),dy(-2.75),0)
  johnson(dx(4.25),dy(-2.75))
  
  lediode(dx(4.5),dy(-2))
  
  johnson(dx(5),dy(-0.75))
  johnson(dx(4.75),dy(-1.2))
  johnson(dx(5.25),dy(-1.2))
  alpspot(dx(5),dy(-2),270)
  johnsoninv(dx(4.75),dy(-2.75),0)
  johnson(dx(5.25),dy(-2.75))

  looscrew(dx(5.75),dy(-2.75))
  
  @curxo += @width /2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+@@lipp*2+$bitwidth,0.25)
  @curxo += @width /2
  @curxo += MARJ
  return @curxo
 end
  def numerize
  unless ARGV[2].nil? then @@numero = Integer(ARGV[2]) end
 end
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoy(-@depth,1.0,12,10)
 end
 def duxo
  #@curxo += $bitwidth
  @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01
stutterat(Plumsteam)