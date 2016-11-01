;ex1.8
(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter guess x)
  (if (good-enough? guess (improve guess x))
      (improve guess x)
      (cube-root-iter (improve guess x) x)))

(define (good-enough? old new)
  (> 0.01
     (/ (abs (- new old))
        old)))
(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* guess 2))
     3))

;test
(cube-root 8)
