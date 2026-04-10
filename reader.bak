#lang br/quicklang
(require "tokenizer.rkt" "parser.rkt")

(define (read-syntax path port)
  (define src-lines (port->lines port))
  (define src-datums (format-datums '(handle ~a) src-lines))
  (define module-datum '(module racket-sound br
                          ,@src-datums))
  (datum->syntax #f module-datum)

(provide read-syntax)
