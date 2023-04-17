CC=-ruby -d -W0
DD=../ciatBASTL2021/
PP= | perl "./mmbaker.pl" > $(DD)
GTEN="G21G90G92.1\nG10L20P0X0Y0Z0"
GDOZ="G21G90G92.1\nG0Z10\nG0X0Y0"



 
main: clean
	echo -e $(GTEN) > $(DD)G10.nc
	echo -e $(GDOZ) > $(DD)G00.nc
	$(CC) Curxuda.rb $(PP)curxo.nc  
	$(CC) SolarGrassi_curx.rb 1 0 $(PP)solgrb0.nc
	$(CC) SolarGrassi_curx.rb 0 0 $(PP)solgrso0.nc	
	$(CC) SolarGrassi_curx.rb 1 1 $(PP)solgrbs1.nc
	$(CC) SolarGrassi_curx.rb 0 1 $(PP)solgrs1.nc	
	$(CC) BenjoBot.rb gold benjolin gold $(PP)BenjBotGBG.nc  
	#$(CC) BenjoBot.rb benjolin $(PP)BenjBotB.nc  
	$(CC) BenjoBot.rb 1 1 $(PP)BBot11.nc  
	$(CC) BenjoBot.rb 1 2 $(PP)BBot12.nc  
	$(CC) BenjoBot.rb 1 3 $(PP)BBot13.nc  
	$(CC) BenjoBot.rb 2 2 $(PP)BBot22.nc  
	$(CC) BenjoBot.rb 2 3 $(PP)BBot23.nc  
	$(CC) BenjoBot.rb 2 4 $(PP)BBot24.nc  
	#$(CC) BenjoTop.rb $(PP)BenjoTop.nc  
	$(CC) BenjoTop.rb 1 1 $(PP)BTop11.nc 
	$(CC) BenjoTop.rb 1 2 $(PP)BTop12.nc 
	$(CC) BenjoTop.rb 1 3 $(PP)BTop13.nc  
	$(CC) BenjoTop.rb 2 2 $(PP)BTop22.nc 
	$(CC) BenjoTop.rb 2 3 $(PP)BTop23.nc 
	$(CC) BenjoTop.rb 2 4 $(PP)BTop24.nc  
	#$(CC) BenjoPinker.rb $(PP)BPinker.nc  
	$(CC) BenjoGoldTop63.rb 2 1 $(PP)BenjoGT6321.nc
	$(CC) BenjoGoldTop93.rb 2 1 $(PP)BenjoGT9321.nc  
	$(CC) SolarBenjChub.rb 0 $(PP)solbchb0.nc	
	$(CC) SolarBenjChub.rb 1 $(PP)solbchb1.nc	
	$(CC) SolarBenjPane.rb 0 $(PP)solbpan0.nc	
	$(CC) SolarBenjPane.rb 1 $(PP)solbpan1.nc	
	$(CC) PlumBot.rb $(PP)plumbot.nc 
	$(CC) Plumbutt.rb 1 2 $(PP)plummidl12.nc 
	$(CC) Plumbutt_pre.rb 1 2 $(PP)plummidl12_pre.nc 
	$(CC) Plumsteam.rb 1 2 $(PP)plumsteam12.nc 
	$(CC) Plumdeerboo.rb 2 2 $(PP)plumdeer22.nc 
	$(CC) Plumdeer_pre.rb 2 2 $(PP)plumdeer22_pre.nc 
 
	$(CC) MountBar.rb 4 1 $(PP)mounter.nc
	$(CC) MountBar3040.rb 4 1 $(PP)mounter3040.nc
	$(CC) Ovalbot.rb $(PP)ovalbot.nc 
	$(CC) Ovaltop.rb JOHNSON STUBER $(PP)ovalstuber.nc 
	$(CC) Ovaltop.rb SPESAL FYRALL $(PP)ovalspesalfyral.nc 
	$(CC) Ovaltop.rb SPESAL SRINE $(PP)ovalspesalsrine.nc 
	$(CC) OvalNobButts.rb $(PP)ovalnobs.nc 
	$(CC) OvalButts.rb $(PP)ovalbutts.nc 
	$(CC) ScrewSorter.rb $(PP)boltsorter.nc
	#$(CC) Sunbeetle.rb 0 $(PP)sun_bot.nc	
	#$(CC) Sunbeetle.rb 1 $(PP)sun_top.nc	
	$(CC) CocoQuanto.rb 1 2 $(PP)cocomidl12.nc
	$(CC) CocoQuanto_pre.rb 1 2 $(PP)cocomidl12_pre.nc
	
#	$(CC) SolarGrassiChub.rb 0 $(PP)solgrchb0.nc	
#	$(CC) SolarGrassiChub.rb 1 $(PP)solgrchb1.nc	
	
	#$(CC) SolarCICADA.rb 1 $(PP)solarcic.nc	
	#$(CC) SolarFlange.rb 1 $(PP)solarfla.nc	
	
	#$(CC) Tarsh.rb 1 $(PP)tarsh.nc	
	#$(CC) Shneck.rb 1 1 1 $(PP)shneck11_bot.nc	
	#$(CC) Shneck.rb 1 1 2 $(PP)shneck11_top.nc	
	#$(CC) Shneck.rb 2 1 1 $(PP)shneck21_bot.nc	
	#$(CC) Shneck.rb 2 1 2 $(PP)shneck21_top.nc	
	#$(CC) Shtar.rb 0 $(PP)shtar_bot.nc	
	#$(CC) Shtar.rb 1 $(PP)shtar_top.nc	
	#$(CC) Shtar.rb 2 $(PP)shtar_pla.nc		
	#$(CC) Shtar.rb 3 $(PP)shtar_plarig.nc		


	$(CC) DeerhornBot.rb $(PP)deerbot.nc 
	$(CC) DeerhornTop_pre.rb 2 2 $(PP)deermidl22_pre.nc 
	$(CC) DeerhornTop_pre.rb 2 2 0 $(PP)deerwing22_pre.nc 
	$(CC) DeerhornTop.rb 2 2 $(PP)deermidl22.nc 
	$(CC) DeerhornTop.rb 2 2 0 $(PP)deerwing22.nc 

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
	$(CC) Shnth.rb 1 1 $(PP)shnth11.nc
	$(CC) Barre_2mm.rb 5 2 $(PP)shbarre52.nc
	$(CC) Barre_2mm.rb 5 2 2 $(PP)shbarre522.nc
	$(CC) CocoBot.rb $(PP)cocobot.nc
	$(CC) CocoCoco.rb 2 2 $(PP)cocoloop22.nc

	$(CC) CocoStrip_darrin.rb 4 2 $(PP)cocostrip42.nc

	$(CC) Sidrax.rb $(PP)sidbot.nc 
	$(CC) Sidbar_2mm.rb 5 2 $(PP)sidbar52.nc 
	$(CC) Sidbar_2mm.rb 5 1 $(PP)sidbar51.nc 
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
	$(CC) RolzTop_2mm.rb 5 2 $(PP)rotop52.nc 
	$(CC) RolzTop_2mm.rb 4 2 1 $(PP)rotop42.nc 
	$(CC) RolzTop_2mm.rb 5 2 3 $(PP)rotop523.nc 


clean:
	-rm $(DD)*.nc

jomp:CC=-ruby -W0
jomp:DD=../temp/
jomp:PP= | perl "./mmmaker.pl" > $(DD)
jomp:main

thump:CC=-ruby -W0
thump:DD=I:/
thump:PP= | perl "./mmmaker.pl" > $(DD)
thump:main


thumpe:CC=-ruby -W0
thumpe:DD=E:/
thumpe:PP= | perl "./mmmaker.pl" > $(DD)
thumpe:main

