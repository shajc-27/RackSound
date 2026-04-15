#lang br 
(require brag/support)

;(define-lex-abbrev keyfamily (:+ (char-set "ABCDEFG")))
;(define-lex-abbrev octave (:+ (char-set "12345678")))
;we're doing octaves 0-8 here.
(define-lex-abbrev note
  (:: (:or (char-set "ABCDEFG")) (:or (char-set "12345678"))))
(define-lex-abbrev strum (:or "TRUMPET" "PIANO" "DRUM" "FLUTE" "PURE"))

(define lexer
  (lexer-srcloc
    ["\n" (token 'NEWLINE lexeme)]
    [whitespace (token lexeme #:skip? #t)]
    [(from/stop-before ";" "\n") (token 'REM lexeme)]
    
    [(:or "INSTRUMENT" "PLAY" "STOP" "SPEED" "REPEAT" "END" "PLAY*") (token lexeme lexeme)]
    [strum     (token 'STRUMTYPE lexeme)]
    [note      (token 'NOTE lexeme)]
    [(:+ (char-set "0123456789")) (token 'INTEGER (string->number lexeme))]
    
    [(:or (from/to "\"" "\"") (from/to "'" "'"))
     (token 'STRING
            (substring lexeme
                        1 (sub1 (string-length lexeme))
    ))]
))

(provide lexer)