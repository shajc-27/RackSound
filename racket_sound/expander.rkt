#lang br/quicklang
(provide (matching-identifiers-out #rx"^" (all-defined-out))) ; provides all macros/functions starting with "rsnd-"


;(define-macro (rsnd-line LINENO ... )
 ; (with-pattern

;(define-macro (rsnd-inst REF STRUM ...))
;(define-macro (rsnd-play TONE ...)
  
;one thing we need to do is VERIFY SYSTEM SAMPLE RATE!!
(define (rsnd-program val)
  (display "rsnd-program not implemented"))
(define (rsnd-rem val) (void)) ; void doesn't do anything! so when we see (rsnd-rem ...), we just do nothing!

;AKWF_vgame: 001 - drum
;
;(define (rsnd- 

(define (rsnd-play arg)
  (displayln "rsnd-play: not implemented"))
(define (rsnd-stop arg)
  (displayln "rsnd-stop: not implemented"))
(define (rsnd-inst arg)
  (displayln "rnsd-inst: not implemented"))

;the library provided sounds can be found in %appdata%/Racket/[version]/pkgs/rsound/rsound/contrib/
;(define-macro (play tone))
  ; build tone, then play?
;
;(play ref key 
;(define (rsnd-play input)
 ; (play (piano-tone (cdr input)))) 
  

  ;(cond [(string-prefix input "C")  