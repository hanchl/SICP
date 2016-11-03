;ex1.11
;rec
(define (f-rec-ver n)
  (if (< n 3)
      n
      (+ (f-rec-ver (- n 1))
         (* 2 (f-rec-ver (- n 2)))
         (* 3 (f-rec-ver (- n 3))))))

; iter
(define (f-iter-ver n)
  (f-iter  2 1 0 n))

(define (f-iter a b c n)
  (cond ((= n 2) a)
        ((= n 1) b)
        ((= n 0) c)
        (else
       (f-iter (+ a (* 2 b) (* 3 c)) a b (- n 1)))))

;test 
(f-rec-ver 12)
(f-iter-ver 12)