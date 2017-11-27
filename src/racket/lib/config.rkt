#lang racket/base

(require racket/contract
         racket/match
         json)

(provide parse-config-file
         ;; parameter specifies the initial config path
         init-config-path
         search-config-file)

(define init-config-path (make-parameter #f))

;; Search the configuration file.
(define (search-config-file [path (init-config-path)])
  (cond [path (if (path-exists? path)
                  path
                  #f)]
        [else
         (for/fold ([path #f])
                   ([item default-init-config-paths]
                    #:unless path)
           (if (path-exists? item)
               item
               #f))]))

;; expand a path before checking it
(define (path-exists? path)
  (if (not path)
      #f
      (file-exists? (expand-user-path path))))

;; Parse config file
(define (parse-config-file [conf (search-config-file)])
  (if (not conf)
      #f
      (read-json (open-input-file (expand-user-path conf)))))

;; default initial configuration path
(define default-init-config-paths
  (list "./tt.conf"
        "~/.tt/tt.conf"
        "/etc/tt/tt.conf"))


