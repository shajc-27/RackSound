#lang racket_sound/parse-only
<<<<<<< HEAD
INSTRUMENT "ca" "PIANO"
REPEAT 5
=======

SPEED 20
;SET BPM 210
INSTRUMENT PIANO
PLAY PIANO E5
STOP 3
REPEAT 5
;PLAY ["va" E5] ; is this meant to be PLAY-TOGETHER, or...?
PLAY* PIANO E3 TRUMPET C5 ;do we need splitter?
END



; in the current context, don't get the reasoning for naming the piano...
;INSTRUMENT "va" PIANO
;PLAY "va" E5
;REPEAT 5 
;PLAY ["va" E5]
;END 
>>>>>>> 6d0f63bdba224acdef73a32485fcae6163776c8c
