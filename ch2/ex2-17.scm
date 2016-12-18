;ex2.17
(define last-pair
  (lambda (list)
          (if (null? (cdr list))
              (car list)
              (last-pair (cdr list)))))
