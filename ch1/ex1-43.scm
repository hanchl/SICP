;ex1.43
;use compose from ex1.42
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1) f
      (compose f (repeated f (- n 1)))))

(define (repeated-iter-ver f n)
  (define (iter f i result)
    (if (= i n)
        result
        (iter f (+ i 1) (compose f result))))
  (iter f 1 f))

;test
(define (square x) (* x x))

((repeated square 2) 5)
;625
((repeated-iter-ver square 2) 5)
;625
