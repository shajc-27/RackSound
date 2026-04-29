#lang brag
rsnd-program : [rsnd-line] (/NEWLINE [rsnd-line])*
@rsnd-line : [rsnd-statement | rsnd-dec]  ;([rsnd-statement] [rsnd-inst | rsnd-strum | rsnd-tone])*
@rsnd-statement : play | stop | speed |rsnd-loop
@rsnd-dec : inst
@rsnd-loop: repeat /NEWLINE (rsnd-line [/NEWLINE])* repend

@rsnd-line-num : INTEGER
play   : /"PLAY" [rsnd-tone] (/COMMA [rsnd-tone])*
stop   : /"STOP"
speed  : /"SPEED" ;SPEED vs BPM?
;playTogether : /"*PLAY" [rsnd-tone] /COMMA ([rsnd-tone])*
repeat : /"REPEAT" INTEGER
repend : /"REPEND" 
inst   : /"INSTRUMENT" [rsnd-inst]
bpm    : /"SET BPM" INTEGER

;@rsnd-inst : STRUMTYPE
; alt inst definition -
@rsnd-inst     : [rsnd-inst-ref] [rsnd-strum]
@rsnd-inst-ref : STRING
@rsnd-strum    : STRUMTYPE
@rsnd-tone : rsnd-inst NOTE

; @rsnd-tone : STRUMTYPE NOTE
; @rsnd-note : STRING
;@rsnd-rem : [rsnd-tone] | INTEGER | VOID ; unsure what this bit even is
;@rsnd-tone : inst [rsnd-note] ;@rsnd-tone : (/"[" [inst] [rsnd-note] /"]")