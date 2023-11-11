
require './Bot.rb'
def stutterat(clasz)
end

require './BenjoBot.rb'

 MARJ = 2/25.4
 $yobelow=2


class BenjoGoldBot < Jacksloon
 
 MARJ = 2/25.4
@@numero = 0
 def initialize(arvg, starx, stary)
  @argvor = arvg
  @width = mm(34+94+34)
  @heigh = mm(90)
  @depth = 0.8 #0.75
  @dronx = 30 #for dx
  super(starx, stary)
 end
 def mm(i) return i/25.4 end
 def dx(x)
  return @curxo + mm(@dronx-x) 
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


 def boxobo()
  @dronx=45
  KYCON5P(0,0,180)
  screw(27,6,0)
  JOHNSON(39,9,0)
  JOHNSON(39,45,0)
  JOHNSON(39,27,0)
  screw(-27,6,0)
  JOHNSON(-39,63,0)
  JOHNSON(-39,45,0)
  JOHNSON(-39,27,0)
  JOHNSON(-39,9,0)
  screw(27,84,0)
  KOBICONDC(-13,90,-90)
  screw(-27,84,0)
  JOHNSON(-39,81,0)
  KYCONMINIJACK(13,90,0)
  JOHNSON(39,81,0)
  JOHNSON(39,63,0)
  box(dx(35),dy(10),dx(-35),dy(80),0,-$yobelow/8.0,$yobelow)
  box(dx(-10),dy(63),dx(-35),dy(80),-0.125,-4.0/8,3)
 end

 def boxolo()
  @dronx=30
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
 end
 def boxo()
  xard = @curxo
  @curxo += $halfwidth
  @curxo += MARJ


 argvor.downcase.each_char { |ch| 
  if (ch=="g") then

  elsif (ch=="b") then
    
  elsif (ch=="s") then

  end
  @curxo += mm(@dronx)
  puts ch 


 }

  boxolo()
  
  @curxo += MARJ
  @curxo += MARJ
  dux(@curxo-mm(20),@stary-mm(9),@curxo+mm(20),@stary-mm(9),0,-0.25,2)
  

  @curxo = BenjoBot.new(@curxo,@stary).boxo()



  @curxo += MARJ
  dux(@curxo-mm(20),@stary-mm(9),@curxo+mm(20),@stary-mm(9),0,-0.25,2)  
  @curxo += MARJ
  boxolo()
  @curxo += mm(30)
  @curxo += MARJ

  @curxo += $halfwidth
  xard=@curxo-xard
  @myOkuda = Okuda.new(@curxo-xard/2,@stary,xard,@heigh+MARJ*2+$bitwidth,mm(8))

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




def dudderat()
 argvor = String(ARGV[0])


 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"
end


$rimmer = 0.01
def stutterat(clasz)
 arvg = String(ARGV[0]).downcase
 xarg = yarg = 1
 unless ARGV[1].nil? then yarg = Integer(ARGV[1]) end
 unless ARGV[2].nil? then xarg = Integer(ARGV[2]) end
 broth = clasz.new(0,0).getBrot + $rimmer
 curyop = (yarg-1)*broth
 curxo = 0
 #cursorx = $halfwidth
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
 return curxo
end


dudderat()


#stutterat(BenjoGoldBot)