;ex2.54
(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))


(define (equal? x y)
  (if (= (length x) (length y))
      (accumulate (lambda (a b) (and a b)) #t (map eq? x y))
      #f))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;test
(equal? '(this is a list) '(this (is a ) list))
;#f

