;; MIT License

;; Copyright (c) 2017 Lulin Wang

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

#lang racket/base

(require racket/contract
         racket/match
         json)

(provide init-config-path               ;; parameter
         parse-config-file
         )

(define init-config-path (make-parameter #f))

;; Search the configuration file.
(define (get-config-file [path (init-config-path)])
  (cond [path (if (path-exists? path)
                  (expand-user-path path)
                  #f)]
        [else
         (for/fold ([path #f])
                   ([item default-init-config-paths]
                    #:unless path)
           (if (path-exists? item)
               (expand-user-path item)
               #f))]))

;; expand a path before checking it
(define (path-exists? path)
  (if (not path)
      #f
      (file-exists? (expand-user-path path))))

;; Parse config file, return a jsexpr
(define (parse-config-file [conf (get-config-file)])
  (if (not conf)
      #f
      (read-json (open-input-file (expand-user-path conf)))))

;; default initial configuration path
(define default-init-config-paths
  (list "./tt.conf"
        "~/.tt/tt.conf"
        "/etc/tt/tt.conf"))

