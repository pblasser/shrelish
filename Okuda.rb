
#require 'Complex'
class Nucleus 
 def initialize(x,y,z)
  movNucleus(x,y,z)
 end
 def movNucleus(x,y,z)
  @nux = x
  @nuy = y
  @nuz = z
 end
end

class Hydrogen < Nucleus
 @@feedrate = 40
 def initialize(x,y,z,r,t)
  super(x,y,z)
  @roundel = r
  @theta = t
 end
 def cut()
  oiler = polaron(@roundel,@theta)
  deepo = @nuz
  if @nuz < @zdepth then
   deepo = @zdepth
  end
  printf "G1 X%5.5f Y%5.5f Z%5.5f\n",# F%d\n", 
   @xcentre+@nux+oiler[0], @ycentre+@nuy+oiler[1], deepo
 end
 def cutt(x,y,z)
  oiler = polaron(@roundel,@theta)
  
  printf "G1 X%5.5f Y%5.5f Z%5.5f\n",# F%d\n", 
   @xcentre+x+oiler[0], @ycentre+y+oiler[1], z
 end
 def polaron(r,theta)
  euler=Complex.polar(r,Math::PI*theta)
  return [euler.real,euler.imag]
 end

  
 def arcElectron(momentum,zd)
   numsegs = Integer(momentum*@roundel*16+4)
  numsegs = 32
  for i in 1..numsegs do
   cut
   @theta += momentum/numsegs
   @nuz += zd/numsegs
  end
end

 def arcElectron(momentum,zd)
   deepo = @nuz
  if @nuz < @zdepth then
   deepo = @zdepth
  end
  oilstart=polaron(@roundel,@theta)
  cut
  @theta+=momentum
  oilend=polaron(@roundel,@theta)
  if momentum>0 then 
  printf "G3 X%5.5f Y%5.5f I%5.5f J%5.5f Z%5.5f\n",
    @xcentre+@nux+oilend[0], @ycentre+@nuy+oilend[1], 
    -oilstart[0], -oilstart[1],
    deepo
  else
     printf "G2 X%5.5f Y%5.5f I%5.5f J%5.5f Z%5.5f\n",
    @xcentre+@nux+oilend[0], @ycentre+@nuy+oilend[1], 
    oilstart[0], oilstart[1],
    deepo  
  end
 end
end

class Okuda < Hydrogen
 @@pentrate = 30
 def initialize(x,y,w,h,r)
  @wchub = Float(w)/2
  @hchub = Float(h)/2
  @xcentre = x
  @ycentre = y
  @electron = 0
  @okudanuk = -1.0/4.0
  @oscacc = 0
  retrax(0.1)
  oiler=polaron(Math.sqrt(2),@okudanuk)
  @barscape=false
  super(oiler[0]*(@wchub-r),oiler[1]*(@hchub-r),0,r,0)
 end
 def retrax(z)
  printf "G0 Z%5.5f\n",z
 end
 
 def bokcho(depth,climb,xsegs,ysegs)
  retrax 0.1
  @zdepth = depth
  printf "G0 X%5.5f Y%5.5f Z%5.5f\n",# F%d\n", 
   @xcentre+@wchub, @ycentre-@hchub, 0.1, @@feedrate
  @okudanuk += climb/2.0 
  #depth -= 0.1
  @tiers = Integer(depth / 0.12) 
  while (@nuz >= depth) do
   @nuz -= depth / @tiers
   for i in 1..4 do
    oiler=polaron(Math.sqrt(2),@okudanuk)
    @nux = oiler[0]*(@wchub-@roundel)
    @nuy = oiler[1]*(@hchub-@roundel)
    #@nuz -= 0.05
    @@feedrate = 30
    arcElectron(climb/2.0,0)
    @okudanuk += climb/2.0 
    euler=polaron(Math.sqrt(2),@okudanuk)
    euler[0] -= oiler[0]
    euler[1] -= oiler[1]
    if i == 1 or i == 3 then numzegs=xsegs end
	if i == 2 or i == 4 then numzegs=ysegs end
    for j in 1..numzegs 
     @oscacc += 1
     trank = (@oscacc % 2) * 2 - 1
     @@feedrate = 35  - trank*5
     @nux += euler[0]*(@wchub-@roundel)/numzegs
     @nuy += euler[1]*(@hchub-@roundel)/numzegs
     if i == 1 then 
      if j == 9 then 
       @nuy -= 0.05 end
      if j == 14 then
       @nuy += 0.05
      end
     end
	 if i == 3 then 
      if j == numzegs-13 then 
       @nuy += 0.05 end
      if j == numzegs-8 then
       @nuy -= 0.05
      end
     end
     @nuz += 0.2 * trank 
	 if @nuz < depth then
	  cutt(@nux - euler[0]*(@wchub-@roundel)/(2*numzegs),
	   @nuy - euler[1]*(@hchub-@roundel)/(2*numzegs),
	   depth)
	  if j != numzegs then
	  cutt(@nux + euler[0]*(@wchub-@roundel)/(2*numzegs),
	   @nuy + euler[1]*(@hchub-@roundel)/(2*numzegs),
	   depth) end
	 else cut end
    end 
   end
  @@feedrate = 40
  end
 end
 
 def bokchoy(depth,climb,xsegs,ysegs)
  retrax 0.1
  @zdepth = depth
  printf "G0 X%5.5f Y%5.5f Z%5.5f\n",# F%d\n", 
   @xcentre+@wchub, @ycentre-@hchub, 0.1
   @okudanuk = -climb/4.0     ###############??????????
  @okudanuk += climb/2.0 

  #depth -= 0.1
  @tiers = Integer(depth / 0.12) 
  while (@nuz >= depth) do
   @nuz -= depth / @tiers
   for i in 1..4 do
    oiler=polaron(Math.sqrt(2),@okudanuk)
    @nux = oiler[0]*(@wchub-@roundel)
    @nuy = oiler[1]*(@hchub-@roundel)
    #@nuz -= 0.05
    arcElectron(climb/2.0,0)
    @okudanuk += climb/2.0 
    euler=polaron(Math.sqrt(2),@okudanuk)
    euler[0] -= oiler[0]
    euler[1] -= oiler[1]
    if i == 1 or i == 3 then numzegs=xsegs end
	if i == 2 or i == 4 then numzegs=ysegs end
    for j in 1..numzegs 
     @oscacc += 1
     trank = (@oscacc % 2) * 2 - 1
     @nux += euler[0]*(@wchub-@roundel)/numzegs
     @nuy += euler[1]*(@hchub-@roundel)/numzegs
     #if i == 1 then 
     # if j == 2 then 
     #  @nuy -= 0.05 end
     # if j == 11 then
     #  @nuy += 0.05
     # end
     #end
     @nuz += 0.2 * trank 
	 if @nuz < depth then
	  cutt(@nux - euler[0]*(@wchub-@roundel)/(2*numzegs),
	   @nuy - euler[1]*(@hchub-@roundel)/(2*numzegs),
	   depth)
	  if j != numzegs then
	  cutt(@nux + euler[0]*(@wchub-@roundel)/(2*numzegs),
	   @nuy + euler[1]*(@hchub-@roundel)/(2*numzegs),
	   depth) end
	 else cut end
    end 
   end

  end
 end
 #now we do it from 6 oclock
  def setbarscape() @barscape=true end
  def bokchoy(depth,climb,xsegs,ysegs)
  retrax 0.1
  @zdepth = depth
  printf "G0 X%5.5f Y%5.5f Z%5.5f\n",# F%d\n", 
   @xcentre-(climb*@wchub), @ycentre-(climb*@hchub), 0.1
  #@okudanuk -= climb/2.0 
  
  #   @okudanuk = -climb/4.0     ###############??????????
  #@okudanuk += climb/2.0 
  if climb==1 then @theta = -0.5
  else @theta = 0 end
  
  #@theta = 0.5 + climb/2.0 
  #depth -= 0.1
  @tiers = Integer(depth / 0.12) 
  while (@nuz >= depth) do
   @nuz -= depth / @tiers
   for i in 1..4 do
    
    oiler=polaron(Math.sqrt(2),@okudanuk)
    @nux = oiler[0]*(@wchub-@roundel)
    @nuy = oiler[1]*(@hchub-@roundel)
    #@nuz -= 0.05
    @@feedrate = 30
	if @barscape and i==2 and @nuz < -0.4 then
     oldnose = @nuz	
	 @nuz=0
	 arcElectron(climb/2.0,0)
	 @nuz = oldnose
	else
    arcElectron(climb/2.0,0)
	end

    @okudanuk += climb/2.0 
    euler=polaron(Math.sqrt(2),@okudanuk)
    euler[0] -= oiler[0]
    euler[1] -= oiler[1]
    if i == 1 or i == 3 then numzegs=ysegs end #flipt these guys
	if i == 2 or i == 4 then numzegs=xsegs end
    for j in 1..numzegs 
     @oscacc += 1
     trank = (@oscacc % 2) * 2 - 1
     @@feedrate = 35  - trank*5
     @nux += euler[0]*(@wchub-@roundel)/numzegs
     @nuy += euler[1]*(@hchub-@roundel)/numzegs
     #if i == 1 then 
     # if j == 2 then 
     #  @nuy -= 0.05 end
     # if j == 11 then
     #  @nuy += 0.05
     # end
     #end
     @nuz += 0.2 * trank 
	 if @nuz < depth then
	  cutt(@nux - euler[0]*(@wchub-@roundel)/(2*numzegs),
	   @nuy - euler[1]*(@hchub-@roundel)/(2*numzegs),
	   depth)
	  if j != numzegs then
	  cutt(@nux + euler[0]*(@wchub-@roundel)/(2*numzegs),
	   @nuy + euler[1]*(@hchub-@roundel)/(2*numzegs),
	   depth) end
	 else cut end
    end 
   end

  end
 end
 
 
  def bokchoy_barcrisper(depth,climb,xsegs,ysegs)
  retrax 0.1
  @zdepth = depth
  printf "G0 X%5.5f Y%5.5f Z%5.5f\n",# F%d\n", 
   @xcentre+(climb*@wchub), @ycentre-(climb*@hchub), 0.1
  #@okudanuk -= climb/2.0 
  
  #   @okudanuk = -climb/4.0     ###############??????????
  #@okudanuk += climb/2.0 
  @theta = -climb/2.0
  @okudanuk = 0.75 #was too hard to figure out! @theta/2.0
  #if climb==1 then @theta = -0.5
  #else @theta = 0 end
  
  #@theta = 0.5 + climb/2.0 
  #depth -= 0.1
  @tiers = Integer(depth / 0.12) 
  while (@nuz >= depth) do
   @nuz -= depth / @tiers
   for i in 1..4 do
    if @nuz < depth then
	 if i==3 then @@feedrate=5 
	 else @@feedrate = 40 end
	end
    oiler=polaron(Math.sqrt(2),@okudanuk)
    @nux = oiler[0]*(@wchub-@roundel)
    @nuy = oiler[1]*(@hchub-@roundel)
    arcElectron(1.0/2.0,0)

    @okudanuk += 0.5 #climb/2.0 
    euler=polaron(Math.sqrt(2),@okudanuk)
    euler[0] -= oiler[0]
    euler[1] -= oiler[1]
    if i == 1 or i == 3 then numzegs=ysegs end #flipt these guys
	if i == 2 or i == 4 then numzegs=xsegs end
    for j in 1..numzegs 
     @oscacc += 1
     trank = (@oscacc % 2) * 2 - 1
     #@@feedrate = 35  - trank*5
     @nux += euler[0]*(@wchub-@roundel)/numzegs
     @nuy += euler[1]*(@hchub-@roundel)/numzegs
     #if i == 1 then 
     # if j == 2 then 
     #  @nuy -= 0.05 end
     # if j == 11 then
     #  @nuy += 0.05
     # end
     #end
     @nuz += 0.2 * trank 
	 if @nuz < depth then
	  your = depth
	  if i==3 then 
	   @@feedrate=5 
	   your=depth+0.1
	  else 
	   @@feedrate = 40 
	  end
	  cutt(@nux - euler[0]*(@wchub-@roundel)/(2*numzegs),
	   @nuy - euler[1]*(@hchub-@roundel)/(2*numzegs),
	   your)
	  if j != numzegs then
	   cutt(@nux + euler[0]*(@wchub-@roundel)/(2*numzegs),
	   @nuy + euler[1]*(@hchub-@roundel)/(2*numzegs),
	   your) end
	 else cut end
    end 
   end
  @@feedrate = 40
  end
 end
 
 
 
 
 def bokchoydeluxe(depth,climb,xsegs,ysegs,topnuys,botnuys)
  retrax 0.1
  @zdepth = depth
  printf "G0 X%5.5f Y%5.5f Z%5.5f\n",# F%d\n", 
   @xcentre+@wchub, @ycentre-@hchub, 0.1
  @okudanuk += climb/2.0 
  #depth -= 0.1
  @tiers = Integer(depth / 0.12) 
  while (@nuz >= depth) do
   @nuz -= depth / @tiers
   for i in 1..4 do
    oiler=polaron(Math.sqrt(2),@okudanuk)
    @nux = oiler[0]*(@wchub-@roundel)
    @nuy = oiler[1]*(@hchub-@roundel)
    #@nuz -= 0.05
    @@feedrate = 30
    arcElectron(climb/2.0,0)
    @okudanuk += climb/2.0 
    euler=polaron(Math.sqrt(2),@okudanuk)
    euler[0] -= oiler[0]
    euler[1] -= oiler[1]
    if i == 1 or i == 3 then numzegs=xsegs end
	if i == 2 or i == 4 then numzegs=ysegs end
    for j in 1..numzegs 
     @oscacc += 1
     trank = (@oscacc % 2) * 2 - 1
     @@feedrate = 35  - trank*5
     @nux += euler[0]*(@wchub-@roundel)/numzegs
     @nuy += euler[1]*(@hchub-@roundel)/numzegs
     if i == 1 then 
	  topnuys.each{|rr| 
	   if j == rr[0] then 
	    @nuy -= 0.05 end
	   if j == rr[1] then 
	    @nuy += 0.05 end
       }
	 end
     if i == 3 then 
	  botnuys.each{|rr| 
	   if j == rr[0] then 
	    @nuy += 0.05 end
	   if j == rr[1] then 
	    @nuy -= 0.05 end
       }
	 end
     @nuz += 0.2 * trank 
	 if @nuz < depth then
	  cutt(@nux - euler[0]*(@wchub-@roundel)/(2*numzegs),
	   @nuy - euler[1]*(@hchub-@roundel)/(2*numzegs),
	   depth)
	  if j != numzegs then
	  cutt(@nux + euler[0]*(@wchub-@roundel)/(2*numzegs),
	   @nuy + euler[1]*(@hchub-@roundel)/(2*numzegs),
	   depth) end
	 else cut end
    end 
   end
  @@feedrate = 40
  end
 end

 def arcElectronTwomo(momentum,zd)
   deepo = @nuz
  #if @nuz < @zdepth then
  # deepo = @zdepth
  #end
  oilstart=polaron(@roundel,@theta)
  
  #cut
    oiler = polaron(@roundel,@theta)
  deepo = @nuz
  #if @nuz < @zdepth then
  # deepo = @zdepth
  #end
  printf "G1 X%5.5f Y%5.5f Z%5.5f\n",# F%d\n", 
   @xcentre+@nux+oiler[0], @ycentre+@nuy+oiler[1], deepo

  @theta+=momentum
  oilend=polaron(@roundel,@theta)
  if momentum>0 then 
  printf "G3 X%5.5f Y%5.5f I%5.5f J%5.5f Z%5.5f\n",
    @xcentre+@nux+oilend[0], @ycentre+@nuy+oilend[1], 
    -oilstart[0], -oilstart[1],
    deepo
  else
     printf "G2 X%5.5f Y%5.5f I%5.5f J%5.5f Z%5.5f\n",
    @xcentre+@nux+oilend[0], @ycentre+@nuy+oilend[1], 
    oilstart[0], oilstart[1],
    deepo  
  end
 end


 def bokchoytwomo(depth,climb,xsegs,ysegs,topnuys,botnuys)
  retrax 0.1
  @zdepth = depth
  printf "G0 X%5.5f Y%5.5f Z%5.5f\n",# F%d\n", 
   @xcentre+@wchub, @ycentre-@hchub, 0.1
  @okudanuk += climb/2.0 
  #depth -= 0.1
  @tiers = Integer(depth / 0.12) 
  while (@nuz >= depth) do
   @nuz -= depth / @tiers
   for i in 1..4 do
    oiler=polaron(Math.sqrt(2),@okudanuk)
    @nux = oiler[0]*(@wchub-@roundel)
    @nuy = oiler[1]*(@hchub-@roundel)
    #@nuz -= 0.05
    @@feedrate = 30
    arcElectronTwomo(climb/2.0,0)
    @okudanuk += climb/2.0 
    euler=polaron(Math.sqrt(2),@okudanuk)
    euler[0] -= oiler[0]
    euler[1] -= oiler[1]
    if i == 1 or i == 3 then numzegs=xsegs end
  if i == 2 or i == 4 then numzegs=ysegs end
    for j in 1..numzegs 
     @oscacc += 1
     trank = (@oscacc % 2) * 2 - 1
     @@feedrate = 35  - trank*5
     @nux += euler[0]*(@wchub-@roundel)/numzegs
     @nuy += euler[1]*(@hchub-@roundel)/numzegs
     if i == 1 then 
    topnuys.each{|rr| 
     if j == rr[0] then 
      @nuy -= 2/25.4 end
     if j == rr[1] then 
      @nuy += 2/25.4 end
       }
   end
     if i == 3 then 
    botnuys.each{|rr| 
     if j == rr[0] then 
      @nuy += 2/25.4 end
     if j == rr[1] then 
      @nuy -= 2/25.4 end
       }
   end
     @nuz += 0.2 * trank 
  oiler = polaron(@roundel,@theta)
  deepo = @nuz
  #if @nuz < @zdepth then
  # deepo = @zdepth
  #end
  printf "G1 X%5.5f Y%5.5f Z%5.5f\n",# F%d\n", 
   @xcentre+@nux+oiler[0], @ycentre+@nuy+oiler[1], deepo
    end 
   end
  @@feedrate = 40
  end
 end
 
 
 def bok(depth,climb)
  retrax 0.1
  printf "G0 X%5.5f Y%5.5f Z%5.5f\n",# F%d\n", 
   @xcentre+@wchub, @ycentre-@hchub, 0.1
  @okudanuk += climb/2.0 
  #depth -= 0.1
  @tiers = Integer(depth / 0.12) 
  while (@nuz >= depth) do
   @nuz -= depth / @tiers
   for i in 1..4 do
    oiler=polaron(Math.sqrt(2),@okudanuk)
    @nux = oiler[0]*(@wchub-@roundel)
    @nuy = oiler[1]*(@hchub-@roundel)
    #@nuz -= 0.05
    @@feedrate = 30
    arcElectron(climb/2.0,0)
    @okudanuk += climb/2.0 
    euler=polaron(Math.sqrt(2),@okudanuk)
    euler[0] -= oiler[0]
    euler[1] -= oiler[1]
    numzegs=12
    for j in 1..numzegs 
     @oscacc += 1
     trank = (@oscacc % 2) * 2 - 1
     @@feedrate = 35  - trank*5
     @nux += euler[0]*(@wchub-@roundel)/numzegs
     @nuy += euler[1]*(@hchub-@roundel)/numzegs
     if i == 1 then 
      if j == 2 then 
       @nuy -= 0.05 end
      if j == 11 then
       @nuy += 0.05
      end
     end
     @nuz += 0.2 * trank 
	 #if @nuz < depth then @nuzz = depth 
	 #else @nuzz = @nuz end
     cut
    end 
   end
  @@feedrate = 40
  end
 end
end
