#lang br/quicklang
;require rsound

(define-macro (stacker-module-begin HANDLE-EXPR ...)
              #'(#%module-begin
                 'HANDLE-EXPR ...))

(provide (rename-out [stacker-module-begin #%module-begin]))

; your expander goes here!
