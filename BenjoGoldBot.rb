
require './Bot.rb'
def stutterat(clasz)
end

require './BenjoBot.rb'

 MARJ = 2/25.4
 $yobelow=2


class BenjoGoldBot < Jacksloon
 
 MARJ = 2/25.4
@@numero = 0
 def initialize(starx, stary)
  @width = mm(32+94+32)
  @heigh = mm(90)
  @depth = 0.8 #0.75
  
  super(starx, stary)
 end
 def mm(i) return i/25.4 end
 def dx(x)
  return @curxo + mm(30-x) 
 end
 def dy(y)
  return @stary + mm(y-30)
 end

 def JOHNSON(x,y,r)
  tubo(dx(x),dy(y),mm(4),0,-0.25,2)
 end
  def brass(x,y,r)
  tubo(dx(x),dy(y),0.14,0,-0.5,4)
 end
 def screw(x,y,r)
  screw = -0.16
  drillus(dx(x),dy(y),0,screw)
 end
 def boxolo()
  #@curxo += MARJ
  #@curxo += $halfwidth
  mirr = 1
  if @@numero > 0
   then mirr = -1 end

  screw(15+mirr*9,54,0)
  brass(15-mirr*9,54,0)
  brass(15+mirr*9,6,0)
  screw(15-mirr*9,6,0)
  JOHNSON(15-mirr*9,38,0)
  box(dx(28),dy(10),dx(2),dy(50),0,-$yobelow/8.0,$yobelow)
  box(dx(19),dy(40),dx(11),dy(52),0,-2.0/8,2)
  box(dx(7*mirr+21),dy(24),dx(7*mirr+9),dy(36),-0.125,-4.0/8,3)
  

  @@numero += 1
  #  @curxo += $halfwidth
  return @curxo
 end
 def boxo()
  @curxo += MARJ
  @curxo += $halfwidth
  boxolo()
  @curxo += mm(30)
  dux(@curxo-mm(20),@stary-mm(9),@curxo+mm(20),@stary-mm(9),0,-0.25,2)
  
  @curxo -= $halfwidth
  @curxo = BenjoBot.new(@curxo,@stary).boxo()
  @curxo -= $halfwidth
  dux(@curxo-mm(20),@stary-mm(9),@curxo+mm(20),@stary-mm(9),0,-0.25,2)

  boxolo()
  @curxo += mm(30)
  @curxo += MARJ

  @myOkuda = Okuda.new(@curxo-mm(32+47),@stary,@width+$bitwidth,@heigh+MARJ*2+$bitwidth,mm(8))

  @curxo += $halfwidth
  return @curxo


 end
 def ducabot
  topnuys = [[3,10]]
  botnuys = [[4,9]]
  @myOkuda.bokchoytwomo(-0.78,1.0,12,12,topnuys,botnuys)
 end
 def duxo
  return @curxo
 end
end



def mm(x) return x/25.4 end
  $rimmer=0.01

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



def dudderat()
 argument = 0
 cursorx = $halfwidth
 into = Integer(ARGV[0]) rescue nil
 if into  then
  return stutterat(BenjoBot)
 end
 while  (ARGV[argument].nil?) ==false
  argvor = String(ARGV[argument])
  if argvor=="benjolin" then
    $yobelow=2
   cursorx = BenjoBot.new(cursorx,0).boxo()
  elsif argvor=="gold" then
    $yobelow=2
   cursorx = GoldBot.new(cursorx,0).boxo()
  end
  argument = argument + 1
  unless (ARGV[argument].nil?) then 
    BenjoBot.new(0,0).dux(cursorx-mm(20),mm(-9),cursorx+mm(20),mm(-9),0,-0.25,2)
    cursorx+=MARJ

  end
 end
 cursorx += $halfwidth

 myOkuda = Okuda.new(cursorx/2,0,cursorx,mm(94)+$bitwidth,mm(8))
  topnuys = [[3,9]]
  topnuys[0]=topnuys[0].map{|e| e * argument}
  topnuys[0][1]+=1
  botnuys = [[3,9]]
  botnuys[0]=botnuys[0].map{|e| e * argument}
  botnuys[0][0]+=1
  myOkuda.bokchoytwomo(-0.78,1.0,12*argument,12,topnuys,botnuys)
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"
end

#dudderat()


stutterat(BenjoGoldBot)