#lang racket_sound/parse-only




INSTRUMENT 'ca' PIANO ; REPLACE WITH WAVEFORM? 
INSTRUMENT 'ra' PIANO 
PLAY 'ca' E5
PLAY* 'ca' E5 'ra' E5
REPEAT 5
PLAY 'ca' B3
END

; in the current context, don't get the reasoning for naming the piano...
;INSTRUMENT "va" PIANO
;PLAY "va" E5
;REPEAT 5 
;PLAY ["va" E5]
;END 
