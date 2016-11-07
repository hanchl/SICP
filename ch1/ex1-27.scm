;ex1.27
(define (carmichael-number n) (car-num-iter n (- n 1)))

(define (car-num-iter n a)
  (cond ((= a 0)
         (newline)
         (display n)
         (display " is carmichael number"))
        ((fermat-pass? n a) (car-num-iter n (- a 1)))
        (else
         (newline)
         (display n)
         (display " is not carmichael number"))))

(define (fermat-pass? n a)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it  a))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m)) m))))
(define (square x) (* x x))

;test
(carmichael-number 561)

(carmichael-number 1105)

(carmichael-number 1729)
