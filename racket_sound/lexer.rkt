#lang br 
(require brag/support) 
;(define-lex-abbrev keyfamily (:+ (char-set "ABCDEFG")))
;(define-lex-abbrev octave (:+ (char-set "12345678"))) 
;we're doing octaves 0-8 here. 
(define lexer
  (lexer-srcloc
    ["\n" (token 'NEWLINE lexeme)]
    [whitespace (token lexeme #:skip? #t)]
    [(:or "INSTRUMENT" "PLAY" "STOP" "SPEED" "REPEAT") (token 'ARG lexeme)]
  ;  [keyfamily (token 'KEYFAMILY lexeme)]
  ;  [octave (token 'OCTAVE lexeme)]
   ; [key (token 'KEY lexeme)] 
    [(:or (from/to "\"" "\"") (from/to "'" "'"))
     (token 'STRING
            (substring lexeme
                        1 (sub1 (string-length lexeme))))]))
(provide lexer)



