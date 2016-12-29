;ex2.40

(define (filter predicate sequence) 
 (cond ((null? sequence) nil) 
       ((predicate (car sequence)) 
        (cons (car sequence)  
              (filter predicate (cdr sequence)))) 
       (else (filter predicate (cdr sequence))))) 

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (prime? n) (= n (smallest-divisor n)))
(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs  n)
  (map make-pair-sum
    (filter prime-sum?
        (unique-pairs n))))

;test
(prime-sum-pairs 4)
;((2 1 3) (3 2 5) (4 1 5) (4 3 7))

