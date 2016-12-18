;ex2.21
(define square
  (lambda (x) (* x x)))

(define (square-list items)
  (if (null? items)
      null
      (cons (square (car items)) (square-list (cdr items)))))

(define (square-list-map items)
  (map square items))

;test
(square-list (list 1 2 3 4))
(square-list-map (list 1 2 3 4))

