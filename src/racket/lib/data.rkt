#lang racket

(require json)

(call-with-output-string
 (lambda (out)
   (write "abc" out)
   (get-output-string out)))


