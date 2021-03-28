
require './Bot.rb'
require 'Complex'
include Math
require './Jacksloon.rb'
#require './dudefunks.rb'
require './Okuda.rb'


class Shtar < Jacksloon
 def initialize(starx, stary)
  @width = 12
  @heigh = 8
  
  @depth = 1.0
  @zstep = @depth/7.0
  @sensoreft = -2.8
  @sensorite = 3.6
  @q = 5.2
  #q was 4.7 then i ran a few protos at 5 strict
  #then i pulled the shape out to 5.2 for
  #the sake of bridge placement of the triangulated
  #string (about quarter inch adjusto)
  super(starx, stary)
 end

 
 def plastique()
 @depth = 0.125
 $bitwidth = 2.0/25.4
 $halfwidth = $bitwidth/2
 plasthick = -0.125
 

  slott = 0.125
  pront = lambda(){|x,y| 
   slotf = slott/2.0
   fox(x-slotf,y,x+slotf,y+0.3,0,plasthick,2)
   fox(x-0.3,y,x+0.3,y+0.7,0,plasthick,2)  #start 0.6, 0.7, 0.8@@@#@!
  }

  for i in 0..13 do
   for j in 0..6 do
   pront.call(0.7*i,0.8*j)
   end
  end
 end
 
 
end

$rimmer = 0.01

def dudderat(clasz)
  broth = clasz.new(-6,0)
  broth.plastique()
  printf "G0 Z0.5\n"
  printf "G0 X0 Y0 \n"
end


dudderat(Shtar)