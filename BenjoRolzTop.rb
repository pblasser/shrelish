

require './PlumPott.rb'
require './Okuda.rb'

#$bitwidth=0.001
#$halfwidth=$bitwidth/2
MARJ = 2/25.4
class ClickTop < PlumPott
#MARJ = 0.42
 
 @@lipp = MARJ
 def cmil(cm)
  return cm/2.54
 end

  def mm(i) return i/25.4 end
 def dy(y)
  return @stary+mm(-y)
 end
 def dx(x)
  return @curxo+mm(x)
 end
 def initialize(starx, stary)
  @width = mm(90)
  @heigh = mm(90)
  super(starx, stary)
 end

 def KYCON5P(x,y,r)
  shallot(dx(y),dy(x),1)
 end
 def KYCONMINIJACK(x,y,r)
  shallot(dx(y),dy(x),-1)
 end
 def KOBICONDC(x,y,r)
  shallot(dx(y),dy(x),-1)
 end
def omron_side(x,y,r)
  microshallot(dx(y),dy(x),1)
 end

 def omron(x,y,r)
  fox(dx(y-7.5),dy(x+7.5),dx(y+7.5),dy(x-7.5),0,-@depth,4)
 end

 def JOHNSON(x,y,r)
  johnson(dx(y),dy(x))
 end
  def HIRSCHMANN(x,y,r)
  spyrtub(dx(y),dy(x),mm(3),0.15/32)
 end
 def balpspot(x,y,r) 
  r=r
  alpspot_exp(dx(y),dy(x),180+r)
 end
 def screw(x,y,r)
  looscrew(dx(y),dy(x))
 end

   def led(x,y,r)
   tubo(dx(y),dy(x),mm(3.5),0,-0.05,1)
   spyrtub(dx(y),dy(x),mm(2.5),0)
   
end

   def led10(x,y,r)
   tubo(dx(y),dy(x),mm(6),0,-0.05,1)
   spyrtub(dx(y),dy(x),mm(5),0)
   
end
   def led8(x,y,r)
   tubo(dx(y),dy(x),mm(5),0,-0.05,1)
   spyrtub(dx(y),dy(x),mm(4),0)
   
end


 def boxo()  
  @curxo += MARJ
  @curxo += $halfwidth

screw(-27,6,180)
led(-32.36989,18.54357,180)
HIRSCHMANN(-39.60975,19.99768,-58)
HIRSCHMANN(-29.95304,25.68761,-118)
HIRSCHMANN(-2.87029,27.93833,-136)
JOHNSON(7.2419,24.06302,-98)
HIRSCHMANN(21.15798,24.90978,-87)
HIRSCHMANN(-0.36719,7.69493,36)
HIRSCHMANN(7.58522,13.56209,99)
HIRSCHMANN(21.72235,14.2828,77)
led8(28.59764,20.1018,180)
JOHNSON(31.82329,30.04575,-26)
HIRSCHMANN(22.5377,40.21029,97)
led(14.7969,42.99393,180)
led(30.41687,58.78123,-167)
led(-3.99771,41.34143,180)
HIRSCHMANN(12.72187,35.71528,100)
HIRSCHMANN(2.88043,38.85297,30)
HIRSCHMANN(7.96363,47.26048,-83)
led8(2.7439,71.12153,-179)
HIRSCHMANN(-6.20597,73.78466,-66)
HIRSCHMANN(-20.38942,79.15864,-180)
led(-26.93723,73.77542,180)
HIRSCHMANN(-32.51532,67.81958,-85)
JOHNSON(-20.05551,67.54927,-71)
HIRSCHMANN(-25.16238,55.74449,-95)
led10(-26.84746,45.80811,180)
HIRSCHMANN(-17.86245,49.10798,159)
JOHNSON(-7.38662,49.16754,-6)
HIRSCHMANN(-8.94864,35.85991,33)
HIRSCHMANN(-19.63405,38.77962,79)
HIRSCHMANN(-29.5227,35.84003,-11)
HIRSCHMANN(-36.85465,42.2773,-41)
JOHNSON(-35.5227,52.84003,44)
HIRSCHMANN(-33.95454,79.03484,-96)
screw(-27,84,0)
HIRSCHMANN(3.14758,80.18651,-147)
HIRSCHMANN(38.18079,72.76794,106)
HIRSCHMANN(35.20968,82.59645,157)
screw(27,84,0)
led(31.3841,75.9549,-167)
JOHNSON(22.91058,73.44359,166)
HIRSCHMANN(11.81491,72.95022,141)
HIRSCHMANN(7.78142,63.02699,43)
HIRSCHMANN(23.51425,61.13749,-91)
JOHNSON(18.27382,51.10759,-83)
JOHNSON(31.48011,49.97028,161)
HIRSCHMANN(36.50584,62.62857,149)
HIRSCHMANN(39.06322,20.6867,118)
HIRSCHMANN(32.77572,12.15595,57)
screw(27,6,180)
led10(-1.9824,17.81074,180)
HIRSCHMANN(-9.9154,11.48462,-18)
JOHNSON(-23.40758,17.05303,-37)
HIRSCHMANN(-11.22956,21.98135,-44)
HIRSCHMANN(-33.49836,10.8068,-58)
JOHNSON(-3.18136,62.59018,-139)


  @curxo += @width/2
  @myOkuda = Okuda.new(@curxo,@stary,@width+MARJ*2+$bitwidth,@heigh+MARJ*2+$bitwidth,mm(8))
  @curxo += @width/2
  
  @curxo += MARJ
    @curxo += $halfwidth
  return @curxo

 end
 def ducatop
 end
 def ducabot
  @myOkuda.bokchoy(-@depth,1.0,16,16)
 end
 def duxo
 # @curxo += $bitwidth
  return @curxo
 end
end
$rimmer = 0.01

stutterat(ClickTop)
