
require './Bot.rb'

class Burp < Bot
 MARJ = 0.05 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 6
  @heigh = 1.2

  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
  @@feedrate = 30
 end
end
b = Burp.new(0,0)
b.retrax(0.1)

#for i in 0..120 do
#b.cutoPoint(3,0)
#b.cutoPoint(-3,0)
#end
#
for i in 0..120 do
b.cutoPoint(0,3)
b.cutoPoint(0,-3)
end