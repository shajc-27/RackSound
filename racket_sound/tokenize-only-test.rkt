#lang racket_sound/tokenize-only

INSTRUMENT 'ca' PIANO ; REPLACE WITH WAVEFORM? 
INSTRUMENT 'ra' PIANO 
PLAY 'ca' E5
PLAY* 'ca' E5 'ra' E5
REPEAT 5
PLAY 'ca' B3
END
