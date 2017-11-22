#lang racket

(define (foo-match exp)
  (match exp
    [(var id) (printf "var: ~a\n id: \n" id)]
    [`(,x ,y) (printf "list: ~a\ncar: ~a | cadr: ~a" exp x y)]
    [`(,x ...) (printf "exp: ~a\ncar: ~a\n" exp x)]
    [_ (println "match nothing")]))
