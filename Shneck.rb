
require './Bot.rb'
#require 'Complex'
include Math
require './Jacksloon.rb'

class Shneck < Jacksloon
 def initialize(starx, stary)
   @width = 1.5+$bitwidth #0.75+$halfwidth
   @hawi = @width/2
  @heigh = 1.9
  @depth = 1.0
  @zstep = @depth/7.0
  super(starx, stary)
 end
 

 
 def outer_polka(t,xx,qz)
  q=7
  #radlamb = lambda (t) {}
  zz = -Float(qz)/8
  begin
   #r = -(sqrt(5)*sqrt(sqrt(81*q**4*sin(t)**4+160000*sin(t)**4-216*q**4*cos(t)**2*sin(t)**2+144*q**4*cos(t)**4+5760*q**2*cos(t)**4)+9*q**2*sin(t)**2-12*q**2*cos(t)**2))/(2*sqrt(250*sin(t)**4+9*q**2*cos(t)**4))
   r = (sqrt(5)*sqrt(sqrt(81*q**4*sin(t)**4+
   160000*sin(t)**4-
   216*q**4*cos(t)**2*sin(t)**2+
   144*q**4*cos(t)**4+
   5760*q**2*cos(t)**4)+
   9*q**2*sin(t)**2-
   12*q**2*cos(t)**2))/(2*sqrt(250*sin(t)**4+9*q**2*cos(t)**4))
   #r = -(sqrt(5)*sqrt((-sqrt(81*q**4*sin(t)**4+160000*sin(t)**4-216*q**4*cos(t)**2*sin(t)**2+144*q**4*cos(t)**4+5760*q**2*cos(t)**4))+9*q**2*sin(t)**2-12*q**2*cos(t)**2))/(2*sqrt(250*sin(t)**4+9*q**2*cos(t)**4))
   #r = (sqrt(5)*sqrt((-sqrt(81*q**4*sin(t)**4+160000*sin(t)**4-216*q**4*cos(t)**2*sin(t)**2+144*q**4*cos(t)**4+5760*q**2*cos(t)**4))+9*q**2*sin(t)**2-12*q**2*cos(t)**2))/(2*sqrt(250*sin(t)**4+9*q**2*cos(t)**4)) 
  
  unless r.is_a?(Complex)  then 
    x = r*sin(t)
	y = r*cos(t)
	if (x<-1) and (y<@hawi and y>(-@hawi)) then
	 cutoPointDeepo(x+xx,y+@stary,0.1) 
	else cutoPointDeepo(x+xx,y+@stary,zz)  end
   end
  rescue Errno::EDOM => e then end
 end
 
 def pegova(x,qz)
  for i in 0..100 do
   t = PI*Float(i)/50
   outer_polka(t,x,qz)
  end
 end
 
 def aux(starx,stary,dendx,dendy,zstart,zdepth,step)
  incro = (Float(zdepth-zstart) / Float(step))
  skimtoPoint(starx,stary,zstart+0.1)
  for i in 1..step do
   dendz = zstart + (incro * i)
   starz = dendz - (5.0/16.0)#@(3.0/8.0) #tan(2.0*PI/180.0)*4
   if  (i.divmod(2)[1] != 0) then 
    penetrate(starz)
    cutoPointDeepo(dendx,dendy,dendz)
	else 
	penetrate(dendz)
    cutoPointDeepo(starx, stary, starz) 
   end
  end
 end

 
 def nex(x,deep)
 y = 1.0
 tiers=Integer((y)/0.125)
 incro = y/tiers
 dendx = x+2.3
 starx = x-2.3
 
 for i in 0..tiers*2 do
  aux(dendx,y-i*incro+@stary,starx,y-i*incro+@stary,(5.0/16.0),-deep,Integer((deep+(3.0/8.0))/0.124))
 end
 dux(starx, -@dock+@stary, starx, @dock+@stary, 0, -deep, 1)
end
def peghead(x)
 y = 1.0
 tiers=Integer((y)/0.125)
 incro = y/tiers
 starx = x+2.3
 dendx = x-2.3
 for i in 0..tiers*2 do
  aux(dendx,y-i*incro+@stary,starx,y-i*incro+@stary,(5.0/16.0),1.0/16.0,Integer((0+(3.0/8.0))/0.124))
 end
 outer_polka(0,x,-1)
 for i in 1..7 do
  pegova(x,i)
 end
end
 
 
 def round(min,max) #0.75+$halfwidth
   widor = @width/2 #0.75+$halfwidth
  @zzoffset = 3.0/8.0
  @chub=0.125
  @curxo=min
  @curyo = 0
  dirx=0.1
  @max=max ###please REDO WITH CLOSURES!!!
  dux(min,-widor+@stary,max,-widor+@stary,0,-1.6*@chub,2)
  dux(min,widor+@stary,max,widor+@stary,0,-1.6*@chub,2)
  #def narx()
  narx = lambda() {
   taproom = -(4.0/16.0)*(@curxo-min)/(max-min)
   zzorn = taproom + @zzoffset-1.18*@curyo**4 #wasz 1.2
   unless zzorn < -0.75 then
   cutoPointDeepo(@curxo,@curyo+@stary,zzorn)
   end
   if @curxo>=max then 
    dirx= -0.1 
	@zzoffset -= @chub
	end
   if @curxo<=min then 
    dirx= 0.1 
    @zzoffset -= @chub
    end
   @curxo+= dirx/50
  }
  while @zzoffset>=0 
   while @zzoffset>=0 and @curyo<widor
	@curyo += 0.03
	narx.call()
   end
   while @zzoffset>=0 and @curyo>-widor
	@curyo -= 0.03
	narx.call()
   end
  end

end

  def SMT0805(x,y,r)
   drillus(x,y+@stary,0,-0.1)
 end
 def SMTpearl(x,y,r)
   drillus(x,y+@stary,0,-0.1)
 end
 def SMT1206(x,y,r)
   tubo(x,y+@stary,0.15,0,-0.125,1)
 end
 def SMTfret(x,y,r)
   tubo(x,0.6+@stary,0.075,0,-0.125,1)
   tubo(x,-0.6+@stary,0.075,0,-0.125,1)
 end 
 def SMTLQFP64(x,y,r)
   tubo(x,y+@stary,0.35,0,-0.1,1)
 end
 def SMThardHEAD(x,y,r)
   box(x-0.25,y-0.5+@stary,x+0.25,y+0.5+@stary,0,-0.1,1)
 end
 def SMTCRYST(x,y,r)
   box(x-0.3,y-0.1+@stary,x+0.3,y+0.1+@stary,0,-0.25,2)
 end
  def SMTprogger(x,y,r)
   box(x-0.4, y-0.15+@stary , x+0.4, y+0.15+@stary, 0, -0.15, 1)
   dux(x-0.4, y+@stary , x+0.4, y+@stary, -0.15, -0.5, 4)
 end
 def mountSCREW(x,y)
  tubo(x,y+@stary,0.15,0,-0.2,2)
  
  spyrtub(x,y+@stary,5.0/64.0,5.0/64.0)
end




 
 
 def flip
  @dock=dock=0.7+$halfwidth+0.05+0.03#fatness bogey
  p = 23.7
  box(0,@stary-@dock,2.2,@stary+@dock,0,-0.125,1)
  dux(2.2,@stary-@dock,3,@stary-@dock,0,-0.125,1)
  dux(2.2,@stary+@dock,3,@stary+@dock,0,-0.125,1)
  retrax(0.1)
  round(3,21.5)
  peghead(p)
end
def flipmark()
 @@pentrate = 8
drillus(26,0,0,-8.0/8.0)#@depth)
  drillus(0,0,0,-8.0/8.0)#@depth)
   @@pentrate = 30
   retrax(0.5)
  #printf("m 0 \n")#dwellus(60)
 end
def flipp
end
def boxo
  @dock=dock=0.7+$halfwidth+0.05+0.03#fatness bogey
  p = 23.7
  mountSCREW(0.5,0.4)
  mountSCREW(0.5,-0.4)
  mountSCREW(1.5,0.4)
  mountSCREW(1.5,-0.4)
  scripta()
  
  chock = 0-$halfwidth
  notch = -(3.3/8.0)
  dux(chock,-dock+@stary,21.2,-dock+@stary,0,notch,4)
  dux(chock,-dock+@stary,3,-dock+@stary,notch,-(7.0/8.0),7) #WETF!
  dux(chock,dock+@stary,21.2,dock+@stary,0,notch,4)
  dux(chock,dock+@stary,3,dock+@stary,notch,-(7.0/8.0),7)

  drillus(p-2.3+1.2,0.55+@stary,0,-0.6)
  drillus(p-2.3+1.2,-0.55+@stary,0,-0.6)
  drillus(p-2.3+3,0.4+@stary,0,-0.6)
  drillus(p-2.3+3,-0.4+@stary,0,-0.6)
  
  nex(p,0.125+(1.0/30.0))#1/8 to 5/16-1/16 out of inch is 5/8 
  #so decrete top dip 1/16 ideally but give file room
  dux(chock,-dock+@stary,chock,dock+@stary,0,-(7.0/8.0),7)
 end 
 
 def duxo
  return @curxo
 end
 def ducabot 
 end

def scripta()
SMTpearl(0.14417125984252, -0.4, 0)
SMTpearl(0.14417125984252, 0.4, 0)
SMTfret(0.29131220472441, 0, 0)
SMThardHEAD(0.48031496062992, 0.0078740157480315, 0)
SMTfret(0.59474724409449, 0, 0)
SMT1206(0.83464566929134, 0, -90)
SMTfret(0.91081062992126, 0, 0)
SMT1206(0.92125984251968, 0, -90)
SMT0805(0.92834842519685, 0.39595157480315, -89)
SMT1206(1.007874015748, 0, -90)
SMT0805(1.0149625984252, 0.39595157480315, -89)
SMTCRYST(1.0866141732283, -0.26771653543307, 0)
SMT1206(1.0944881889764, 0, -90)
SMT0805(1.1001114173228, -0.41810826771654, 1)
SMT0805(1.1173248031496, 0.39595157480315, -89)
SMT1206(1.1811023622047, 0, -90)
SMTfret(1.2400267716535, 0, 0)
SMT0805(1.2433090551181, 0.39595157480315, -89)
SMT1206(1.2677165354331, 0, -90)
SMT1206(1.3543307086614, 0, -90)
SMT0805(1.4173228346457, -0.31496062992126, -90)
SMT0805(1.4488188976378, -0.0042125984251968, 90)
SMT0805(1.4544421259843, -0.42598228346457, 1)
SMT0805(1.488188976378, -0.31496062992126, -90)
SMT0805(1.5292917322835, -0.0066185039370079, 90)
SMTfret(1.5829440944882, 0, 0)
SMTLQFP64(1.9291338582677, -0.039370078740157, 45)
SMTfret(1.9401318897638, 0, 0)
SMT0805(2.2834645669291, -0.070866141732283, 90)
SMTfret(2.3121842519685, 0, 0)
SMT0805(2.4094488188976, -0.070866141732283, -90)
SMT0805(2.496062992126, 0.078740157480315, -90)
SMT0805(2.5275590551181, -0.060748031496063, -90)
SMT0805(2.5748031496063, 0.078740157480315, -90)
SMT0805(2.6557874015748, -0.062992125984252, 0)
SMTfret(2.6997204724409, 0, 0)
SMTprogger(2.9763779527559, 0.05511811023622, 180)
SMTfret(3.1033838582677, 0, 0)
SMT0805(3.2979964566929, -0.44012559055118, 1)
SMT0805(3.2992125984252, 0.16759842519685, 90)
SMT0805(3.4803149606299, -0.39370078740157, 1)
SMTfret(3.5238464566929, 0, 0)
SMT0805(3.6377952755906, -0.43307086614173, -89)
SMTpearl(3.7405948818898, 0, 0)
SMT0805(3.7952755905512, -0.43307086614173, -89)
SMT0805(3.9527559055118, -0.43307086614173, -89)
SMTfret(3.9618070866142, 0, 0)
SMT0805(4.3464566929134, -0.37007874015748, -89)
SMTfret(4.4179937007874, 0, 0)
SMTpearl(4.6531578740157, 0, 0)
SMT0805(4.7007874015748, -0.37007874015748, -89)
SMTfret(4.8931649606299, 0, 0)
SMT0805(5.1732283464567, -0.37007874015748, -89)
SMTfret(5.388111023622, 0, 0)
SMT0805(5.7244094488189, -0.37007874015748, -89)
SMTfret(5.9036551181102, 0, 0)
SMTpearl(6.1694173228346, 0, 0)
SMT0805(6.1968503937008, -0.37007874015748, -89)
SMTfret(6.4406535433071, 0, 0)
SMT0805(6.748031496063, -0.37007874015748, -89)
SMTfret(7, 0, 0)
SMTpearl(7.2883429133858, 0.4, 0)
SMTpearl(7.2883429133858, -0.4, 0)
SMTfret(7.582624015748, 0, 0)
SMT0805(7.8110236220472, -0.37007874015748, -89)
SMTfret(8.1894948818898, 0, 0)
SMT0805(8.4015748031496, -0.37007874015748, -89)
SMTpearl(8.5023362204724, 0, 0)
SMTfret(8.8216208661417, 0, 0)
SMT0805(9.0708661417323, -0.37007874015748, -89)
SMTfret(9.4800535433071, 0, 0)
SMT0805(9.7007874015748, -0.37007874015748, -89)
SMTfret(10.165887795276, 0, 0)
SMT0805(10.488188976378, -0.37007874015748, -89)
SMTpearl(10.51943503937, 0, 0)
SMTfret(10.880263385827, 0, 0)
SMT0805(11.07874015748, -0.37007874015748, -89)
SMT0805(11.622832677165, 0.42097755905512, 91)
SMTfret(11.624368897638, 0, 0)
SMTpearl(12.007954724409, 0, 0)
SMTfret(12.399440551181, 0, 0)
SMT0805(12.40236023622, 0.42885157480315, 91)
SMT0805(13.20550984252, 0.42097755905512, 91)
SMTfret(13.206768110236, 0, 0)
SMT0805(14.037469685039, 0.40803818897638, 91)
SMTfret(14.047693307087, 0, 0)
SMTpearl(14.481189370079, 0, 0)
SMT0805(14.918983070866, 0.40130157480315, 91)
SMTfret(14.923614173228, 0, 0)
SMT0805(15.830787795276, 0.4051594488189, 91)
SMTfret(15.835987401575, 0, 0)
SMTpearl(16.306315354331, 0, 0)
SMT0805(16.778550787402, 0.40318543307087, 91)
SMTfret(16.786330314961, 0, 0)
SMTfret(17.776222440945, 0, 0)
SMT0805(17.781697637795, 0.40011102362205, -89)
SMTfret(18.80730984252, 0, 0)
SMT0805(18.80820511811, 0.40396181102362, -90)
SMTpearl(19.33883503937, 0, 0)
SMTfret(19.881307086614, 0, 0)
SMT0805(19.88188976378, 0.40185039370079, -90)
SMTpearl(20.434952362205, 0, 0)


end
end
$rimmer = 0.01



def flipperat(clasz)
 xarg = yarg = 1
 unless ARGV[0].nil? then yarg = Integer(ARGV[0]) end
 unless ARGV[1].nil? then xarg = Integer(ARGV[1]) end
 process=3
 unless ARGV[2].nil? then process = Integer(ARGV[2]) end


 broth = clasz.new(0,0).getBrot + $rimmer
 curyop = (yarg-1)*broth
 curxo = 0
 mystuff = clasz.new(curxo,0)
 #curxo = mystuff.duxo()

 if (process&1)>0 then 
  curyo = curyop
  for j in 1..yarg do
   mystuff = clasz.new(curxo,curyo)
   mystuff.flip()
   curyo -= broth*2
  end
  mystuff.flipmark()
 end

 if (process&2)>0 then
#why did curxo be 0 and now bitwidth
  curxo = $bitwidth
  curyo = curyop
  for j in 1..yarg do
   mystuff = clasz.new(curxo,curyo)
   mystuff.boxo()
   mystuff.ducabot()
   curyo -= broth*2
  end
 end
 printf "G0 Z0.5\n"
 printf "G0 X0 Y0 \n"
end

flipperat(Shneck)
