LUA plugin for x-plane VHF radios. 
Tune ATC wav files directly from your radio buttons by frequency

Features:
-use aircrafts VHF radios by the knob and desired frequency
-available after you power up the avionics
-comes with 75 various ATC archived feeds (Control area, Tower and Approach from july 2023), list in AAAradios.PDF
-you can add plenty of WAV ATC feeds from LiveATC.NET or other sources to your ATC library and use it by
 editing the lua script (recommended for advanced users)
-no realtime ATC
-one frequency means one facility
-when you switch to another frequency the previous one is paused and will continue when switched back
 (limitation by LUA)

Description:
If you dont like default ATC and dont like using web based online liveATC streams this is for you.
Its not realtime listening because LUA cannot handle that.
As it is this LUA script binds WAV files from ATC streams to desired VHF frequency available for your default VHF
radios. It should work on all x-plane aircrafts no matter if its freeware or payware.
Currently uses more than 75 stations around the world. Western hemisphere uses COM2 radio panel, Eastern COM1.
All of them are available on liveatc.net archives by station on selected date. It has each by default 30 minutes.
So if you want you can add more frequencies with more ATC feeds (WAV files only, no MP3) by adding some data
into CHATTER folder and lua script. How to do it see manual.txt file.
This will add more life to your flight.


Requirements:
X-Plane 11/12
FlywithLUA v2.2+
3.5GB of space free


Installation:
Copy my_radio_world.lua and CHATTER folder to your x-plane Resources/plugins/flywithlua/scripts/ folder


Limitations:
none


Known bugs:
none

Custom WAV files HOWTO:
see manual.txt

Version 2.2
Gaston 2025
support:
gastonreif@gmail.com



