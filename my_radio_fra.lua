--1.01 fully working version
--fixed continued sounds playing after loosing avionics power 
--bugs none found

dataref("comm1", "sim/cockpit/radios/com1_freq_hz", "readonly")
dataref("battery", "sim/cockpit/electrical/battery_on", "readonly")

local LFMN118700 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LFMN118700.wav")
local LFMN124175 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LFMN124175.wav")
local LFMN126780 = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/LFMN126780.wav")
local DUMMY = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/DUMMY.wav")
local RING = load_WAV_file(SCRIPT_DIRECTORY .. "CHATTER/RING.wav")
let_sound_loop(RING, false)
let_sound_loop(DUMMY, true)
local chatter = 0
lastsound=DUMMY
function playit() 
VHF = comm1
 if battery == 0 then 
  set_sound_gain(RING, 0.1); pause_sound(lastsound); play_sound(RING); lastsound=RING; chatter=0
  else
  set_sound_gain(LFMN118700, 0.1);
  set_sound_gain(LFMN124175, 0.1);
  set_sound_gain(LFMN126780, 0.1);
  set_sound_gain(DUMMY, 0.1);
  if VHF == 11870 then pause_sound(lastsound); play_sound(LFMN118700); lastsound=LFMN118700; chatter=1 end
  if VHF == 12417 then pause_sound(lastsound); play_sound(LFMN124175); lastsound=LFMN124175; chatter=1 end 
  if VHF == 12678 then pause_sound(lastsound); play_sound(LFMN126780); lastsound=LFMN126780; chatter=1 end
  if VHF ~= 12678 and VHF ~= 12417 and VHF ~= 11870 then pause_sound(lastsound); play_sound(DUMMY); lastsound=DUMMY; chatter=1 end
 end
end

do_often("playit()")


