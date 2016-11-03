;ex1.16
(define (fast-expt-iter-ver  b n) (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (* b b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* a b)))))

;test
(fast-expt-iter-ver 2 10)
