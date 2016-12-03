;ex2.2
;point
(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

;segment
(define (make-segment start end)
  (cons start end))
(define (start-segment seg)
  (car seg))
(define (end-segment seg)
  (cdr seg))

(define (midpoint-segment seg)
  (define (average x y)
    (/ (+ x y) 2))
  (let ((start (start-segment seg))
        (end (end-segment seg)))
        (make-point (average (x-point start) (x-point end))
                    (average (y-point start) (y-point end)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;test
(define p1 (make-point 0 0))
(define p2 (make-point 0 1.0))

(define seg (make-segment p1 p2))
(define mid (midpoint-segment seg))

(print-point mid)
;(0,0.5)
