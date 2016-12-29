;ex2.28
(define (fringe tree)
  (cond ((null? tree) nil)
        ((not (pair?  tree)) (list tree))
        (else
         (append (fringe (car tree)) (fringe (cdr tree))))))

;test
(define x (list  (list 1 2) (list 3 4)))

(fringe x)
;(1 2 3 4)
(fringe (list x x))
;(1 2 3 4 1 2 3 4)
