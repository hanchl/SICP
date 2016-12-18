;ex2.12
(define (make-center-percent c p)
  (make-interval-width c (abs (* c p))))

(define (percent i)
  (/ (width i) (abs(center i))))
