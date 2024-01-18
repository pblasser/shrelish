
require './Jacksloon.rb'
require './Okuda.rb'

 MARJ = 2/25.4
 $yobelow=1


class BenjoSuiteBot < Jacksloon
 
 MARJ = 2/25.4
 @@lipp=MARJ
@@mirero = 0
 def initialize(arvg, starx, stary)
  @supress=false
    @arp=0
  @narp=0
  @argvor = arvg
  @width = mm(34+94+34)
  @heigh = mm(90)
  @depth = 0.77 #0.75
  @dronx = 30 #for dx
  @drony = 45
  super(starx, stary)
 end
 def mm(i) return i/25.4 end
 def dx(x)
  return @curxo + mm(@dronx-x) 
 end
 def dy(y)
  return @stary + mm(y-@drony)
 end

 def KYCON5P(x,y,r)
  kyconsterupsidedown(dx(x),dy(y))
 end
 def KYCONMINIJACK(x,y,r)
  kyconster(dx(x),dy(y))
 end
  def KOBICONDC(x,y,r)
  kobiconn(dx(x),dy(y))
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


 def boxopo()
  @dronx=45
  @drony = 45
  @narp+=1
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
  #todo check number of gs and put jack to the far right
  if (@narp==@arp) then KOBICONDC(-13,90,-90) end
  screw(-27,84,0)
  JOHNSON(-39,81,0)
  KYCONMINIJACK(13,90,0)
  JOHNSON(39,81,0)
  JOHNSON(39,63,0)
  box(dx(35),dy(10),dx(-35),dy(80),0,-$yobelow/8.0,$yobelow)
  #box(dx(-10),dy(63),dx(-35),dy(80),-0.125,-4.0/8,3)
  @dronx=90
 end

 def boxolo()
  @dronx=30
  @drony = 30
  mirr = 1
  if @@mirero > 0
   then mirr = -1 end
  yobel=2
  screw(15+mirr*9,84-15,0)
  brass(15-mirr*9,84-15,0)
  brass(15+mirr*9,6-15,0)
  screw(15-mirr*9,6-15,0)
  JOHNSON(15-mirr*9,38,0)
  box(dx(28),dy(5),dx(2),dy(55),0,-yobel/8.0,yobel) #depth puff, cap puff
  #box(dx(19),dy(40),dx(11),dy(52),0,-2.0/8,2)
  box(dx(7*mirr+21),dy(24),dx(7*mirr+9),dy(36),-0.125,-4.0/8,3)
  @@mirero += 1
  @@mirero %= 2
 end
 def boxoxo()
  @dronx=20
  @drony = 45


  screw(14,6,0)
JOHNSON(5.55227,33.34637,-9)

JOHNSON(14.99318,55.62656,-9)
JOHNSON(14.99449,67.91418,-9)
screw(6,84,0)
JOHNSON(15.14426,79.93885,-9)
JOHNSON(8.99351,44.73316,-9)


yobel=2
tubo(dx(7.37512),dy(15.84292),mm(7),0,-0.125,1)
  box(dx(18),dy(10),dx(2),dy(80),0,-yobel/8.0,yobel)

  #box(dx(19),dy(40),dx(11),dy(52),0,-2.0/8,2)
  #box(dx(7+21),dy(24),dx(7+9),dy(36),-0.125,-4.0/8,3)
 end
 def boxo()
  xard = @curxo
  @curxo += $halfwidth
  arx = @argvor.size
  ar = 0

 @argvor.downcase.each_char { |ch|  
  if (ch=="p") then @arp+=1 end
 }
 @argvor.downcase.each_char { |ch| 
  @curxo += MARJ
  if (ch=="g") then
   boxolo()
  elsif (ch=="p") then
   boxopo()
  elsif (ch=="s") then
   boxoxo()
  end
  @curxo += mm(@dronx)
  ar+=1
  @curxo += MARJ
  if (ar < arx) then 
   #dux(@curxo-mm(20),@stary-mm(9),@curxo+mm(20),@stary-mm(9),0,-0.25,2)
  end
  @curxo += MARJ

 }
 @curxo -= MARJ
 @curxo += $halfwidth
 xard=@curxo-xard
 @myOkuda = Okuda.new(@curxo-xard/2,@stary,xard,@heigh+MARJ*2+$bitwidth,mm(8))
 return @curxo
 end
 def ducabot
  a=Integer(@argvor.size/2+1)
  topnuys = [[3*a,9*a+1]]
  botnuys = [[3*a,9*a+1]]

  @myOkuda.bokchoytwomo(-0.77,1.0,12*a,12,topnuys,botnuys)
 end
 def duxo
  return @curxo
 end
end


$rimmer=0.01
def dudderat(clasz)
 arvg = String(ARGV[0]).downcase
 xarg = yarg = 1
 unless ARGV[1].nil? then yarg = Integer(ARGV[1]) end
 unless ARGV[2].nil? then xarg = Integer(ARGV[2]) end
 broth = clasz.new(arvg,0,0).getBrot + $rimmer
 curyop = (yarg-1)*broth
 curxo = 0
 #cursorx = $halfwidth
 mystuff = clasz.new(arvg,curxo,0)
 for i in 1..xarg do
  if i == 1 then mystuff.numerize end
  curyo = curyop
  for j in 1..yarg do
   mystuff = clasz.new(arvg,curxo,curyo)
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


dudderat(BenjoSuiteBot)
