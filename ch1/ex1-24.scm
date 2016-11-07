;ex1.24
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime n times)
  (cond((= times 0) true)
       ((fermat-test n) (fast-prime n (- times 1)))
       (else false)))

(define (prime? n) (fast-prime n 100))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (find-smallest-prime-greater-than-n n number)
  (cond ((= number 0) (display "finish"))
        ((prime? (+ n 1)) (timed-prime-test (+ n 1)) (find-smallest-prime-greater-than-n (+ n 1) (- number 1)))
        (else (find-smallest-prime-greater-than-n (+ n 1) number))))

(define (search-for-primes n)
  (find-smallest-prime-greater-than-n n 3))

;test
(search-for-primes 1000)

(search-for-primes 10000)

(search-for-primes 100000)

(search-for-primes 1000000)