;ex1.41
(define (double f)
  (lambda (x) (f (f x))))

;test
((double inc) 1)
;3

(((double (double double)) inc) 5)
;21
