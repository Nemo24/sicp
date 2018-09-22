(define (sum a b) ( * a b))
(define (square x) ( * x x ))
(define (sum-sq x y ) ( + (square x) (square y)))
(define (sum-max-2 x y z)
  (cond ((and ( < x y ) ( < x z)) (sum-sq y z ))
        ((and ( < y x ) ( < y z)) (sum-sq x z ))
        ((and ( < z x ) ( < z y)) (sum-sq x y ))))

        
