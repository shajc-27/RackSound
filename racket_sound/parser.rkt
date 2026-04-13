#lang brag
rsnd-program : [rsnd-line] (/NEWLINE [rsnd-line])*
rsnd-line : [rsnd-statement] [rsnd-rem]*
@rsnd-statement : play | stop | speed | playTogether | repeat | repend | inst


play : "PLAY" [rsnd-tone] 
stop : "STOP" INTEGER 
speed : "SPEED" INTEGER 
playTogether : "PLAY-TOGETHER" [rsnd-tone] (/"," [rsnd-tone])* 
repeat : "REPEAT" INTEGER
repend : "END" 
inst : "INSTRUMENT" rsnd-inst
bpm : "SET BPM" INTEGER



@rsnd-inst : rsnd-inst-ref rsnd-strum 
@rsnd-inst-ref : STRING
@rsnd-rem : [rsnd-tone] | INTEGER | VOID
@rsnd-tone : (/"[" [inst] [rsnd-note] /"]") 
@rsnd-strum : "TRUMPET" | "PIANO" | "DRUM" | "FLUTE" | "PURE" ;ETC
@rsnd-note : STRING 



; defining statements
#|rsnd-line : line-num [statement] [rsnd-arg]*
;rsnd-program : [rsnd-line] (/NEWLINE [rsnd-line])*
;rsnd-arg : INTEGER | strum | key 
;@line-num : INTEGER
;@statement : inst | play | stop | speed | playTogether | repeat

;inst   : "INSTRUMENT" strum
;play   : "PLAY" strum key 
;stop   : "STOP"  INTEGER
;speed  : "SPEED" INTEGER
;playTogether  : "PLAY-TOGETHER" strum key strum key 
;repeat : "REPEAT" INTEGER
;repend : "END" ;

;key    :  STRING
;strum  : "TRUMPET" | "PIANO" | "DRUM" | "FLUTE" | "PURE"  ;and so on.

; @ = unwraps a redundant statement line, basically stops from each line being in layered parentheses
; / = "Ignorer", parser throws away after.
; to my knowledge '@' is moreso for readability, since it just "hides" the stuff.

; I just followed the proposal's keywords:

;INSTRUMENT handle {"PATH"
   ;or family SPEC ; or which no. sample to draw from}
;PLAY (handle PIANO-KEY)
    ; creates a new rsound with all the same parameters except for the specified piano-key w/ synth-note
    ; or synth-note/raw if a envolope needs to be applied
;STOP (beats)
    ; stops playing sound for the beats specified
;SPEED (BPM)
    ; sets the speed to bpm. the documentation mentions 22010 as a half-second, so a number conversion formula may be needed. (* (BPM / 60) 44020) a predicted formula
;*PLAY (handle piano-key) (handle piano-key)
    ; plays 2 or more sounds at the exact same beat. Care needs to be taken to avoid clipping or wrapping the sound, perhaps by modifying the rsound with rs-scale or dampening it somehow.
;*REPEAT N *END
    ; the default repeat.

;EXAMPLE
;b-program : [b-line] (/NEWLINE [b-line])*
;b-line : b-line-num [b-statement] (/":" [b-statement])* [b-rem]
;@b-line-num : INTEGER
;@b-statement : b-end | b-print | b-goto
;b-rem : REM
;b-end : /"end"
;b-print : /"print" [b-printable] (/";" [b-printable])*
;@b-printable : STRING | b-expr
;b-goto : /"goto" b-expr
;b-expr : b-sum
;b-sum : b-number (/"+" b-number)*
;@b-number : INTEGER | DECIMAL
