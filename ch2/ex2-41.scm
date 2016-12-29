;ex2.41

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


(define (ordered-triple-sum n s)
  (filter (lambda (list) (= (accumulate + 0 list) s))
          (flatmap (lambda (i) 
            (flatmap (lambda (j) 
              (map (lambda (k) (list i j k))
                (enumerate-interval 1 (- j 1))))
            (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n))))

;test
(ordered-triple-sum 5 10)
;((5 3 2) (5 4 1))
