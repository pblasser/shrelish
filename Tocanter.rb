
require './PlumPott.rb'
$bitwidth = 1.0/8.0 
$halfwidth = $bitwidth/2.0

class Tocanter < PlumPott
MARJ = 0.05
 def initialize(starx, stary)
   @width = 5.0
  @heigh = 1.12  #####wasz 1.1
  @depth = 0.95
  @zstep = 4
  super(starx,stary)
  spyrtub(starx,stary,3.0/16.0,3.0/16.0)
 end
end
Tocanter.new(0,0)