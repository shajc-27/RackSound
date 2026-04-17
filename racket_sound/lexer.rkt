#lang br
(require brag/support)

(define lexer
  (lexer-srcloc
   ;; Whitespace (except newlines - newlines are significant)
   [whitespace (token lexeme #:skip? #t)]   ; or skip entirely
   ;; Significant newline
   ["\n"
    (token 'NEWLINE lexeme)]

   ;; Comments (assuming ; starts a comment until end of line)
   [(:: #\; (repetition 0 +inf.0 (char-complement #\newline)))
    (token 'COMMENT lexeme)]

   ;; Keywords (case-sensitive? Assuming uppercase as shown)
   ["PLAY"       (token 'PLAY)]
   ["STOP"       (token 'STOP)]
   ["SPEED"      (token 'SPEED)]
   ["PLAY*"      (token 'PLAY-TOGETHER)]   ; or 'PLAY*
   ["REPEAT"     (token 'REPEAT lexeme)]
   ["END"        (token 'END)]
   ["INSTRUMENT" (token 'INSTRUMENT)]
   ["SET BPM"    (token 'SET-BPM)]         ; note the space

   ;; Punctuation
   [#\[          (token 'LBRACKET)]
   [#\]          (token 'RBRACKET)]
   [#\,          (token 'COMMA)]

   ;; Integers
   [(:: (char-range #\0 #\9)
        (repetition 0 +inf.0 (char-range #\0 #\9)))
    (token 'INTEGER (string->number lexeme))]

   ;; Instrument / Note strings (sequences of non-whitespace, non-special chars)
   ;; This is very flexible as per your grammar (STRING)
   [(:or (from/to "\"" "\"") (from/to "'" "'"))
     (token 'STRING
            (substring lexeme
                        1 (sub1 (string-length lexeme))))]
   ))
(provide lexer)





;#lang br 
;(require brag/support)

;(define-lex-abbrev keyfamily (:+ (char-set "ABCDEFG")))
;(define-lex-abbrev octave (:+ (char-set "12345678")))
;we're doing octaves 0-8 here.
;(define-lex-abbrev note
;  (:: (:or (char-set "ABCDEFG")) (:or (char-set "12345678"))))
;(define-lex-abbrev strum (:or "TRUMPET" "PIANO" "DRUM" "FLUTE" "PURE"))
;(define-lex-abbrev statement (:or "INSTRUMENT" "PLAY" "STOP" "SPEED" "REPEAT" "END"))

;(define lexer
;  (lexer-srcloc
   
 ;   ["\n" (token 'NEWLINE lexeme)]
 ;   [whitespace (token lexeme #:skip? #t)]
 ;   [(from/stop-before ";" "\n") (token 'COMMENT lexeme)]
 ;   [strum (token lexeme)]
    ;[statement (token lexeme lexeme)]
 ;   [strum (token 'STRUMTYPE lexeme)]
 ;   [note (token 'NOTE lexeme)]
 ;   [(from/stop-before statement " ") (token 'STATMENT lexeme)]
 ;   [(:+ (char-set "0123456789")) (token 'INTEGER (string->number lexeme))]
 ;   [(:or "[" "]")  lexeme] 
    
;<<<<<<< HEAD
;    [(:or (from/to "\"" "\"") (from/to "'" "'"))
;     (token 'STRING
 ;           (substring lexeme
;                        1 (sub1 (string-length lexeme))
  ;  ))]
;))
;=======
   ; [(:or "INSTRUMENT" "PLAY" "STOP" "SPEED" "REPEAT" "END" "PLAY*") (token lexeme lexeme)]
   ; [strum     (token 'STRUMTYPE lexeme)]
   ; [note      (token 'NOTE lexeme)]
    ;[(:+ (char-set "0123456789")) (token 'INTEGER (string->number lexeme))]
    
   ;[(:or (from/to "\"" "\"") (from/to "'" "'"))
   ;  (token 'STRING
   ;         (substring lexeme
     ;                   1 (sub1 (string-length lexeme))
 ;   ))]
;))
;>>>>>>> 6d0f63bdba224acdef73a32485fcae6163776c8c

;(provide lexer)