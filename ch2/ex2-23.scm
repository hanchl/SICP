;ex2.23
(define for-each
  (lambda (proc items)
    (if (null? items)
        null
        ((lambda (x y) x) (proc (car items)) (for-each proc (cdr items))))))

;test
(for-each (lambda (x) (newline) (display x)) (list 1 2 3 ))
