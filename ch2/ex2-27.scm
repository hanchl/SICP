;ex2.27
(define deep-reverse
  (lambda (tree) (if (pair? tree)
                     (append (deep-reverse (cdr tree))
                             (list (deep-reverse (car tree))))
                     tree)))

(define x (list (list 1 2) (list 3 4)))

(deep-reverse x)
;((4 3) (2 1))
