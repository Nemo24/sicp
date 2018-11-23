;The width of an interval is half of the difference 
;between its upper and lower bounds. 
;The width is a measure of the uncertainty of the number 
;specified by the interval.
; For some arithmetic operations the
; width of the result of combining two intervals 
;is a function only of the widths of the argument intervals
;, whereas for others the width of the combination is
; not a function of the widths of the argument intervals. 
;Show that the width of the sum (or difference) of two intervals
; is a function only of the widths of the intervals being added 
;(or subtracted). Give examples to show that this is not true for
; multiplication or division.

(define (width-interval interval)
  (/ 
    (- (upper-bound interval) ( lower-bound interval))
    2.0)) 


;let
;interval i1 = x1|y1 where x is lower-bound and y is upper-bound
;interval i2 = x2|y2
;then 
;add-interval = x1 + y1 | x2 + y2
;width-interval i1 = (y1 - x1 )/2
;width-interval i2 = (y2 - x2 )/2
;
; add(i1 + i2) = x1 + x2 | y1 + y2
; 
; width-interval (add(i1 + i2 )) = (( y1 + y2) - (x1 + x2)) /2
; = ( y1 - x1)/ 2  + (y2 - x2 )/2 = width-interval i1 + width-interval i2
;similarly we can prove subtraction of intervals as well

;define int1 (make-interval 2 3))

;Value: int1

; error> (define int2 (make-interval 4 5))

;Value: int2

; error> (width-interval int1 )

;Value: .5

; error> (width-interval int2 )

;Value: .5

; error> (width-interval (mul-interval int1 int2))

;Value: 3.5

