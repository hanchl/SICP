;ex1.39
(define (cont-frac n d k)
  (define (cf i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (cf (+ i 1))))))
  (cf 1))

(define (tan-frac x k)
  (cont-frac (lambda (i) (if (= i 1)
                           (expt x i)
                           (- (expt x i))))
             (lambda (i) (- (* i 2) 1))
             k))

;test
(tan-frac 0.785 10)
;0.9966118967598043