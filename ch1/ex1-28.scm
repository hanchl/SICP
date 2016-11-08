;ex1.28
(define (expmod base exp m)
  (cond ((= exp 0) 1)
  			((nontrivial-square-root? base m)  0)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m)) m))))

(define (nontrivial-square-root? a n)
	(and (not (= a 1))
			 (not (= a n))
			 (= 1 (remainder (square a ) n))))

(define (Miller-Rabin-test n)
	(define (iter times)
		(cond ((= times 0) #t)
					((= (expmod (no-zero-random n) (- n 1) n)
					    1)
						(iter (- times 1)))
					(else #f)))
	(iter (ceiling (/ n 2))))

(define (no-zero-random n)
  (let ((r (random n)))
  		(if (not (= r 0))
  				r
  				(no-zero-random n))))

(define (square x) (* x x))

;test
(Miller-Rabin-test 561)

(Miller-Rabin-test 1105)

(Miller-Rabin-test 1729)
