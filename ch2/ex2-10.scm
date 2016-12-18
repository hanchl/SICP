;ex2.10
(define (div-interval x y)
  (if (>=  0 (* (lower-bound y) (upper-bound y)))
      (error "division span 0")
      (mul-interval x  
                     (make-interval (/ 1. (upper-bound y)) 
                                    (/ 1. (lower-bound y))))))
