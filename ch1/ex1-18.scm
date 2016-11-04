;ex1.18
(define (*-iter-ver a b) (*-iter a b 0))
(define (*-iter a b n)
    (cond ((= b 0) n)
          ((even? b) (*-iter (double a) (halve b) n))
          (else (*-iter a (- b 1) (+ a n)))))

;test
(*-iter-ver 2 10)
