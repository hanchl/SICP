;ex1.22

;use ex1.21
(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))


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

(define (prime? n) (= n (smallest-divisor n)))

(define (find-smallest-prime-greater-than-n n count)
  (cond ((= count 0) (display "finish"))
        ((prime? (+ n 1)) (timed-prime-test (+ n 1)) (find-smallest-prime-greater-than-n (+ n 1) (- count 1)))
        (else (find-smallest-prime-greater-than-n (+ n 1) count))))

(define (search-for-primes n)
  (find-smallest-prime-greater-than-n n 3))


;test
(search-for-primes 1000)

(search-for-primes 10000)

(search-for-primes 100000)

(search-for-primes 1000000)
