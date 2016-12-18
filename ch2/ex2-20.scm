;ex2.20
(define same-parity?
  (lambda (x y) (= (remainder (- y x) 2) 0)))
(define same-parity-list
  (lambda (x  y) (cond ((null? y) (cons x null))
                        ((same-parity? x (car y)) (cons x (same-parity-list  (car y) (cdr y))))
                        (else
                         (same-parity-list  x  (cdr y))))))

(define same-parity
  (lambda (x . y) (same-parity-list x y)))

;test
(same-parity 1 2 3 4 5 6)