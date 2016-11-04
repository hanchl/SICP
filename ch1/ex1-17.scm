;ex1.17
(define (* a b)
    (cond ((= b 0) 0)
          ((even? b) (* (double a) (halve b)))
          (else (+ a (* a (- b 1))))))

;test 
(define (double x) (+ x x))
(define (halve x)
    (if (even? x)
        (/ x 2)
        (/ (- x  1) 2)))

(* 2 10)
