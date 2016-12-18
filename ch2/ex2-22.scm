;ex2.22
(define square
  (lambda (x) (* x x)))

(define (square-list-iter items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer (list (square (car things)))))))
  (iter items null))

(square-list-iter (list 1 2 3 4))