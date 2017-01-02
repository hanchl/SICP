;ex2.31
(define (tree-map proc tree)
  (map (lambda (sub-tree) 
          (if (pair? sub-tree) 
              (tree-map proc sub-tree)
              (proc sub-tree)))
        tree))

(define square
  (lambda (x) (* x x)))

(define (square-tree tree) (tree-map square tree))

;test
(define tree (list 1 (list 2 (list 3 4) 5)))

(square-tree tree)
;(1 (4 (9 16) 25))