;ex1.31

;a
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (identify x) x)

(define (factorial n)
  (product identify 1 inc n))

(define (pi-term x)
  (cond ((= x 1) (/ 2.0 3.0))
        ((even? x) (/ (+ x 2) (+ x 1)))
        (else (/ (+ x 1) (+ x 2)))))

(define (pi n)
  (* 4 (product pi-term 1 inc n)))

;test
(factorial 5)
(pi 100)

;b
(define (product-iter-ver term a next b)
  (define (iter a result)
    (if (> a b)
        result
      (iter (next a) (* result (term a)))))
  (iter a 1))
