;ex1.29
(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (next k) (+ k 1))
  (define (factor k)
    (cond ((= k 0) 1)
          ((= k n) 1)
          ((even? k) 2)
          (else 4)))
  (define (y k) (f (+ a (* k h))))
  (define (term k) (* (factor k) (y k)))
  (* (/ h 3.0) (sum term 0 next n)))

(define (sum term a next b )
  (if ( > a b)
      0
      (+
       (term a)
       (sum term (next a) next b))))

;test
(define (cube x) (* x x x))

(simpson cube 0 1 100)
;0.25
(simpson cube 0 1 1000)
;0.25