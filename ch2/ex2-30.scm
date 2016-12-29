;ex2.30
(define square
  (lambda (x) (* x x)))

(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
              (square-tree (cdr tree))))))

(define (square-tree-map tree)
  (map (lambda (sub-tree) 
          (if (pair? sub-tree) 
              (square-tree-map sub-tree)
              (square sub-tree)))
        tree))

;test
(define tree (list 1 (list 2 (list 3 4) 5)))

(square-tree tree)
;(1 (4 (9 16) 25))
(square-tree-map tree)
;(1 (4 (9 16) 25))