#lang racket_sound/parse-only
INSTRUMENT 'ca' PIANO
INSTRUMENT 'da' PIANO
SYNTH 'bva' {
            pitch:12341
            duration:23421
            volume: 4543
            }
PLAY 'ca' B6
PLAY 'ca' E5, 'ra' E5
PLAY 'bva' E6
STOP
SPEED 5
;REPEAT 5
PLAY 'ca' A5 G5 D5 5,
;REPEND


DISPLAY

; the one that def works
;#lang racket_sound/parse-only
;INSTRUMENT 'ca' PIANO
;INSTRUMENT 'da' PIANO
;PLAY 'ca' B6
;PLAY 'ca' E5, 'ra' E5
;STOP 
;REPEAT 5
;PLAY 'ca' A5
;REPEND