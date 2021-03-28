
class Centr
 @@feedrate = 40
 def initialize(x,y)
  @x = x
  @y = y
 end
 def cutoPoint(x,y)
  printf "G1 X%5.3f Y%5.3f F%d\n", x, y, @@feedrate
 end
end

class Rotor < Centr
 def arc(r,p,k)
  sggo = Integer(r*16+2)
  numsegs = Integer(sggo*k)
  if numsegs < 0 then numsegs = -numsegs end
  start = p * numsegs
  ended = (p+k) * numsegs
  for i in 0..numsegs do
   xx = r*Math.sin((p*sggo+k*i)*Math::PI/numsegs)
   yy = r*Math.cos((p*sggo+k*i)*Math::PI/numsegs)
   cutoPoint(@x+xx,@y+yy)
  end
 end
end

class Ritor < Centr
end

Rotor.new(0,0)::arc(1,0,2)
Rotor.new(2,0)::arc(1,0,-1)
Rotor.new(2,2)::arc(1,0.5,1.5)
Rotor.new(4,0)::arc(1,1,1.5)
Rotor.new(6,0)::arc(1,1.5,2)