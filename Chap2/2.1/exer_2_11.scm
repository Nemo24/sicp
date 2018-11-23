;In passing, Ben also cryptically comments: 
;“By testing the signs of the endpoints of the intervals, 
;it is possible to break mul-interval into nine cases,
; only one of which requires more than two multiplications.”
; Rewrite this procedure using Ben’s suggestion.
;after debugging her program, Alyssa shows it to a potential user, 
;who complains that her program solves the wrong problem. 
;He wants a program that can deal with numbers represented 
;as a center value and an additive tolerance; for example, 
;he wants to work with intervals such as 3.5 ± 0.15 
;rather than [3.35, 3.65]. Alyssa returns to her desk 
;and fixes this problem by supplying an alternate constructor 
;and alternate selectors:


(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (make-interval value tolerance)
  (cons value tolerance))

(define (lower-bound interval)
  ( - (car interval) (cdr interval)))

(define (upper-bound interval)
  ( + (car interval) (cdr interval)))