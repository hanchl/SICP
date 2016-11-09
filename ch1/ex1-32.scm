;ex1.32
;a
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

;test
(define (identify x) x)

(sum identify 0 inc 10)
;55
(product identify 1 inc 5)
;120

;b
(define (accumulate-iter-ver combiner null-value term a next b)
  (define (iter combiner term a result)
  (if (> a b)
      result
      (iter combiner term (next a) (combiner (term a) result))))
  (iter combiner term a null-value))
