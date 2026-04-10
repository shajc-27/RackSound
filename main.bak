#lang br/quicklang

(module reader br
  (require "reader.rkt" "parser.rkt" "tokenizer.rkt")
  (provide read-syntax))


;(require "parser.rkt" "tokenizer.rkt")

; unsure how much we need to change from Basic...
(define (read-syntax path port)
  (define parse-tree (parse path (make-tokenizer port path)))
  (strip-bindings
   #`(module racksound-mod RackSound/expander
       #,parse-tree)))

;(module+ reader
;  (provide read-syntax))