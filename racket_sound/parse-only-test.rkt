#lang racket_sound/parse-only

INSTRUMENT PIANO
PLAY PIANO E5
REPEAT 5
;PLAY ["va" E5] ; is this meant to be PLAY-TOGETHER, or...?
END

; in the current context, don't get the reasoning for naming the piano...
;INSTRUMENT "va" PIANO
;PLAY "va" E5
;REPEAT 5 
;PLAY ["va" E5]
;END 