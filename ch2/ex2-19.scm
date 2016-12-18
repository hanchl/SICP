;ex2.19
(define no-more?
  (lambda (coin-values) (null? coin-values)))
(define first-denomination
  (lambda (coin-values) (car coin-values)))
(define except-first-denomination
  (lambda (coin-values) (cdr coin-values)))

(define (cc2 amount coin-values)
  (cond ((= amount 0) 1)
        ((< amount 0) 0)
        ((no-more? coin-values) 0)
        (else (+
               (cc amount (except-first-denomination coin-values))
               (cc (- amount (first-denomination coin-values)) coin-values)))))

(define us-coins (list 1 5 10 25 50))

;test
(cc 100 us-coins)