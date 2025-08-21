--Tunable VHF Radio LUA plugin with ATC sounds v1.1
--bugs: knob change last value, so cant remember last value, suggestion create load function and second store function
--bugs resolved 1) seems datarefs mic buttons are not writable
--              2) only 60 files allowed per function, limited by LUA, use COM2 as new function for region


dataref("comm", "sim/cockpit2/radios/actuators/com1_frequency_hz_833", "readonly")
dataref("comm2", "sim/cockpit2/radios/actuators/com2_frequency_hz_833", "readonly")
dataref("volumegain", "sim/cockpit2/radios/actuators/audio_volume_com1", "writable")
dataref("volumegain2", "sim/cockpit2/radios/actuators/audio_volume_com2", "writable")
dataref("battery", "sim/cockpit/electrical/battery_on", "readonly")
dataref("button_com2", "sim/cockpit2/radios/actuators/audio_selection_com2", "writable")
--dataref("com2_volume", "sim/cockpit2/radios/actuators/audio_volume_com2", "writable") -- for Zibo only general volume control 
--dataref("set_engine_vol", "sim/operation/sound/engine_volume_ratio", "writable") -- for Zibo only ENG volume slider in game
--dataref("obs_mic_button2", "laminar/B738/audio/obs/mic_button2", "readonly") -- for Zibo only big black VHF2 button on OBS
dataref("set_interior_vol", "sim/operation/sound/interior_volume_ratio", "writable") -- for Zibo only EXT volume slider in game
--dataref("obs_mic_button3", "laminar/B738/audio/obs/mic_button3", "readonly") -- for Zibo only big black VHF3 button on OBS
--dataref("set_fan_vol", "sim/operation/sound/fan_volume_ratio", "writable") -- for Zibo only FAN volume slider in game
--dataref("nav1_volume", "sim/cockpit2/radios/actuators/audio_volume_nav1", "writable") -- for Zibo only temp dataref



--dataref("comm", "sim/cockpit/radios/com1_freq_hz", "readonly")

local start_time = os.clock()
local do_once = false
local ONE = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/1.wav")
local TWO = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/2.wav")
local THREE = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/3.wav")
local LFMN118700 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LFMN118700.wav")
local LFMN124175 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LFMN124175.wav")
local LFMN126780 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LFMN126780.wav")
local UUEE118100 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/UUEE118100.wav")
local UUEE126000 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/UUEE126000.wav")
local LKPR125575 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LKPR125575.wav")
local LKPR121900 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LKPR121900.wav")
local LKPR118100 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LKPR118100.wav")
local LKAA132065 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LKAA132065.wav")
local LTBA120050 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LTBA120050.wav")
local LTBA132600 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LTBA132600.wav")
local YBBN132850 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/YBBN132850.wav")
local WMKB125800 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/WMKB125800.wav")
local WARR123200 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/WARR123200.wav")
local VTBS121700 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/VTBS121700.wav")
local VNKT126500 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/VNKT126500.wav")
local OPLA127500 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/OPLA127500.wav")
local OKBK125300 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/OKBK125300.wav")
local CYVR128600 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/CYVR128600.wav")
local KLAS119400 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KLAS119400.wav")
local KLAS119900 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KLAS119900.wav")
local KLAS121100 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KLAS121100.wav")
local KSEA126600 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KSEA126600.wav")
local PANC118300 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/PANC118300.wav")
local PANC132300 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/PANC132300.wav")
local KMIA118300 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KMIA118300.wav")
local KMIA120050 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KMIA120050.wav")
local TXKF128500 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/TXKF128500.wav")
local KJFK134500 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KJFK134500.wav")
local KJFK133500 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KJFK133500.wav")
local KIAD125050 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KIAD125050.wav")
local KBOS133125 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KBOS133125.wav")
local KFMY119000 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KFMY119000.wav")
local KFMY132400 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KFMY132400.wav")
local KHOU118700 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KHOU118700.wav")
local KIAH133600 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KIAH133600.wav")
local KPNS120650 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KPNS120650.wav")
local KSPG127400 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KSPG127400.wav")
local PHNL118100 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/PHNL118100.wav")
local PHNL124800 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/PHNL124800.wav")
local EINN134280 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/EINN134280.wav")
local EINN135230 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/EINN135230.wav")
local LFPO120500 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LFPO120500.wav")
local LSZH133400 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LSZH133400.wav")
local LSGG126050 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LSGG126050.wav")
local LPAZ132150 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LPAZ132150.wav")
local LPPT119100 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LPPT119100.wav")
local CYHZ133950 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/CYHZ133950.wav")
local CYYT133150 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/CYYT133150.wav")
local EHAA123700 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/EHAA123700.wav")
local LFLY118100 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LFLY118100.wav")
local MUFH120250 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/MUFH120250.wav")
local SAZS125500 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/SAZS125500.wav")
local SBCT118150 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/SBCT118150.wav")
local SBSP127150 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/SBSP127150.wav")
local SBSP134150 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/SBSP134150.wav")
local SUMU128000 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/SUMU128000.wav")
local KSFO121800 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KSFO121800.wav")
local KSFO134150 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KSFO134150.wav")
local KSFO128650 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KSFO128650.wav")
local KLAX121400 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KLAX121400.wav")
local KLAX133900 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KLAX133900.wav")
local KLAX132600 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KLAX132600.wav")
local RKSI128700 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/RKSI128700.wav")
local RJAA120020 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/RJAA120020.wav")
local USDD131700 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/USDD131700.wav")
local VHHH122550 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/VHHH122550.wav")
local ZBAA118600 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/ZBAA118600.wav")
local PAFA126500 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/PAFA126500.wav")
local KSFO135100 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/KSFO135100.wav")
local FMEE118400 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/FMEE118400.wav")
local FMMI128900 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/FMMI128900.wav")
local YSSY124550 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/YSSY124550.wav")
local GOBD120500 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/GOBD120500.wav")
local HAAB119700 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/HAAB119700.wav")
local DUMMY = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/DUMMY.wav")
let_sound_loop(ONE, false)
let_sound_loop(TWO, false)
let_sound_loop(THREE, false)
let_sound_loop(DUMMY, false)
lastsound=DUMMY
-------initial start
function waitforsimloaded()
    --if os.clock() > start_time + 59 and do_once == false then
	if os.clock() > start_time + 5 and do_once == false then
	--play_sound(ONE)
	volumegain=0.5 --default volume if no knob is available (prevents loud sounds)
	--FAN_MEM=set_fan_vol --temp value until bug resolved
	do_once=true
    end
end
--A320 sounds
function a320_sounds()
A320_ON = button_com2
if A320_ON == 1 then -- if A/C is A320 you can play those sounds
  --play_sound(ONE) -- debug 1 breakpoint
  --SIM_VOL = com2_volume -- and adjust it
  SIM_VOL = volumegain2
  if SIM_VOL <= 0.05 then SIM_VOL= 0.1 end -- prevent out of range
  if SIM_VOL >= 0.95 then SIM_VOL= 0.9 end -- prevent out of range
  --set( "sim/operation/sound/interior_volume_ratio", SIM_VOL) -- for sure access the dataref to set the volume
  set_interior_vol = SIM_VOL -- set volume from knob
end -- end of A320 sounds ON
end

------ ATC Comm1 fo EU/ASIA sounds
local chatter=0
function atc()
if battery == 1 then 
VOL = volumegain
VHF = comm
if VOL <= 0.05 then VOL= 0.1 end
if VOL >= 0.95 then VOL= 0.9 end
  set_sound_gain(UUEE118100, VOL);
  set_sound_gain(UUEE126000, VOL);
  set_sound_gain(USDD131700, VOL);
  set_sound_gain(LKPR125575, VOL);
  set_sound_gain(LKPR121900, VOL);
  set_sound_gain(LKPR118100, VOL);
  set_sound_gain(LKAA132065, VOL);
  set_sound_gain(LTBA120050, VOL);
  set_sound_gain(LTBA132600, VOL);
  set_sound_gain(YBBN132850, VOL);
  set_sound_gain(WMKB125800, VOL);
  set_sound_gain(WARR123200, VOL);
  set_sound_gain(VTBS121700, VOL);
  set_sound_gain(VNKT126500, VOL);
  set_sound_gain(OPLA127500, VOL);
  set_sound_gain(OKBK125300, VOL);
  set_sound_gain(LFMN118700, VOL);
  set_sound_gain(LFMN124175, VOL);
  set_sound_gain(LFMN126780, VOL);
  set_sound_gain(EINN134280, VOL); 
  set_sound_gain(EINN135230, VOL); 
  set_sound_gain(LFPO120500, VOL); 
  set_sound_gain(LSZH133400, VOL); 
  set_sound_gain(LSGG126050, VOL);
  set_sound_gain(LPAZ132150, VOL);   
  set_sound_gain(LPPT119100, VOL); 
  set_sound_gain(EHAA123700, VOL);
  set_sound_gain(LFLY118100, VOL);
  set_sound_gain(RKSI128700, VOL);
  set_sound_gain(RJAA120020, VOL);
  set_sound_gain(VHHH122550, VOL);
  set_sound_gain(ZBAA118600, VOL);
  set_sound_gain(FMEE118400, VOL);
  set_sound_gain(FMMI128900, VOL);
  set_sound_gain(YSSY124550, VOL);
  set_sound_gain(GOBD120500, VOL);
  set_sound_gain(HAAB119700, VOL);
  set_sound_gain(DUMMY, 0.1);
 if VHF == 118100 and chatter == 0 then pause_sound(lastsound); play_sound(UUEE118100); lastsound=UUEE118100; chatter=1 else pause_sound(UUEE118100) end
 if VHF == 126000 and chatter == 0 then pause_sound(lastsound); play_sound(UUEE126000); lastsound=UUEE126000; chatter=1 else pause_sound(UUEE126000) end 
 if VHF == 131700 and chatter == 0 then pause_sound(lastsound); play_sound(USDD131700); lastsound=USDD131700; chatter=1 else pause_sound(USDD131700) end 
 if VHF == 125575 and chatter == 0 then pause_sound(lastsound); play_sound(LKPR125575); lastsound=LKPR125575; chatter=1 else pause_sound(LKPR125575) end
 if VHF == 121900 and chatter == 0 then pause_sound(lastsound); play_sound(LKPR121900); lastsound=LKPR121900; chatter=1 else pause_sound(LKPR121900) end
 if VHF == 118150 and chatter == 0 then pause_sound(lastsound); play_sound(LKPR118100); lastsound=LKPR118100; chatter=1 else pause_sound(LKPR118100) end
 if VHF == 132065 and chatter == 0 then pause_sound(lastsound); play_sound(LKAA132065); lastsound=LKAA132065; chatter=1 else pause_sound(LKAA132065) end
 if VHF == 120050 and chatter == 0 then pause_sound(lastsound); play_sound(LTBA120050); lastsound=LTBA120050; chatter=1 else pause_sound(LTBA120050) end 
 if VHF == 132600 and chatter == 0 then pause_sound(lastsound); play_sound(LTBA132600); lastsound=LTBA132600; chatter=1 else pause_sound(LTBA132600) end
 if VHF == 132850 and chatter == 0 then pause_sound(lastsound); play_sound(YBBN132850); lastsound=YBBN132850; chatter=1 else pause_sound(YBBN132850) end
 if VHF == 125800 and chatter == 0 then pause_sound(lastsound); play_sound(WMKB125800); lastsound=WMKB125800; chatter=1 else pause_sound(WMKB125800) end
 if VHF == 123200 and chatter == 0 then pause_sound(lastsound); play_sound(WARR123200); lastsound=WARR123200; chatter=1 else pause_sound(WARR123200) end
 if VHF == 121700 and chatter == 0 then pause_sound(lastsound); play_sound(VTBS121700); lastsound=VTBS121700; chatter=1 else pause_sound(VTBS121700) end
 if VHF == 126500 and chatter == 0 then pause_sound(lastsound); play_sound(VNKT126500); lastsound=VNKT126500; chatter=1 else pause_sound(VNKT126500) end
 if VHF == 127500 and chatter == 0 then pause_sound(lastsound); play_sound(OPLA127500); lastsound=OPLA127500; chatter=1 else pause_sound(OPLA127500) end
 if VHF == 125300 and chatter == 0 then pause_sound(lastsound); play_sound(OKBK125300); lastsound=OKBK125300; chatter=1 else pause_sound(OKBK125300) end
 if VHF == 118700 and chatter == 0 then pause_sound(lastsound); play_sound(LFMN118700); lastsound=LFMN118700; chatter=1 else pause_sound(LFMN118700) end
 if VHF == 124175 and chatter == 0 then pause_sound(lastsound); play_sound(LFMN124175); lastsound=LFMN124175; chatter=1 else pause_sound(LFMN124175) end
 if VHF == 126780 and chatter == 0 then pause_sound(lastsound); play_sound(LFMN126780); lastsound=LFMN126780; chatter=1 else pause_sound(LFMN126780) end
 if VHF == 134280 and chatter == 0 then pause_sound(lastsound); play_sound(EINN134280); lastsound=EINN134280; chatter=1 else pause_sound(EINN134280) end
 if VHF == 135230 and chatter == 0 then pause_sound(lastsound); play_sound(EINN135230); lastsound=EINN135230; chatter=1 else pause_sound(EINN135230) end
 if VHF == 120500 and chatter == 0 then pause_sound(lastsound); play_sound(LFPO120500); lastsound=LFPO120500; chatter=1 else pause_sound(LFPO120500) end
 if VHF == 133400 and chatter == 0 then pause_sound(lastsound); play_sound(LSZH133400); lastsound=LSZH133400; chatter=1 else pause_sound(LSZH133400) end
 if VHF == 126050 and chatter == 0 then pause_sound(lastsound); play_sound(LSGG126050); lastsound=LSGG126050; chatter=1 else pause_sound(LSGG126050) end
 if VHF == 132150 and chatter == 0 then pause_sound(lastsound); play_sound(LPAZ132150); lastsound=LPAZ132150; chatter=1 else pause_sound(LPAZ132150) end
 if VHF == 119100 and chatter == 0 then pause_sound(lastsound); play_sound(LPPT119100); lastsound=LPPT119100; chatter=1 else pause_sound(LPPT119100) end
 if VHF == 123700 and chatter == 0 then pause_sound(lastsound); play_sound(EHAA123700); lastsound=EHAA123700; chatter=1 else pause_sound(EHAA123700) end
 if VHF == 118125 and chatter == 0 then pause_sound(lastsound); play_sound(LFLY118100); lastsound=LFLY118100; chatter=1 else pause_sound(LFLY118100) end
 if VHF == 128700 and chatter == 0 then pause_sound(lastsound); play_sound(RKSI128700); lastsound=RKSI128700; chatter=1 else pause_sound(RKSI128700) end
 if VHF == 120020 and chatter == 0 then pause_sound(lastsound); play_sound(RJAA120020); lastsound=RJAA120020; chatter=1 else pause_sound(RJAA120020) end
 if VHF == 122550 and chatter == 0 then pause_sound(lastsound); play_sound(VHHH122550); lastsound=VHHH122550; chatter=1 else pause_sound(VHHH122550) end
 if VHF == 118600 and chatter == 0 then pause_sound(lastsound); play_sound(ZBAA118600); lastsound=ZBAA118600; chatter=1 else pause_sound(ZBAA118600) end
 if VHF == 118400 and chatter == 0 then pause_sound(lastsound); play_sound(FMEE118400); lastsound=FMEE118400; chatter=1 else pause_sound(FMEE118400) end
 if VHF == 128900 and chatter == 0 then pause_sound(lastsound); play_sound(FMMI128900); lastsound=FMMI128900; chatter=1 else pause_sound(FMMI128900) end
 if VHF == 124550 and chatter == 0 then pause_sound(lastsound); play_sound(YSSY124550); lastsound=YSSY124550; chatter=1 else pause_sound(YSSY124550) end
 if VHF == 120550 and chatter == 0 then pause_sound(lastsound); play_sound(GOBD120500); lastsound=GOBD120500; chatter=1 else pause_sound(GOBD120500) end
 if VHF == 119700 and chatter == 0 then pause_sound(lastsound); play_sound(HAAB119700); lastsound=HAAB119700; chatter=1 else pause_sound(HAAB119700) end
  --if VHF ~= 118700 then pause_sound(lastsound); play_sound(DUMMY); lastsound=DUMMY; chatter=0 end
 -- if VHF ~= 124175 then pause_sound(lastsound); play_sound(DUMMY); lastsound=DUMMY; chatter=0 end
  --if chatter == 1 then play_sound(TWO) end
  --if chatter == 0 then play_sound(ONE) end
  chatter=0
  else pause_sound(lastsound) end
end
  
------ ATC Comm2 for America sounds
function atc2()
 if battery == 1 then 
VOL2 = volumegain2
VHF2 = comm2
if VOL2 <= 0.05 then VOL2= 0.1 end
if VOL2 >= 0.95 then VOL2= 0.9 end
  set_sound_gain(CYVR128600, VOL2);
  set_sound_gain(KLAS119400, VOL2);
  set_sound_gain(KLAS119900, VOL2);
  set_sound_gain(KLAS121100, VOL2);
  set_sound_gain(KSEA126600, VOL2);
  set_sound_gain(PANC118300, VOL2);
  set_sound_gain(PANC132300, VOL2);
  set_sound_gain(KMIA118300, VOL2);
  set_sound_gain(KMIA120050, VOL2);
  set_sound_gain(TXKF128500, VOL2);
  set_sound_gain(KJFK134500, VOL2);
  set_sound_gain(KJFK133500, VOL2);
  set_sound_gain(KIAD125050, VOL2);
  set_sound_gain(KBOS133125, VOL2);
  set_sound_gain(KFMY119000, VOL2);
  set_sound_gain(KFMY132400, VOL2);
  set_sound_gain(KHOU118700, VOL2);
  set_sound_gain(KIAH133600, VOL2);
  set_sound_gain(KPNS120650, VOL2);
  set_sound_gain(KSPG127400, VOL2);
  set_sound_gain(PHNL118100, VOL2);
  set_sound_gain(PHNL124800, VOL2);
  set_sound_gain(CYHZ133950, VOL2);  
  set_sound_gain(CYYT133150, VOL2);
  set_sound_gain(MUFH120250, VOL2);
  set_sound_gain(SAZS125500, VOL2);
  set_sound_gain(SBCT118150, VOL2);
  set_sound_gain(SBSP127150, VOL2);
  set_sound_gain(SBSP134150, VOL2);
  set_sound_gain(SUMU128000, VOL2);
  set_sound_gain(KSFO121800, VOL2);
  set_sound_gain(KSFO134150, VOL2);
  set_sound_gain(KSFO128650, VOL2);
  set_sound_gain(KLAX121400, VOL2);
  set_sound_gain(KLAX133900, VOL2);
  set_sound_gain(KLAX132600, VOL2);
  set_sound_gain(PAFA126500, VOL2);
  set_sound_gain(DUMMY, 0.1);
 if VHF2 == 128600 and chatter == 0 then pause_sound(lastsound); play_sound(CYVR128600); lastsound=CYVR128600; chatter=1 else pause_sound(CYVR128600) end
 if VHF2 == 119400 and chatter == 0 then pause_sound(lastsound); play_sound(KLAS119400); lastsound=KLAS119400; chatter=1 else pause_sound(KLAS119400) end
 if VHF2 == 121100 and chatter == 0 then pause_sound(lastsound); play_sound(KLAS121100); lastsound=KLAS121100; chatter=1 else pause_sound(KLAS121100) end
 if VHF2 == 119900 and chatter == 0 then pause_sound(lastsound); play_sound(KLAS119900); lastsound=KLAS119900; chatter=1 else pause_sound(KLAS119900) end
 if VHF2 == 126600 and chatter == 0 then pause_sound(lastsound); play_sound(KSEA126600); lastsound=KSEA126600; chatter=1 else pause_sound(KSEA126600) end
 if VHF2 == 118300 and chatter == 0 then pause_sound(lastsound); play_sound(PANC118300); lastsound=PANC118300; chatter=1 else pause_sound(PANC118300) end
 if VHF2 == 132300 and chatter == 0 then pause_sound(lastsound); play_sound(PANC132300); lastsound=PANC132300; chatter=1 else pause_sound(PANC132300) end
 if VHF2 == 118310 and chatter == 0 then pause_sound(lastsound); play_sound(KMIA118300); lastsound=KMIA118300; chatter=1 else pause_sound(KMIA118300) end
 if VHF2 == 120055 and chatter == 0 then pause_sound(lastsound); play_sound(KMIA120050); lastsound=KMIA120050; chatter=1 else pause_sound(KMIA120050) end
 if VHF2 == 128500 and chatter == 0 then pause_sound(lastsound); play_sound(TXKF128500); lastsound=TXKF128500; chatter=1 else pause_sound(TXKF128500) end
 if VHF2 == 134500 and chatter == 0 then pause_sound(lastsound); play_sound(KJFK134500); lastsound=KJFK134500; chatter=1 else pause_sound(KJFK134500) end
 if VHF2 == 133500 and chatter == 0 then pause_sound(lastsound); play_sound(KJFK133500); lastsound=KJFK133500; chatter=1 else pause_sound(KJFK133500) end
 if VHF2 == 125050 and chatter == 0 then pause_sound(lastsound); play_sound(KIAD125050); lastsound=KIAD125050; chatter=1 else pause_sound(KIAD125050) end
 if VHF2 == 133125 and chatter == 0 then pause_sound(lastsound); play_sound(KBOS133125); lastsound=KBOS133125; chatter=1 else pause_sound(KBOS133125) end
 if VHF2 == 119000 and chatter == 0 then pause_sound(lastsound); play_sound(KFMY119000); lastsound=KFMY119000; chatter=1 else pause_sound(KFMY119000) end
 if VHF2 == 132400 and chatter == 0 then pause_sound(lastsound); play_sound(KFMY132400); lastsound=KFMY132400; chatter=1 else pause_sound(KFMY132400) end
 if VHF2 == 118705 and chatter == 0 then pause_sound(lastsound); play_sound(KHOU118700); lastsound=KHOU118700; chatter=1 else pause_sound(KHOU118700) end
 if VHF2 == 133600 and chatter == 0 then pause_sound(lastsound); play_sound(KIAH133600); lastsound=KIAH133600; chatter=1 else pause_sound(KIAH133600) end
 if VHF2 == 120650 and chatter == 0 then pause_sound(lastsound); play_sound(KPNS120650); lastsound=KPNS120650; chatter=1 else pause_sound(KPNS120650) end
 if VHF2 == 127400 and chatter == 0 then pause_sound(lastsound); play_sound(KSPG127400); lastsound=KSPG127400; chatter=1 else pause_sound(KSPG127400) end
 if VHF2 == 118105 and chatter == 0 then pause_sound(lastsound); play_sound(PHNL118100); lastsound=PHNL118100; chatter=1 else pause_sound(PHNL118100) end
 if VHF2 == 124800 and chatter == 0 then pause_sound(lastsound); play_sound(PHNL124800); lastsound=PHNL124800; chatter=1 else pause_sound(PHNL124800) end
 if VHF2 == 133950 and chatter == 0 then pause_sound(lastsound); play_sound(CYHZ133950); lastsound=CYHZ133950; chatter=1 else pause_sound(CYHZ133950) end
 if VHF2 == 133150 and chatter == 0 then pause_sound(lastsound); play_sound(CYYT133150); lastsound=CYYT133150; chatter=1 else pause_sound(CYYT133150) end
 if VHF2 == 120250 and chatter == 0 then pause_sound(lastsound); play_sound(MUFH120250); lastsound=MUFH120250; chatter=1 else pause_sound(MUFH120250) end
 if VHF2 == 125500 and chatter == 0 then pause_sound(lastsound); play_sound(SAZS125500); lastsound=SAZS125500; chatter=1 else pause_sound(SAZS125500) end
 if VHF2 == 118155 and chatter == 0 then pause_sound(lastsound); play_sound(SBCT118150); lastsound=SBCT118150; chatter=1 else pause_sound(SBCT118150) end
 if VHF2 == 127150 and chatter == 0 then pause_sound(lastsound); play_sound(SBSP127150); lastsound=SBSP127150; chatter=1 else pause_sound(SBSP127150) end
 if VHF2 == 134150 and chatter == 0 then pause_sound(lastsound); play_sound(SBSP134150); lastsound=SBSP134150; chatter=1 else pause_sound(SBSP134150) end
 if VHF2 == 128000 and chatter == 0 then pause_sound(lastsound); play_sound(SUMU128000); lastsound=SUMU128000; chatter=1 else pause_sound(SUMU128000) end
 if VHF2 == 121800 and chatter == 0 then pause_sound(lastsound); play_sound(KSFO121800); lastsound=KSFO121800; chatter=1 else pause_sound(KSFO121800) end
 if VHF2 == 134155 and chatter == 0 then pause_sound(lastsound); play_sound(KSFO134150); lastsound=KSFO134150; chatter=1 else pause_sound(KSFO134150) end
 if VHF2 == 128650 and chatter == 0 then pause_sound(lastsound); play_sound(KSFO128650); lastsound=KSFO128650; chatter=1 else pause_sound(KSFO128650) end
 if VHF2 == 121400 and chatter == 0 then pause_sound(lastsound); play_sound(KLAX121400); lastsound=KLAX121400; chatter=1 else pause_sound(KLAX121400) end
 if VHF2 == 133900 and chatter == 0 then pause_sound(lastsound); play_sound(KLAX133900); lastsound=KLAX133900; chatter=1 else pause_sound(KLAX133900) end
 if VHF2 == 132650 and chatter == 0 then pause_sound(lastsound); play_sound(KLAX132600); lastsound=KLAX132600; chatter=1 else pause_sound(KLAX132600) end
 if VHF2 == 126500 and chatter == 0 then pause_sound(lastsound); play_sound(PAFA126500); lastsound=PAFA126500; chatter=1 else pause_sound(PAFA126500) end
 if VHF2 == 135100 and chatter == 0 then pause_sound(lastsound); play_sound(KSFO135100); lastsound=KSFO135100; chatter=1 else pause_sound(KSFO135100) end
 
  --if VHF ~= 118700 then pause_sound(lastsound); play_sound(DUMMY); lastsound=DUMMY; chatter=0 end
 -- if VHF ~= 124175 then pause_sound(lastsound); play_sound(DUMMY); lastsound=DUMMY; chatter=0 end
  --if chatter == 1 then play_sound(TWO) end
  --if chatter == 0 then play_sound(ONE) end
  chatter=0
  else pause_sound(lastsound) end
end
--play_sound(TWO)
do_often("waitforsimloaded()")

do_often("a320_sounds()")

do_often("atc()")
do_often("atc2()")