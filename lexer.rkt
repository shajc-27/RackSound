#lang br 
(require brag/support) 

(define-lex-abbrev keyfamily (:+ (char-set "ABCDEFG")))
(define-lex-abbrev octaves (:+ (char-set "12345678"))) 
;we're doing octaves 0-8 here. 

(define lexer
  (lexer-srcloc
    ["\n" (token 'NEWLINE lexeme)]
    [whitespace (token lexeme #:skip? #t)]
    [(from/stop-before "INSTRUMENT" "\n") (token 'strum lexeme)]))


