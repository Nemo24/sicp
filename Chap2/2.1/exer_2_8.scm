;Using reasoning analogous to Alyssa’s, describe how the difference of two
 ;intervals may be computed. Define a corresponding subtraction procedure, 
 ;called sub-interval.
 
 (define (sub-interval x y)
  (make-interval (+ (upper-bound x) (upper-bound y))
                 (+ (lower-bound x) (lower-bound y))))