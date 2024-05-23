CC=-ruby -d -W0
DD=../ciatBASTL2021/
PP= | perl "./mmbaker.pl" > $(DD)
GTEN="G21G90G92.1\nG10L20P0X0Y0Z0"
GDOZ="G21G90G92.1\nG0Z10\nG0X0Y0"



 
main: clean
	echo -e $(GTEN) > $(DD)G10.nc
	echo -e $(GDOZ) > $(DD)G00.nc
	$(CC) Shtar.rb 2 $(PP)shtar_pla.nc
	#$(CC) NobFiver.rb 50 $(PP)znobf50.nc
	#$(CC) NobFiver.rb 30 $(PP)znobf30.nc
	#$(CC) NobFiver.rb 20 $(PP)znobf20.nc
	#$(CC) GRBLARD.rb $(PP)zgrblard.nc
	#$(CC) Thumbpiano1.rb $(PP)zthumb.nc
	#$(CC) NEMAStump.rb $(PP)znema.nc
	#$(CC) NEMAbirch.rb $(PP)zbirch.nc	
	#$(CC) BenjoGoldTopBeaner.rb 2 1 $(PP)solgol21.nc  	
	#$(CC) SolarGrassi_curx.rb 2 0 $(PP)solbbox0.nc
	#$(CC) SolarGrassi_curx.rb 0 0 $(PP)solgrso0.nc	
	#$(CC) SolarGrassi_curx.rb 2 1 $(PP)solbbox1.nc
	#$(CC) SolarGrassi_curx.rb 1 0 $(PP)solbox0.nc
	#$(CC) SolarGrassi_curx.rb 0 0 $(PP)solgrso0.nc	
	#$(CC) SolarGrassi_curx.rb 1 1 $(PP)solbox1.nc
	#$(CC) SolarGrassi_curx.rb 0 1 $(PP)solgrs1.nc	
	$(CC) BenjoSuiteBot.rb pc 1 1 $(PP)pc11.nc 
	$(CC) BenjoSuiteBot.rb c 1 2 $(PP)c12.nc  
	$(CC) BenjoClickTop.rb 1 1 $(PP)Bclc11.nc
	$(CC) BenjoSectionTop.rb 4 1 $(PP)Bsec41.nc  
	$(CC) BenjoSectionTop.rb 4 2 $(PP)Bsec42.nc 
	$(CC) BenjoSectionTop.rb 4 3 $(PP)Bsec43.nc 
	$(CC) BenjoSuiteBot.rb gspsg 1 1 $(PP)gspsg11.nc  
	$(CC) BenjoSuiteBot.rb gspsg 2 1 $(PP)gspsg21.nc  
	$(CC) BenjoSuiteBot.rb gspsg 2 2 $(PP)gspsg22.nc  
	$(CC) BenjoSuiteBot.rb gspsg 1 1 $(PP)gspsg11.nc  
	#$(CC) BenjoSuiteBot.rb gspspsg 2 2 $(PP)gspspsg22.nc  
	#$(CC) BenjoSuiteBot.rb gspspsg 1 1 $(PP)gspspsg11.nc  
	#$(CC) BenjoSuiteBot.rb p 1 1 $(PP)p11.nc  
	#$(CC) BenjoSuiteBot.rb gpg 2 2 $(PP)gpg22.nc  
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
	#$(CC) BenjoGoldTop63.rb 2 1 $(PP)BenjoGT6321.nc
	$(CC) BenjoGoldTop93.rb 4 2 $(PP)Bgold42.nc
	$(CC) BenjoGoldTop93.rb 4 3 $(PP)Bgold43.nc  
	#$(CC) BenjoGoldTop93.rb 4 4 $(PP)Bgold44.nc  
	$(CC) SolarClikChub.rb 0 $(PP)solchb0.nc	
	$(CC) SolarClikChub.rb 1 $(PP)solchb1.nc	
	#$(CC) SolarBenjPane.rb 4 1 0 $(PP)solpan4.nc	
	#$(CC) SolarBenjPane.rb 1 1 1 $(PP)solpan1.nc	
	#$(CC) SolarBenjPane.rb 1 2 2 $(PP)solpan2.nc	
	$(CC) PlumBot.rb $(PP)plbot.nc 
	$(CC) Plumbutt.rb 1 2 $(PP)plmid12.nc 
	$(CC) Plumbutt_pre.rb 1 2 $(PP)plmid12_.nc 
	$(CC) Plumsteam.rb 1 2 $(PP)plstm12.nc 
	$(CC) Plumdeerboo.rb 2 2 $(PP)pldir22.nc 
	$(CC) Plumdeer_pre.rb 2 2 $(PP)pldir22_.nc 
 
	$(CC) MountBar.rb 4 1 $(PP)mnt6040.nc
	$(CC) MountBar3040.rb 6 1 $(PP)mnt3040.nc
	$(CC) Ovalbot.rb $(PP)ovalbot.nc 
	$(CC) Ovaltop.rb JOHNSON STUBER $(PP)ovalst.nc 
	$(CC) Ovaltop.rb SPESAL FYRALL $(PP)ovalfy.nc 
	$(CC) Ovaltop.rb SPESAL SRINE $(PP)ovalsr.nc 
	#$(CC) OvalNobButts.rb $(PP)ovalno.nc 
	#$(CC) OvalButts.rb $(PP)ovalbu.nc 
	#$(CC) ScrewSorter.rb $(PP)boltsort.nc
	#$(CC) Sunbeetle.rb 0 $(PP)sun_bot.nc	
	#$(CC) Sunbeetle.rb 1 $(PP)sun_top.nc	
	$(CC) CocoQuanto.rb 1 2 $(PP)comid12.nc
	$(CC) CocoQuanto_pre.rb 1 2 $(PP)comid12_.nc
	
#	$(CC) SolarGrassiChub.rb 0 $(PP)solgrchb0.nc	
#	$(CC) SolarGrassiChub.rb 1 $(PP)solgrchb1.nc	
	
	#$(CC) SolarCICADA.rb 1 $(PP)solarcic.nc	
	#$(CC) SolarFlange.rb 1 $(PP)solarfla.nc	
	
	#$(CC) Tarsh.rb 1 $(PP)tarsh.nc	
	#$(CC) Shneck.rb 1 1 1 $(PP)shneck11_bot.nc	
	#$(CC) Shneck.rb 1 1 2 $(PP)shneck11_top.nc	
	#$(CC) Shneck.rb 2 1 1 $(PP)shneck21_bot.nc	
	#$(CC) Shneck.rb 2 1 2 $(PP)shneck21_top.nc	
	#$(CC) Tarneck.rb 2 1 1 $(PP)tarn21_.nc	
	#$(CC) Tarneck.rb 2 1 2 $(PP)tarn21.nc	
	#$(CC) Shtar.rb 0 $(PP)shtar_bot.nc	
	#$(CC) Shtar.rb 1 $(PP)shtar_top.nc	
	#$(CC) Shtar.rb 2 $(PP)shtar_pla.nc		
	#$(CC) Shtar.rb 3 $(PP)shtar_plarig.nc		


	$(CC) DeerhornBot.rb $(PP)drbot.nc 
	$(CC) DeerhornTop_pre.rb 2 2 $(PP)drmid22_.nc 
	$(CC) DeerhornTop_pre.rb 2 2 0 $(PP)drout22_.nc 
	$(CC) DeerhornTop.rb 2 2 $(PP)drmid22.nc 
	$(CC) DeerhornTop.rb 2 2 0 $(PP)drout22.nc 

	$(CC) Studworth.rb 1 1 1 $(PP)4st11_.nc
	$(CC) Studworth.rb 1 1 2 $(PP)4st11.nc
	$(CC) Studworth.rb 2 1 1 $(PP)4st21_.nc
	$(CC) Studworth.rb 2 1 2 $(PP)4st21.nc
	$(CC) Studworth.rb 2 2 1 $(PP)4st22_.nc
	$(CC) Studworth.rb 2 2 2 $(PP)4st22.nc

	$(CC) Interojoke.rb grassi mocante $(PP)igm.nc
	$(CC) Interojoke.rb grassi $(PP)ig.nc
	$(CC) Interojoke.rb mocante $(PP)im.nc
	$(CC) Tocante.rb 2 1 1 $(PP)to21_.nc
	$(CC) Tocante.rb 2 1 2 $(PP)to21.nc
	$(CC) Tocante.rb 2 2 1 $(PP)to22_.nc
	$(CC) Tocante.rb 2 2 2 $(PP)to22.nc
	$(CC) Shnth.rb 2 2 $(PP)shbot22.nc
	$(CC) Shnth.rb 1 1 $(PP)shbot11.nc
	$(CC) Barre_2mm.rb 5 2 $(PP)shbar52.nc
	$(CC) Barre_2mm.rb 5 2 2 $(PP)shbar522.nc
	$(CC) CocoBot.rb $(PP)cobot.nc
	$(CC) CocoCoco.rb 2 2 $(PP)coloop22.nc

	$(CC) CocoStrip_darrin.rb 4 2 $(PP)costrp42.nc

	$(CC) Sidrax.rb $(PP)sbot.nc 
	$(CC) Sidbar_2mm.rb 5 2 $(PP)sbar52.nc 
	$(CC) Sidbar_2mm.rb 5 1 $(PP)sbar51.nc 
	$(CC) Sidbar_2mm.rb 5 2 3 $(PP)sbar523.nc 
	$(CC) Sidbar_2mm.rb 5 2 0 0 $(PP)sbar5200.nc
	$(CC) Sidbar_2mm.rb 5 2 0 5 $(PP)sbar52l.nc
	$(CC) Sidbar_2mm.rb 5 2 0 1 $(PP)sbar52r.nc	 
	$(CC) Sidmat_2mm.rb 3 2 $(PP)smat32.nc  
	$(CC) Tetrax.rb $(PP)tbot.nc 
	$(CC) Tetbar_2mm.rb 5 2 $(PP)tbar52.nc 
	$(CC) Tetbar_2mm.rb 5 2 2 $(PP)tbar522.nc 
	$(CC) Tetbar_2mm.rb 5 2 2 1 $(PP)tbar52m.nc 
	$(CC) Tetmat_2mm.rb 3 2 $(PP)tmat32.nc
	$(CC) Quatrax.rb $(PP)qbot.nc 
	$(CC) Quabar_2mm.rb 5 2 $(PP)qbar52.nc 
	$(CC) Quabar_2mm.rb 5 2 3 $(PP)qbar523.nc 
	$(CC) Quamat_2mm.rb 3 2 $(PP)qmat32.nc 
	$(CC) Quamat_2mm.rb 3 2 2 $(PP)qmat322.nc 
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

