(define (sum_tail_rec x y )
(if ( = x 0 )
    y
    ( sum_tail_rec (-1+ x) (1+ y))))

(define (sum_not_tail_rec x y )
 (if ( = x 0 )
    y
    ( 1+ ( sum_not_tail_rec (-1+ x) y)
    )
 )
)


;(sum_tail_rec 100000 1)

;Value: 100001

;(sum_not_tail_rec 100000 1)

;Aborting!: maximum recursion depth exceeded

