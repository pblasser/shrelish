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

 def self.genarr(w,h,roundel,topnuys,botnuys)
  arr=[]
  arr.push([w/2,h/2-roundel])
 

  arr.push([w/2-roundel,h/2,-roundel])
  

   topnuys.each {|a|
    arr.push([a[0],h/2])
    arr.push([a[1],h/2-@@lipp])
    arr.push([a[2],h/2-@@lipp])
    arr.push([a[3],h/2])
   }



  arr.push([-w/2+roundel,h/2])
  arr.push([-w/2,h/2-roundel,-roundel])
  arr.push([-w/2,-h/2+roundel])





  arr.push([-w/2+roundel,-h/2,-roundel])


   botnuys.each {|a|
    arr.push([a[0],-h/2])
    arr.push([a[1],-h/2+@@lipp])
    arr.push([a[2],-h/2+@@lipp])
    arr.push([a[3],-h/2])
   }

  arr.push([w/2-roundel,-h/2])
  
  arr.push([w/2,-h/2+roundel,-roundel])
  arr.push([w/2,h/2-roundel])
  arr
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
   if len<=0 then cutt(a[0],a[1],z) #z-$bitwidth) 
   elsif (z>-@depth+0.001) then cutt(a[0],a[1],z) 
   else
    zilch = $bitwidth
    #zilch = 0
    cutt(@curx,@cury,z)
    for i in 1..(len-1) do
     #zilch*=-1
     #if(z==-@depth) then
     # j=i-0.5#+(zilch*3)
     # if (j<0)then j=0 end
     # cutt(@curx+dx*j/len,@cury+dy*j/len,z)
     #end
     #cutt(@curx+dx*i/len,@cury+dy*i/len,z+zilch)
     cutt(@curx+dx*(i-0.2)/len,@cury+dy*(i-0.2)/len,z)
     cutt(@curx+dx*i/len,@cury+dy*i/len,z+zilch)
     cutt(@curx+dx*(i+0.2)/len,@cury+dy*(i+0.2)/len,z)
    end
    cutt(@curx+dx,@cury+dy,z)
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
  deepo=-decro
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