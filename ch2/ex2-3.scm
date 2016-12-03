;ex2.3

;point
(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

;impl1
(define (make-rect p height width)
  (cons p (cons width height)))

(define (rect-width rect)
  (cadr rect))

(define (rect-height rect)
  (cddr rect))

;impl2
(define (make-rect lb-point rt-point)
  (cons lb-point rt-point))

(define (rect-width rect)
  (- (x-point (cdr rect))
     (x-point (car rect))))

(define (rect-height rect)
  (- (y-point (cdr rect))
     (y-point (car rect))))

; rect perimeter and rect area
(define (rect-perimeter rect)
  (* 2 (+ (rect-width rect)
          (rect-height rect))))

(define (rect-area rect)
  (* (rect-width rect)
     (rect-height rect)))
