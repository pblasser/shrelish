require './BotRot.rb'
module BotJax
 include BotRot
 def kobiconn(x,y)
  nowchub = (0.367/2)
  box(x-nowchub,y-0.75,x+nowchub,y+$halfwidth,0,-0.424,3)
 end
 def adamusb(x,y)
   nowchub = 0.25 #adamusb
   box(x-0.25,y-0.75,x+0.25,y+0.15,0,-0.433,4)
 end
 def alpswitch(x,y)
  nowchub = (0.222/2) #alpsSHAFT
  box(x-nowchub,y-0.4,x+nowchub,y+$halfwidth+$halfwidth,0,-0.3,3)
  nowchub = (0.610/2) #alpswitch
  box(x-nowchub,y-0.5,x+nowchub,y-0.1,0,-0.334,3)
 end
 def kyconster(x,y)
  nowchub = (0.266/2) #kyconSHAFT
  box(x-nowchub,y-0.4,x+nowchub,y+$halfwidth+$halfwidth,0,-0.3,3)
  nowchub = (0.5/2) #kyconSTEREO
  box(x-nowchub,y-0.65,x+nowchub,y-0.1,0,-0.351,3)
  nowchub -= $halfwidth
  dux(x-nowchub,y-0.5,x-nowchub,y-0.1-$halfwidth,-0.351,-0.404,1)
  dux(x+nowchub,y-0.5,x+nowchub,y-0.1-$halfwidth,-0.351,-0.404,1)
 end
end
