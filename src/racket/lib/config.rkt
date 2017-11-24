#lang racket/base

(require racket/contract)

(provide (contract-out
          [get-config (-> (hash/c symbol? any/c))]))

(define default-init-config-paths
  (make-parameter (list "./tt.conf"
                        "~/.tt/tt.conf"
                        "/etc/tt/tt.conf")))

(define init-config-path)

(define (get-config)
  #hasheq((a . 1)))
