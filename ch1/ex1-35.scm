;ex1.35
;theta^2 = theta + 1
;x|->1 + 1/x
;=>x|->(x + 1) / x
;(theta + 1) / theta 
;=>theta^2 / theta
;=>theta 
;故theta是该变换的不动点

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2) (< (abs (- v1 v2)) tolerance))
  (define (try guess)
  (let ((next (f guess)))
    (if (close-enough? next guess)
        next
        (try next))))
  (try first-guess))

(define (f x) (+ 1 (/ 1 x)))

(fixed-point f 1.0)
;1.6180327868852458