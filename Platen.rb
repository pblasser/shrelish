require './Bot.rb'
class Plate < Bot
 MARJ = 0.0 #0.25
 @@numero = 0
 def initialize(starx, stary)
  @width = 28.5
  @heigh = 11.25
  @heighchub = @heigh/2
  @depth = 0.55
  @@lipp = 0.0
  @zstep = 4
  super(starx, stary)
 end

 def boxo()
  @curxo += MARJ
  dronk = 1
  box(-0.2,-@heighchub,@width,@heighchub,0,-0.09,1)
  #box(-0.25,-@heighchub,-0.125,@heighchub,0,-$bitwidth,1)

    printf "G0 Z0.5\n"
  printf "G0 X0 Y0 \n"
  printf("m 0 \n")
  @@pentrate = 10
  i=-5
  drillus(0,i,0,-1.6)
  drillus(10,i,0,-1.6)
  drillus(12,i,0,-1.6)
  drillus(14,i,0,-1.6)
  drillus(16,i,0,-1.6)
  drillus(18,i,0,-1.6)
  drillus(20,i,0,-1.6)
  drillus(22,i,0,-1.6)
  drillus(24,i,0,-1.6)
  drillus(26,i,0,-1.6)
  drillus(28,i,0,-1.6)
    i=5
  drillus(0,i,0,-1.6)
  drillus(10,i,0,-1.6)
  drillus(12,i,0,-1.6)
  drillus(14,i,0,-1.6)
  drillus(16,i,0,-1.6)
  drillus(18,i,0,-1.6)
  drillus(20,i,0,-1.6)
  drillus(22,i,0,-1.6)
  drillus(24,i,0,-1.6)
  drillus(26,i,0,-1.6)
  drillus(28,i,0,-1.6)
      printf "G0 Z0.5\n"
  printf "G0 X0 Y0 \n"
 end
 
 def ducatop
 end
 def ducabot
 end
 def numerize
 end
 def duxo
  return @curxo
 end
end
stutterat(Plate)