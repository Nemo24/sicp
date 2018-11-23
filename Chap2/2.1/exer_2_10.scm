;Ben Bitdiddle, an expert systems programmer, 
;looks over Alyssa’s shoulder and comments 
;that it is not clear what it means to divide by an interval 
;that spans zero. Modify Alyssa’s code to check for this condition 
;and to signal an error if it occurs.

(define (x n)
  (if (< n 0)
      (error "N cannot be less than 0!!")
      ( * n 2)))



(define (div-interval x y)
  (if (and (< (lower-bound y) 0) ( >(upper-bound y) 0))
      (error "interval cannot span 0 !!")
      (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))


;(define iv1 (make-interval -1 1))
;Value: iv1

;(define iv2 (make-interval 2 3))

;Value: iv2
;(div-interval iv2 iv1)

;interval cannot span 0 !!

; (div-interval iv1 iv2)

;Value 5: (-.5 . .5)