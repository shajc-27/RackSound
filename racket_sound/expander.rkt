#lang br/quicklang
(provide (matching-identifiers-out #rx"^" (all-defined-out))) ; provides all macros/functions starting with "rsnd-"

(require "playback.rkt")

(define-macro (rsnd-program INSTRUCTS ...)
  (with-pattern
      ([((inst NAME TYPE) ...) (find-definitions 'inst #'(INSTRUCTS ...))]
       [((play INST NOTE) ...) (find-definitions 'play #'(INSTRUCTS ...))]
       )
    #'(#%module-begin
       (define instruments
         (apply hasheq (append (list NAME TYPE) ...)))
       (define notes
         (list (cons INST NOTE) ...))
       ;(displayln instruments)
       ;(displayln notes)
       (playback instruments notes)
       )))
   

(provide (rename-out [rsnd-program #%module-begin]))

(begin-for-syntax
  (require racket/list)

  (define (unique-ids stxs)
    (remove-duplicates stxs #:key syntax->datum))
  
  (define (find-property which line-stxs) ; adapted from BR's basic find-property, used Claude AI
    (for/first ([stx (in-list (syntax->list line-stxs))]
                #:when (eq? which (syntax->datum (car (syntax->list stx)))))
      (cadr (syntax->list stx))))

  (define (find-definitions which line-stxs)
    (for/list ([stx (in-list (syntax->list line-stxs))]
               #:when (and (syntax->list stx)
                           (eq? which (syntax->datum (car (syntax->list stx))))))
      stx)))