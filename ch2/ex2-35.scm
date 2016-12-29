;ex2.35

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate +
              0
              (map  (lambda (subset)
                     (if (pair? subset) 
                         (count-leaves subset)
                          1))
                    t)))

;test
(count-leaves (list 1 (list 2 3)))
;3
