require './Oval.rb'
def dudderat(d)
end
require './Ovaltop.rb'

 class Ovalbutt < Ovaltop
 def initialize(n,z)
  super(n,z)
 end

 def boxo
  #curno = 1.5
  #while curno<=14.5 do
  balpsMET(1.5,-1.3,0)
  balpsMET(3.1,1.3,0)
  balpsMET(4.7,-1.3,0)
  balpsMET(6.3,1.3,0)
  #curno = curno + 1.5
  #bomron(curno,1.5)
  #  bomron(curno,-1.5)
	#curno= curno +1.5
  #end
 end 

 def ducabot 
 end
end

myclasz = Ovalbutt.new("NODES","ZYGOT")
myclasz.boxo
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"