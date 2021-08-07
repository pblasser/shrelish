CC=-ruby -d -W0
PP= | perl "./mmbaker.pl" > ciatBASTL2020//
 
main: clean
	$(CC) MountBar.rb 4 1 $(PP)mounter.nc
	$(CC) Studworth.rb 1 1 1 $(PP)4mm_studworth11_top.nc
	$(CC) Studworth.rb 1 1 2 $(PP)4mm_studworth11_bot.nc
	$(CC) Studworth.rb 2 1 1 $(PP)4mm_studworth21_top.nc
	$(CC) Studworth.rb 2 1 2 $(PP)4mm_studworth21_bot.nc
	$(CC) Interojoke.rb grassi mocante $(PP)igm.nc
	$(CC) Interojoke.rb grassi $(PP)ig.nc
	$(CC) Interojoke.rb mocante $(PP)im.nc
	$(CC) Tocante.rb 2 1 1 $(PP)tocante21_top.nc
	$(CC) Tocante.rb 2 1 2 $(PP)tocante21_bot.nc
	$(CC) Shnth.rb 2 2 $(PP)shnth22.nc
	$(CC) Barre_2mm.rb 5 2 $(PP)shbarre52.nc
	$(CC) Barre_2mm.rb 5 2 2 $(PP)shbarre522.nc
	$(CC) CocoBot.rb $(PP)cocobot.nc
	$(CC) CocoCoco.rb 2 2 $(PP)cocococo22.nc
	$(CC) CocoQuanto.rb 1 2 $(PP)cocoquanto12.nc
	$(CC) CocoQuanto_pre.rb 1 2 $(PP)cocoquanto12_pre.nc
	$(CC) CocoStrip_darrin.rb 4 2 $(PP)cocostrip42.nc
	$(CC) PlumBot.rb $(PP)plumbot.nc 
	$(CC) Plumbutt.rb 1 2 $(PP)plumbutt12.nc 
	$(CC) Plumbutt_pre.rb 1 2 $(PP)plumbutt12_pre.nc 
	$(CC) Plumsteam.rb 1 2 $(PP)plumsteam12.nc 
	$(CC) Plumdeerboo.rb 2 2 $(PP)plumdeer22.nc 
	$(CC) Plumdeer_pre.rb 2 2 $(PP)plumdeer22_pre.nc 
	$(CC) Sidrax.rb $(PP)sidrax.nc 
	$(CC) Sidbar_2mm.rb 5 2 $(PP)sidbar52.nc 
	$(CC) Sidbar_2mm.rb 5 2 3 $(PP)sidbar523.nc 
	$(CC) Sidbar_2mm.rb 5 2 0 0 $(PP)sidbar5200.nc 
	$(CC) Sidmat_2mm.rb 3 2 $(PP)sidmat32.nc  
	$(CC) Tetrax.rb $(PP)tetrax.nc 
	$(CC) Tetbar_2mm.rb 5 2 $(PP)tetbar52.nc 
	$(CC) Tetbar_2mm.rb 5 2 2 $(PP)tetbar522.nc 
	$(CC) Tetmat_2mm.rb 3 2 $(PP)tetmat32.nc
	$(CC) Quatrax.rb $(PP)quatrax.nc 
	$(CC) Quabar_2mm.rb 5 2 $(PP)quabar52.nc 
	$(CC) Quabar_2mm.rb 5 2 3 $(PP)quabar523.nc 
	$(CC) Quamat_2mm.rb 3 2 $(PP)quamat32.nc 
	$(CC) Quamat_2mm.rb 3 2 2 $(PP)quamat322.nc 
	$(CC) RolzBot.rb $(PP)robot.nc 
	$(CC) RolzTop.rb 5 2 $(PP)rotop52.nc 
	$(CC) RolzTop.rb 5 2 3 $(PP)rotop523.nc 
	$(CC) DeerhornBot.rb $(PP)deerbot.nc 
	$(CC) DeerhornTop_darrin.rb 2 2 $(PP)deertop22.nc 
	$(CC) DeerhornTop_darrin.rb 2 2 0 $(PP)deertop220.nc 
	$(CC) Stuberbot.rb $(PP)stuberbot.nc 
	$(CC) Stubertop.rb JOHNSON $(PP)stubertop_johnson.nc 
	$(CC) Stubertop.rb STUDS $(PP)stubertop_studs.nc 
 
clean:
	-rm *.nc
	-rm ciatBASTL2020/*.nc

jomp:CC=-ruby -W0
jomp:PP= | perl "./mmmaker.pl" > I:/
#jomp:PP= | perl "./mmmaker.pl" > ../temp/
jomp:main


