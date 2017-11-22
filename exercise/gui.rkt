#lang racket

(require plot)
;; (plot-new-window? #t)

;; (plot (function sin (- pi) pi #:label "y = sin(x)"))

;; (plot3d (surface3d (lambda (x y) (+ (* x x) (* y y)))
;;                    (- 1) 1 (- 1) 1))

;; (plot (list (axes)
;;             (function sqr -5 5)
;;             (function (lambda (x) (+ (- x) 2))
;;                       -5 5)
;;             ))

;; (plot (function-interval (λ (x) 1)
;;                          (λ (x) 2))
;;       #:x-min -2 #:x-max 2)

(plot (inverse-interval (λ (x) 1)
                        (λ (x) -1)
                        )
      #:y-min -2 #:y-max 2)
;; (plot3d (surface3d (λ (x y) (* (cos x) (sin y)))
;;                    (- pi) pi (- pi) pi)
;;         #:title "An R × R → R function"
;;         #:x-label "x" #:y-label "y" #:z-label "cos(x) sin(y)")


