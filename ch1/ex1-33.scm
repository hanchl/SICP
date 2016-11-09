;ex1.33
(define (filtered-accumulate combiner null-value term a next b filter)
  (define (filter-result x)
    (if (filter x)
        x
        null-value))
  (if (> a b)
      null-value
      (combiner
       (filtered-accumulate combiner null-value term (next a) next b filter)
       (filter-result (term a)))))

;a
;get prime? from ex1.22
(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n) (= n (smallest-divisor n)))

(define (identify x) x)

(define (prime-sum a b)
  (filtered-accumulate + 0 identify a inc b prime?))

;test
(prime-sum 10)
;18

;b
;get gcd from ex1.20
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (coprime? i n)
    (and (< i n)
         (= 1 (gcd i n))))

(define (product-of-copromes n)
  (filtered-accumulate * 1 identify 1 inc n (lambda (x) (coprime? x n))))

;test
(product-of-copromes 10)
;189
