;ex1.37
;a 
(define (cont-frac n d k)
  (define (cf i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (cf (+ i 1))))))
  (cf 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)
;0.6180555555555556

;ex 1.37 b
(define (cont-frac-iter-ver n d k)
  (define (iter n d i result)
    (if (= i 0)
        result
        (iter n d (- i 1) (/ (n i) (+ (d i) result)))))
  (iter n d k 0))