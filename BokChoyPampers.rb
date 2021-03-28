
def stutteron(clasz,removejacks,laszt)
 #$curxo = 0
 mystuff = clasz.new($curxo,$curyo)
 mystuff.batdepth=2

 if removejacks then binderjacks(mystuff) end
 mystuff.boxo()
 mystuff.ducabot()
 
 if not laszt then
 $curxo = mystuff.duxo() + $rimmer
 mystuff.skimtoPoint($curxo,0,0.1)
 mystuff.penetrate(-0.1)
 mystuff.retract
 printf "M0\n"
 #mystuff.dwellus(60)
 else  mystuff.retract end
end

require './Okuda.rb'

class Okuda
 @insertionbreath = 0
 def bokchoypampers(pampers,depth,climb,xsegs,ysegs,topnuys,botnuys)
  retrax 0.1
  @zdepth = depth
  printf "G0 X%5.3f Y%5.3f Z%5.3f F%d\n", 
   @xcentre+@wchub, @ycentre-@hchub, 0.1, @@feedrate
  @okudanuk += climb/2.0 
  #depth -= 0.1
  @tiers = Integer(depth / 0.12) 
  topset = 0
  botset = 0
  	if pampers.include?(3)
	 topset = 2 #@insertionbreath+1
	 #print("GOREEE\n")
	 topnuys.each{|rr| 
      rr.each{|rrr| rrr += 12
	  #print("GORICO\n")
	  
	  }
     } 
	end
	
	if pampers.include?(1)
     botset = 2 #@insertionbreath+1
  	 botnuys.each{|rr| 
      rr.each{|rrr| rrr += 12}
     } 
	end
  
  
  while (@nuz >= depth) do
   @nuz -= depth / @tiers
   #@oscacc = 0
      ##@oscacc = 1
   for i in 0..3 do

    oiler=polaron(Math.sqrt(2),@okudanuk)
    @nux = oiler[0]*(@wchub-@roundel)
    @nuy = oiler[1]*(@hchub-@roundel)
    #@nuz -= 0.05
    @@feedrate = 30
	
	if pampers.include?(i) or pampers.include?((i+3)%4)
	 @theta += climb/2.0
	 retrax 0.1 
	else arcElectron(climb/2.0,0) end

    
    @okudanuk += climb/2.0 
    euler=polaron(Math.sqrt(2),@okudanuk)
    euler[0] -= oiler[0]
    euler[1] -= oiler[1]
    if i == 0 or i == 2 then numzegs=xsegs end
	if i == 1 or i == 3 then numzegs=ysegs end
	
iterador = numzegs
	if pampers.include?((i+3)%4)
	 @nux -= euler[0]*(@wchub-@roundel)/numzegs
	 @nux -= euler[0]*(@wchub-@roundel)/numzegs
	 #iterador += @insertionbreath
	 iterador += 2
	 #@nuy = euler[1]*(@hchub-@roundel)
	 ###new CUTT
 	 	 cutt(@nux + euler[0]*(@wchub-@roundel)/numzegs,
	   @nuy +  euler[1]*(@hchub-@roundel),
	   0.1)
	end
	
	if pampers.include?(i+1)  
	 iterador += @insertionbreath
	 #unless @nuz < (depth) then iterador += 2 end
	 ##unless @nuz <= (depth) then iterador += 1 end
	end 
	if pampers.include?(i+1) and pampers.include?((i+3)%4)
	 #iterador += @insertionbreath
	end
    for j in 1..iterador 
     @oscacc += 1
     trank = (@oscacc % 2) * 2 - 1
     @@feedrate = 35  - trank*5
     @nux += euler[0]*(@wchub-@roundel)/numzegs
     @nuy += euler[1]*(@hchub-@roundel)/numzegs
     if i == 0 then 
	  topnuys.each{|rr| 
	   if j-topset == rr[0] then 
	    @nuy -= 0.05 end
	   if j-topset == rr[1] then 
	    @nuy += 0.05 end
       }
	 end
     if i == 2 then 
	  botnuys.each{|rr| 
	   if j-botset == rr[0] then 
	    @nuy += 0.05 end
	   if j-botset == rr[1] then 
	    @nuy -= 0.05 end
       }
	 end
     @nuz += 0.2 * trank 
	 if pampers.include?(i)
	  #retrax 0.1
	  cutt(@nux + euler[0]*(@wchub-@roundel)/numzegs,
	   @nuy +  euler[1]*(@hchub-@roundel)/numzegs,
	   0.1)
	 elsif @nuz < depth and j > 1
	   cutt(@nux - euler[0]*(@wchub-@roundel)/(2*numzegs),
	   @nuy - euler[1]*(@hchub-@roundel)/(2*numzegs),
	   depth)
	  if j < numzegs then
	   cutt(@nux + euler[0]*(@wchub-@roundel)/(2*numzegs),
	   @nuy + euler[1]*(@hchub-@roundel)/(2*numzegs),
	   depth) end
	 else cut end 
    end 
   end
  @@feedrate = 40
  end
 end
end