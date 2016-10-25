;1.7
;对于极小数（例如比0.001），good-enough? 会因精度不够而失效，导致结果出错；对于极大数，good-enough? 会由于计算机精度不足以精确的表示大数之差，使得sqrt陷入死循环。

(define (good-enough? old new)
  (> 0.01
     (/ (abs (- new old))
        old)))

(define (average x y) (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      (improve guess x)
      (sqrt-iter (improve guess x) x)))

(define (sqrt x) (sqrt-iter 1.0 x))
