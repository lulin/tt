#lang racket/base

(require racket/contract
         racket/match
         json)

(provide (contract-out
          [get-config (-> (hash/c symbol? any/c))])
         default-init-config-paths
         init-config-path)

(define default-init-config-paths
  (make-parameter (list "./tt.conf"
                        "~/.tt/tt.conf"
                        "/etc/tt/tt.conf")))

(define init-config-path
  (make-parameter (match (default-init-config-paths)
                    [(? string? str) str]
                    [(list head _ ...) head]
                    [_ 'null])))

(define (get-config)
  #hasheq((a . 1)))

