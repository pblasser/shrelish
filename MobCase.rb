
require './Jacksloon.rb'
require './Okuda.rb'

class Mobcase < Jacksloon
MARJ = 0.42

 def initialize(starx, stary)
  stary = 0
  @heigh = 5.1
    @botrail = stary-(@heigh/2)
  @toprail = -@botrail
  @topcutt = stary+(4.3/2)
  @widthhp = 72
  @width = hp(@widthhp)
  @hawi = @width / 2
  @depth = 1.5 ###AHHHA
  @marquisdep=-0.15
  @raildep = -0.7
  @drilldep = -0.25
  @@lipp = 0
  super(starx, stary)
 end
 def mmil(mm)
  return mm/25.4
 end
 def hp(h)
  return h * 0.2
 end
 def ducatop
 end
 def ducabot
 end
 def boxo()
  box(0-$halfwidth, 2, @width+$halfwidth, @toprail, 0, @marquisdep, 1)
  box(0-$halfwidth, @botrail, @width+$halfwidth, -2, 0, @marquisdep, 1)
  dux(0-$halfwidth, @topcutt-$halfwidth, @width+$halfwidth, @topcutt-$halfwidth, 0, @raildep, 4)
  dux(0-$halfwidth, -@topcutt+$halfwidth, @width+$halfwidth, -@topcutt+$halfwidth, 0, @raildep, 4)
  
  for i in 0..@widthhp do
   if ((i-1)%4)==0 then
    drillus(hp(i+0.5),2.411,@marquisdep,@drilldep)
   end
  end
  for i in 0..@widthhp do
   ii= @widthhp - i
   if ((ii-1)%4)==0 then
    drillus(hp(ii+0.5),-2.411,@marquisdep,@drilldep)
   end
  end
  skimtoPoint(0,0,0.1)
  randbox($halfwidth,@botrail+0.75,@width-$halfwidth,@toprail-0.75,-0.75,-1.5,4)
  @curxo += @width
  return @curxo
 end
 def duxo
 @curxo += $bitwidth
  return @curxo
 end
end


stutterat(Mobcase)