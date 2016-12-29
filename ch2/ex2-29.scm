;ex2.29
;a
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cadr branch))

;b
(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
   (if (not (pair? structure))
       structure
       (total-weight structure))))
      
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

;c
(define (branch-torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

(define (balance? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
    (and (= (branch-torque left)
            (branch-torque right))
         (branch-balance? left)
         (branch-balance? right))))

(define (branch-balance? branch)
  (let ((structure (branch-structure branch)))
    (if (not (pair? structure))
        #t
        (balance? structure))))

;d
; If define changes, we just need to change right-branch and branch-structure : cadr to cdr

;(define (make-mobile left right)
; (cons left right))

;(define (make-branch length structure)
;  (cons length structure))

;(define (left-branch mobile)
;  (car mobile))
;(define (right-branch mobile)
;  (cdr mobile))

;(define (branch-length branch)
;  (car branch))
;(define (branch-structure branch)
;  (cdr branch))