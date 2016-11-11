;ex1.46
(define (iterative-improve improve good-enough?)
  (define (try x)
    (let ((next (improve x)))
    (if (good-enough? x next)
                  next
                  (try next))))
  (lambda (x) (try x)))

(define tolerance 0.00001)

(define (sqrt x)
  (define (close-enough? v1 v2) ( < (abs (- v1 v2)) tolerance))
  (define (improve guess) (average guess (/ x guess)))
  ((iterative-improve improve close-enough?) 1))

(define (average x y) (/ (+ x y) 2.0))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2) ( < (abs (- v1 v2)) tolerance))
  ((iterative-improve f close-enough?) first-guess))

;test
(sqrt 4)
;2.000000000000002
(fixed-point cos 1.0)
;0.7390822985224024
