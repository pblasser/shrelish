CC=-ruby -d -W0
PP= | perl "./mmbaker.pl" > ../ciatBASTL2021/
 
main: clean
	$(CC) ScrewSorter.rb $(PP)boltsorter.nc
	#$(CC) Sunbeetle.rb 0 $(PP)sun_bot.nc	
	#$(CC) Sunbeetle.rb 1 $(PP)sun_top.nc	
	$(CC) CocoQuanto.rb 1 2 $(PP)cocomidl12.nc
	$(CC) CocoQuanto_pre.rb 1 2 $(PP)cocomidl12_pre.nc
	$(CC) SolarGrassi.rb 1 0 $(PP)solgrb0.nc
	$(CC) SolarGrassi.rb 0 0 $(PP)solgrso0.nc		
	$(CC) SolarGrassi.rb 1 1 $(PP)solgrbs1.nc
	$(CC) SolarGrassi.rb 0 1 $(PP)solgrs1.nc		
	$(CC) SolarGrassiChub.rb 0 $(PP)solgrchb0.nc	
	$(CC) SolarGrassiChub.rb 1 $(PP)solgrchb1.nc	
	
	#$(CC) SolarCICADA.rb 1 $(PP)solarcic.nc	
	#$(CC) SolarFlange.rb 1 $(PP)solarfla.nc	
	
	$(CC) Tarsh.rb 1 $(PP)tarsh.nc	
	$(CC) Shneck.rb 1 1 1 $(PP)shneck11_bot.nc	
	$(CC) Shneck.rb 1 1 2 $(PP)shneck11_top.nc	
	$(CC) Shneck.rb 2 1 1 $(PP)shneck21_bot.nc	
	$(CC) Shneck.rb 2 1 2 $(PP)shneck21_top.nc	
	$(CC) Shtar.rb 0 $(PP)shtar_bot.nc	
	$(CC) Shtar.rb 1 $(PP)shtar_top.nc	
	$(CC) Shtar.rb 2 $(PP)shtar_pla.nc		
	$(CC) Shtar.rb 3 $(PP)shtar_plarig.nc		

	$(CC) MountBar.rb 4 1 $(PP)mounter.nc
	$(CC) DeerhornBot.rb $(PP)deerbot.nc 
	$(CC) DeerhornTop_pre.rb 2 2 $(PP)deermidl22_pre.nc 
	$(CC) DeerhornTop_pre.rb 2 2 0 $(PP)deerwing22_pre.nc 
	$(CC) DeerhornTop.rb 2 2 $(PP)deermidl22.nc 
	$(CC) DeerhornTop.rb 2 2 0 $(PP)deerwing22.nc 
	$(CC) Dudebot.rb $(PP)ovalbot.nc
	$(CC) Dudetop.rb JOHNSON FYRALL $(PP)fyrall_banana.nc 
	$(CC) Dudetop.rb JOHNSON SRINE $(PP)srine_banana.nc 
	$(CC) Studworth.rb 1 1 1 $(PP)4mm_studworth11_top.nc
	$(CC) Studworth.rb 1 1 2 $(PP)4mm_studworth11_bot.nc
	$(CC) Studworth.rb 2 1 1 $(PP)4mm_studworth21_top.nc
	$(CC) Studworth.rb 2 1 2 $(PP)4mm_studworth21_bot.nc
	$(CC) Studworth.rb 2 2 1 $(PP)4mm_studworth22_top.nc
	$(CC) Studworth.rb 2 2 2 $(PP)4mm_studworth22_bot.nc

	$(CC) Interojoke.rb grassi mocante $(PP)igm.nc
	$(CC) Interojoke.rb grassi $(PP)ig.nc
	$(CC) Interojoke.rb mocante $(PP)im.nc
	$(CC) Tocante.rb 2 1 1 $(PP)tocante21_top.nc
	$(CC) Tocante.rb 2 1 2 $(PP)tocante21_bot.nc
	$(CC) Tocante.rb 2 2 1 $(PP)tocante22_top.nc
	$(CC) Tocante.rb 2 2 2 $(PP)tocante22_bot.nc
	$(CC) Shnth.rb 2 2 $(PP)shnth22.nc
	$(CC) Barre_2mm.rb 5 2 $(PP)shbarre52.nc
	$(CC) Barre_2mm.rb 5 2 2 $(PP)shbarre522.nc
	$(CC) CocoBot.rb $(PP)cocobot.nc
	$(CC) CocoCoco.rb 2 2 $(PP)cocoloop22.nc

	$(CC) CocoStrip_darrin.rb 4 2 $(PP)cocostrip42.nc
	$(CC) PlumBot.rb $(PP)plumbot.nc 
	$(CC) Plumbutt.rb 1 2 $(PP)plummidl12.nc 
	$(CC) Plumbutt_pre.rb 1 2 $(PP)plummidl12_pre.nc 
	$(CC) Plumsteam.rb 1 2 $(PP)plumsteam12.nc 
	$(CC) Plumdeerboo.rb 2 2 $(PP)plumdeer22.nc 
	$(CC) Plumdeer_pre.rb 2 2 $(PP)plumdeer22_pre.nc 
	$(CC) Sidrax.rb $(PP)sidbot.nc 
	$(CC) Sidbar_2mm.rb 5 2 $(PP)sidbar52.nc 
	$(CC) Sidbar_2mm.rb 5 2 3 $(PP)sidbar523.nc 
	$(CC) Sidbar_2mm.rb 5 2 0 0 $(PP)sidbar5200.nc
	$(CC) Sidbar_2mm.rb 5 2 0 5 $(PP)sidbar52leftmoon.nc
	$(CC) Sidbar_2mm.rb 5 2 0 1 $(PP)sidbar52ritemoon.nc	 
	$(CC) Sidmat_2mm.rb 3 2 $(PP)sidmat32.nc  
	$(CC) Tetrax.rb $(PP)tetbot.nc 
	$(CC) Tetbar_2mm.rb 5 2 $(PP)tetbar52.nc 
	$(CC) Tetbar_2mm.rb 5 2 2 $(PP)tetbar522.nc 
	$(CC) Tetbar_2mm.rb 5 2 2 1 $(PP)tetbar52midd.nc 
	$(CC) Tetmat_2mm.rb 3 2 $(PP)tetmat32.nc
	$(CC) Quatrax.rb $(PP)quabot.nc 
	$(CC) Quabar_2mm.rb 5 2 $(PP)quabar52.nc 
	$(CC) Quabar_2mm.rb 5 2 3 $(PP)quabar523.nc 
	$(CC) Quamat_2mm.rb 3 2 $(PP)quamat32.nc 
	$(CC) Quamat_2mm.rb 3 2 2 $(PP)quamat322.nc 
	$(CC) RolzBot.rb $(PP)robot.nc 
	$(CC) RolzTop.rb 5 2 $(PP)rotop52.nc 
	$(CC) RolzTop.rb 5 2 3 $(PP)rotop523.nc 

	$(CC) Stuberbot.rb $(PP)stuberbot.nc 
	$(CC) Stubertop.rb JOHNSON $(PP)stuber_banana.nc 
	$(CC) Stubertop.rb STUDS $(PP)stuber_studs.nc 
 
clean:
	-rm *.nc
	-rm I:/*.nc
#	-rm ../temp/*.nc
	-rm ciatBASTL2021/*.nc

jomp:CC=-ruby -W0
jomp:PP= | perl "./mmmaker.pl" > I:/
jomp:PP= | perl "./mmmaker.pl" > ../temp/
jomp:main


