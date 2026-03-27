Names: Jack Shapely and Charles Reed 

Documentation for Package :  https://web.archive.org/web/20260101215513/https://docs.racket-lang.org/rsound/index.html
Possible helpful imports: rsound/single-cycle

Limitations: on linux distros, this DSL will require installing the libportaudio library, as it is a dependancy for rsound.   

Lang Name: RackSound. A domain-specific language intended to simplify the creation of audio tracks by providing a text-based track generator. 


Example Programs:
1: (GENERAL USE)
#(package .. 
;"spec" is for which sound out of the family to play. 
; specs are included as part of the rsound package. 
;The documentation specifically uses vgame, though
;it may be possible to add custom samples through the provided rs-read.
+INSTRUMENT K { "path" PATH }  
+INSTRUMENT B { FAMILY "vgame" }  
;PROCEDURE DIVISION
;INDIVIDUAL PLAY
PLAY (K C6)
PLAY (B C6)
;GROUP PLAY
*PLAY (K C6) (B C6)   
;LOOP PLAY
REPEAT 5 
  PLAY K As5
  PLAY K Bb6
  PLAY K C6
END  

2: (BASSLINE) 
#include racket...
+SPEED BPM
INSTRUMENT dru (drums 1 1 20) 
REPEAT 5
PLAY (dru C5)
WAIT 5
PLAY (dru C5)
PLAY (dru A5)
WAIT 5
*PLAY (dru C5) (dru D5)
END


4: We plan to use AI as little as possible- only for debugging or testing. 

5: 

6:A lot of music programs on the market - especially LMMS Studio - are rather unintuitive to use for beginners. By providing a stripped down lightweight interface, one can get a feel of how to make good sound without having to dedicate hours/money to learning a program. Most of my time as a beginner musician was focused on trying to figure out the UI of certain programs rather than just going and creating soundtracks via trial and error. This attempts to try and help that. 

Each line of the language will, hopefully, come to represent one "beat". Rests can be done by playing a note of 0 sound, and speedups/speeddowns should hopefully be possible by changing the duration of each note. 

Keywords should be 

INSTRUMENT handle {"PATH" ;or family SPEC ; or which no. sample to draw from} 

PLAY (handle PIANO-KEY) ; creates a new rsound with all the same parameters except for the specified piano-key w/ synth-note or synth-note/raw if a envolope needs to be applied

STOP (beats) ;stops playing sound for the beats specified

SPEED (BPM) ;sets the speed to bpm. the documentation mentions 22010 as a half-second, so a number conversion formula may be needed. (* (BPM / 60) 44020) a predicted formula 

*PLAY (handle piano-key) (handle piano-key) ; plays 2 or more sounds at the exact same beat. Care needs to be taken to avoid clipping or wrapping the sound, perhaps by modifying the rsound with rs-scale or dampening it somehow. 

*REPEAT N
*END ; the default repeat. 



