;ex1.45
;use repeated from ex1.43
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1) f
      (compose f (repeated f (- n 1)))))

;use fixed-point from ex1.35
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2) (< (abs (- v1 v2)) tolerance))
  (define (try guess)
  (let ((next (f guess)))
    (if (close-enough? next guess)
        next
        (try next))))
  (try first-guess))

(define (average-dump f)
  (lambda (x) (average x (f x))))

(define (average x y) (/ (+ x y) 2.0))

(define (sqrt4 x)
  (fixed-point ((repeated average-dump 3)
                (lambda (y) (/ x (cube y))))
                1))

(define (cube x) (* x x x))

(define (exp base n)
  (if (= n 0)
      1
      ((repeated (lambda (x) (* base x)) n) 1)))

(define (sqrt-n x n)
  (fixed-point ((repeated average-dump (- n 1)) 
                (lambda (y) (/ x (exp y (- n 1)))))
                1))

;test
(sqrt-n 8 3)
;2.000002163438156
(sqrt-n 16 4)
;2.000005048018041
