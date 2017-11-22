#lang racket
(require gregor
         gregor/time
         gregor/period)

(require tzinfo)

;; get the current time zone
(current-timezone)
;; set the current time zone
;; (current-timezone "Asia/Shanghai")
(system-tzid)
(current-time)
(period (days 2) [years 1])
(years 1)
(period (days 1) (days -2))
(current-time)
(today)
(now/moment)
(moment->iso8601 (now/moment))
(moment->iso8601 (now/moment/utc))

;; How long do I need to set the cooker for tomorrow's breakfast
(define (time-for-setting-breakfast)
  (define period
    (period-between (now)
                    (at-time (+days (today) 1)
                             (time 07 10))))
  (define (round-to-10minutes m)
    m
    (* 10 (round (/ m 10))))
  (values (period-ref period 'hours)
          (round-to-10minutes (period-ref period 'minutes))))

(time-for-setting-breakfast)

(define pa (make-parameter 100))
(pa)
(parameterize ([pa 99]) (pa))
(pa)


