(define (pascal row col)
    (cond
        (( < row col) #f) 
        ((or (= row col) (= col 1) ) 1)
        (else  ( + (pascal (- row 1) col) (pascal (- row 1) (- col 1))))
    )
)


