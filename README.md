<h2>DESCRIPTION</h2>
<p>
INSTRUMENT 'ref' type
  - ref: name of instrument
  - type: Instrument type, PIANO or SYNTH

PLAY 'ref' note* len
  - ref: name of instrument
  - note: octave + key combination describing a note (e.g. G5)
    * multiple notes in a line make a chord
  - len: length of note(s)
</p>

<h2>EX PROGRAMS:</h2>
<p>
INSTRUMENT 'ca' PIANO  
PLAY 'ca' E5 A4 B6 24000  
PLAY 'ca' A5 E2 24000  
PLAY 'ca' B3 24000  
</p> <p>
INSTRUMENT 'ra' SINE  
PLAY 'ra' B5 48000  
PLAY 'ra' A5 24000  
PLAY 'ra' F5 24000  
PLAY 'ra' B5 48000  
PLAY 'ra' A5 24000  
PLAY 'ra' F5 24000  
PLAY 'ra' B5 48000  
PLAY 'ra' A5 24000  
PLAY 'ra' E5 12000  
PLAY 'ra' D5 12000  
PLAY 'ra' E5 48000  
</p>

<h2>INSTRUCTIONS</h2>
<p>
Begin by adding however many instrument types you want for your program. It is 
then a simple matter of adding the desired sequence of notes until the program
is complete. Note that resampling rate is 48000 for the length intervals.
</p>