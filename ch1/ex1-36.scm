;ex1.36
(define tolerance 0.0001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2) ( < (abs (- v1 v2)) tolerance))
  (define (try guess)
  (let ((next (f guess)))
    (display guess)
    (newline)
    (if (close-enough? next guess)
        next
        (try next))))
  (try first-guess))

(define (f x) (/ (log 1000) (log x)))

(fixed-point f 2.0)
;4.555563237292884
;loop 30 

(define (averg-damp x) (/ (+ (f x) x) 2))

(fixed-point averg-damo 2.0)
;4.5555465521473675
;loop 9