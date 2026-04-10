#lang br/quicklang
(provide (matching-identifiers-out #rx"^b-" (all-defined-out))) ; provides all macros/functions starting with "b-"

(define-macro (b-line NUM STATEMENT ...) ;provides macro for each line for parse tree below
  (with-pattern ([LINE-NUM (prefix-id "line-" #'NUM
                                      #:source #'NUM)]) ; assigns LINE-NUM's srcloc to be NUM's srcloc
    (syntax/loc caller-stx                              ; assigns this new syntax's srcloc to be b-line's srcloc
      (define (LINE-NUM) (void) STATEMENT ...)))) ; expands every line into a FUNCTION

(define-macro (b-module-begin (b-program LINE ...))
  (with-pattern
      ([((b-line NUM STMT ...) ...) #'(LINE ...)]
       [(LINE-FUNC ...) (prefix-id "line-" #'(NUM ...))])
    #'(#%module-begin
       LINE ...   ; we can put in a SHIMS ' to see what the expander is producing ; this is for REPEATS
       (define line-table
         (apply hasheqv (append (list NUM LINE-FUNC) ...))) ; we can also add code inside this macro
       (void (run line-table))))) ;run is what runs the line funcs
(provide (rename-out [b-module-begin #%module-begin]))

(struct end-program-signal ())
(struct change-line-signal (val))

(define (b-end) (raise (end-program-signal)))
(define (b-goto expr) (raise (change-line-signal expr)))

(define (run line-table)
  (define line-vec
    (list->vector (sort (hash-keys line-table) <)))
  (with-handlers ([end-program-signal? (λ (exn-val) (void))])
    (for/fold ([line-idx 0])
              ([i (in-naturals)]
               #:break (>= line-idx (vector-length line-vec)))
      (define line-num (vector-ref line-vec line-idx))
      (define line-func (hash-ref line-table line-num))
      (with-handlers
          ([change-line-signal?
            (λ (cls)
              (define clsv (change-line-signal-val cls))
              (or
               (and (exact-positive-integer? clsv)
                    (vector-member clsv line-vec))
               (error
                (format "error in line ~a: line ~a not found"
                        line-num clsv))))])
        (line-func)
        (add1 line-idx)))))

; all of these are funcs, not macros
(define (b-rem val) (void)) ; do nothing 
(define (b-print . vals)    ; print all vals(?)
  (displayln (string-append* (map ~a vals))))
(define (b-sum . vals) (apply + vals))
(define (b-expr expr)
  (if (integer? expr) (inexact->exact expr) expr))
