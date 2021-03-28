printf "G0 X%5.3f \n", Math.atan(1)/Math::PI
for i in 0..32 do
printf "G0 X%5.3f \n", i
end

def over(x,y,z)
 printf "G0 X%5.3f \n", x
 printf "G0 X%5.3f \n", y
 printf "G0 X%5.3f \n", z
end

def over(w, x,y,z)
 printf "G0 X%5.3f \n", w
 over(x,y,z)
end

over(2,4,7,2)
over(5,2,3)