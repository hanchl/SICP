;ex1.12
(define (pasc row col)
  (cond ((> col row) (display "col value invaild"))
        ((= col 1) 1)
        ((=  row col) 1)
        (else
        (+ (pasc (- row 1) (- col 1))
            (pasc (- row 1) col)))))

;test
(pasc 3 2)
