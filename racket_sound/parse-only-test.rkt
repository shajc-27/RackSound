#lang racket_sound/parse-only

SPEED 20
;SET BPM 210
INSTRUMENT 'va' PIANO
INSTRUMENT 'ta' TRUMPET
PLAY 'va' PIANO E5
STOP 3
REPEAT 5
;PLAY ["va" E5] ; is this meant to be PLAY-TOGETHER, or...?
PLAY* 'va' E3 'ta' C5 ;do we need splitter?
END