;ex1.38
(define (cont-frac n d k)
  (define (cf i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (cf (+ i 1))))))
  (cf 1))

(define e
  (+ 2
     (cont-frac (lambda (i) 1.0)
                (lambda (i) (if ( = (remainder (+ i 1) 3) 0)
                                (* (/ (+ i 1.0) 3) 2)
                                1.0))
                10)))

e
;2.7182817182817183