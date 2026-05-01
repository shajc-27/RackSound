#lang brag
rsnd-program : [rsnd-line] (/NEWLINE [rsnd-line])*
<<<<<<< HEAD
@rsnd-line : [rsnd-statement] [rsnd-comment]
@rsnd-statement : play | stop | speed | playTogether | repeat | repend | inst


play   : /"PLAY" [rsnd-tone]
stop   : /"STOP" INTEGER 
speed  : /"SPEED" INTEGER  ;SPEED vs BPM?
playTogether : /"PLAY*" [rsnd-tone] ([rsnd-tone])*
repeat : /"REPEAT" INTEGER
repend : /"END" 
inst   : /"INSTRUMENT" [rsnd-inst]
bpm    : /"SET BPM" INTEGER


;@rsnd-inst : STRUMTYPE
; alt inst definition -
@rsnd-inst     : [rsnd-inst-ref] [rsnd-strum]
@rsnd-inst-ref : STRING
@rsnd-strum    : STRUMTYPE
@rsnd-tone : rsnd-inst NOTE ; ;change tone to only be the ref?

rsnd-comment  : COMMENT  ; ignore in expander

;@rsnd-tone : STRUMTYPE NOTE
; @rsnd-note : STRING
=======
rsnd-line : (rsnd-statement (rsnd-rem))
@rsnd-statement : rsnd-play | rsnd-stop | rsnd-speed | rsnd-playTogether | rsnd-repeat | rsnd-repend | rsnd-instrument-dec

rsnd-play   : /"PLAY" [rsnd-tone]
rsnd-stop   : /"STOP" INTEGER 
rsnd-speed  : /"SPEED" INTEGER  ;SPEED vs BPM?
rsnd-playTogether : /"PLAY*" [rsnd-tone] (/","[rsnd-tone])*
rsnd-repeat : /"REPEAT" INTEGER
rsnd-repend : /"END" 
rsnd-instrument-dec   : /"INSTRUMENT" [rsnd-inst]
rsnd-bpm    : /"SET BPM" INTEGER

rsnd-comment : COMMENT


@rsnd-inst : [rsnd-inst-ref] [rsnd-strum]
@rsnd-inst-ref : STRING

@rsnd-rem : [rsnd-tone] | INTEGER | VOID
@rsnd-tone (/"[" (rsnd-inst rsnd-note)+ / "]")
@rsnd-strum : STRING ;etc
@rsnd-note : STRING
@rsnd-tone : STRUMTYPE NOTE

>>>>>>> f4df69d7625b2fb1de0a72bb5b43cf285b58c23e
;@rsnd-rem : [rsnd-tone] | INTEGER | VOID ; unsure what this bit even is
;@rsnd-tone : inst [rsnd-note] ;@rsnd-tone : (/"[" [inst] [rsnd-note] /"]")


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