;Alyssa’s program is incomplete because she has not specified the implementation of the interval ab- straction. Here is a definition of the interval constructor:
(define (make-interval a b) (cons a b))
;Define selectors upper-bound and lower-bound to complete
;the implementation.

(define (lower-bound interval)  (car interval))

(define (upper-bound interval)  (cdr interval))