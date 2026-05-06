#lang racket
(require rsound)
(require rsound/piano-tones)

(struct playback-details (speed volume resample-rate instrument-list))

(define frame-rate 48000)

(define bpm 90)

(define frame-counter 0)

;(define (make-inst-list list)
; (list (for ([(k v) (in-hash list)])
;         (cons k v))))
  


(define (make-instrument arg) (displayln "make-instrument: not implemented error")) 

#|
(define (string->midi input)
  
  (define (string->midi-helper input acc)
    (displayln input)  
    (let* ([note (substring (car input) 0 1)]
         [octave (string->number (substring (car input) 1 2))]
         [addto 0])
    ;(displayln octave)
      (cond
        ([or (< octave 0) (> octave 7)] (display "Error in expander: octave too large or too small. Range is 0-7"))
        ([equal? note "C"]                          [set! addto 24]) ; (+ (* octave 12) 24))
        ([or [equal? note "Db"] [equal? note "C#"]] [set! addto 25])
        ([equal? note "D"]                          [set! addto 26])
        ([or [equal? note "Eb"] [equal? note "D#"]] [set! addto 27])
        ([equal? note "E"]                          [set! addto 28])
        ([equal? note "F"]                          [set! addto 29])
        ([or [equal? note "F#"] [equal? note "Gb"]] [set! addto 30])
        ([equal? note "G"]                          [set! addto 31])
        ([or [equal? note "G#"] [equal? note "Ab"]] [set! addto 32])
        ([equal? note "A"]                          [set! addto 33])
        ([or [equal? note "A#"] [equal? note "Bb"]] [set! addto 34])
        ([equal? note "B"]                          [set! addto 35])
        (else "UNABLE TO PARSE STRING INTO MIDI")
      ) ;(+ (* octave 12) addto)

      (if (empty? (cddr input)) ; if one after next is null
        (+ (* octave 12) addto)
        (string->midi-helper (cdr input) (+ (* octave 12) addto)) ;(display "else statement")
  )))

  (string->midi-helper input '())
)|#

(define (string->midi input)
  (displayln input)
  (let ([note (substring input 0 1)]
        [octave (string->number (substring input 1 2))]
        [addto 0])
    ;(displayln octave)
    (cond
      ([or (< octave 0) (> octave 7)] (display "Error in expander: octave too large or too small. Range is 0-7"))
      ([equal? note "C"]                          [set! addto 24]) ; (+ (* octave 12) 24))
      ([or [equal? note "Db"] [equal? note "C#"]] [set! addto 25])
      ([equal? note "D"]                          [set! addto 26])
      ([or [equal? note "Eb"] [equal? note "D#"]] [set! addto 27])
      ([equal? note "E"]                          [set! addto 28])
      ([equal? note "F"]                          [set! addto 29])
      ([or [equal? note "F#"] [equal? note "Gb"]] [set! addto 30])
      ([equal? note "G"]                          [set! addto 31])
      ([or [equal? note "G#"] [equal? note "Ab"]] [set! addto 32])
      ([equal? note "A"]                          [set! addto 33])
      ([or [equal? note "A#"] [equal? note "Bb"]] [set! addto 34])
      ([equal? note "B"]                          [set! addto 35])
      (else "UNABLE TO PARSE STRING INTO MIDI")
      ) (+ (* octave 12) addto)
));)

;all
#|
(define (resample-table notein) (displayln "resample-table: not implemented error")) 
(define (pitch-sound rsnd-in midi) (displayln "pitch-sound: not implemented error"))
(define (load-in-file-to-rsound path) (displayln "load-in-file-to-rsound: not implemented error"))
;(define (overlay-sound ref1 t1 ref2 t2) (rs-overlay (pitch-sound ref1 t1) (pitch-sound ref2 t2)))
(define (overlay-sound . e) (displayln "overlay-sound not implemented error"))  
(define (set-speed new-bpm) (displayln "set-speed: not implemented error"))
|#


; works, but is layering ALL sounds. need to split
(define (make-sounds instrument notes)
  ;(displayln note)

 ; (define (hash-select note)
 ;   (if (equal? (hash-ref instrument (car note)) "PIANO")
 ;       (resample-to-rate 48000 (piano-tone (string->midi (cdr note))))
 ;       (resample-to-rate 48000 (synth-note "vgame" 49 (cdr note) 22010)))
 ; )

#|
 (define (chord-maker note)
   (displayln note)
    (if (> (length note) 2)
        (if (equal? (hash-ref instrument (car note)) "PIANO")
            (map (lambda (lst) (resample-to-rate 48000 (piano-tone (string->midi lst)))) (cdr note))
            (map (lambda (lst) (resample-to-rate 48000 (synth-note "vgame" 49 lst 22010))) (cdr note))
        ) (if (equal? (hash-ref instrument (car note)) "PIANO")
            (resample-to-rate 48000 (piano-tone (string->midi (cdr note))))
            (resample-to-rate 48000 (synth-note "vgame" 49 (cdr note) 22010))
  )))|#
  
;version I like vvv
(define (chord-maker note)
  (let ([notes-only (filter string? note)])
  (define (make-note) (displayln "err"))
  (if (equal? (hash-ref instrument (car note)) "PIANO")
      (set! make-note (lambda (x) (piano-tone (string->midi x))))
      (set! make-note (lambda (x) (synth-note "vgame" 49 x 22010)))
  ) 
  (if (> (length note) 2)
     ; (apply resample-to-rate 48000 (make-note note))
       (rs-overlay* (map (lambda (x) (resample-to-rate 4800 (make-note x))) (cdr notes-only)))
       (resample-to-rate 48000 (make-note notes-only))
)))


  
    ;(if (not (empty? (cddr note))))
   
        ; (if (equal? (hash-ref instrument (car note)) "PIANO")
  ;          (resample-to-rate 48000 (piano-tone (string->midi (cdr note))))
  ;          (resample-to-rate 48000 (synth-note "vgame" 49 (cdr note) 22010))
  ;)
  
  (define (make-sounds-helper notes acc)
    (displayln acc)   
    (if (empty? notes)
        acc
        (make-sounds-helper (cdr notes)
                            (cons ;(displayln (car note))
                             (chord-maker (car notes))
                            ; (if (equal? (hash-ref instrument (car (car note))) "PIANO")
                                ; (resample-to-rate 48000 (piano-tone (string->midi (cdar note))))
                                 ;(resample-to-rate 48000 (synth-note "vgame" 49 (cdar note) 22010)))
                             acc)
  )))

   (reverse (make-sounds-helper notes '()));)
)
  
  ;(rs-overlay*


;(define (perform soundlist)
 ; (displayln (list-ref soundlist 0))
  ;(if (null? soundlist)
   ;   (void)
    ;  (begin
     ;   (play (list-ref soundlist 0))
      ;  (sleep 1)
       ; (perform (cdr soundlist)))))
;        (cond
;          [(rsound? (list-ref soundlist 0)) (begin (play (list-ref soundlist 0)) (sleep 1) (perform (cdr soundlist)))]
;          [else (displayln "Done" )]))
;                  
(define (append-all soundlist)
  (rs-append* (flatten soundlist)))

(define (playback instruments notes)
  (play (append-all (make-sounds instruments notes)))
  
  )
  

(provide playback) 

