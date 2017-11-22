#lang racket
(require racket/date)

;; (current-inexact-milliseconds)
(seconds->date (current-seconds))
(date->string (current-date) #t)
