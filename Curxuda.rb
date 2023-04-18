require './Bot.rb'

class Curxuda < Bot
 def initialize(x,y,z,arr)
  @heigh=0
  @depth=z
  @arr=arr
  super(x,y)
  @curx=arr[0][0]
  @cury=arr[0][1]
  @depth=z
 end

 def pyth(x,y)
  return (x**2 + y**2)**0.5
 end
 def cutt(x,y,z)
  if z < -@depth then z = -@depth end
  printf "G1 X%5.5f Y%5.5f Z%5.5f\n", x+@starx, y+@stary, z

 end


 def seg(a,z)
  x=a[0]
  y=a[1]
  dx=x-@curx
  dy=y-@cury
  len = pyth(dx,dy)
  if (a.size==2) then
   len=len/($bitwidth*10)
   len=len.floor()*2.0
   if len<=0 then cutt(a[0],a[1],z-$bitwidth) 
   else
    zilch = $bitwidth
    for i in 0..len do
     zilch*=-1
     if(z==-@depth) then
      j=i-0.5#+(zilch*3)
      if (j<0)then j=0 end
      cutt(@curx+dx*j/len,@cury+dy*j/len,z)
     end
     cutt(@curx+dx*i/len,@cury+dy*i/len,z+zilch)
    end
   end
  elsif (a.size==3) then
    hyp=pyth(len/2.0,a[2])

    theta=Math.atan2(dy,dx)
    kappa=Math.atan2(len/2.0,a[2])
    angol=Math::PI-theta-kappa
      # printf"G3 len%5.5fhyp%5.5fth%5.5fka%5.5fan%5.5f\n", len,hyp,theta,kappa,angol
    printf "G3 X%5.5f Y%5.5f I%5.5f J%5.5f\n", 

     x+@starx, y+@stary,
         Math.sin(angol)*hyp,
    Math.cos(angol)*hyp
  end
   @curx=x
   @cury=y
 end



 def bok()
  skimtoPoint(@curx+@starx,@cury+@stary,0.1)
  deepo=-0 
  decro=@depth/((@depth/$bitwidth).floor())
  while (deepo>=-@depth) do
   @arr.each {|a|
    seg(a,deepo)
   }

    seg(@arr[0],deepo)

   deepo = deepo- decro  
  end
 end
end

#Curxuda.new(10,10,0.55,[[0,0],[10,10],[5,15,-2],[2,5,-2]]).bok()