;ex2.18
(define reverse
  (lambda (list)
    (define iter
      (lambda (next prefix)
        (if (null?  next)
            prefix
            (iter (cdr next)(cons (car next) prefix)))))
    (iter list null)))

;test
(reverse (list 1 4 9 16 25))