;ex2.5
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car z)
  (if (= 0 (remainder z 2))
      (+ 1 (car (/ z 2)))
      0))

(define (cdr z)
  (if (= 0 (remainder z 3))
      (+ 1 (car (/ z 3)))
      0))

;test
(define z (cons 2 3))
(car z)
(cdr z)
