;Consider the problem of representing line segments in a plane. 
;Each segment is represented as a pair of points:
;a starting point and an ending point. 
;Define a constructor make-segment and selectors start-segment 
;and end-segment that define the representation of segments in terms of points.
;Furthermore, a point can be represented as a pair of numbers: the x coordinate 
;and the y coordi- nate. Accordingly, specify a constructor make-point and 
;selectors x-point and y-point that define this representa- tion. Finally, 
;using your selectors and constructors, define a procedure midpoint-segment 
;that takes a line segment as argument and returns its midpoint 
;(the point whose coordinates are the average of the coordinates of the endpoints). 

(define (make-point x y)
  (cons x y))

(define (x-cor point)
  (car point))

(define (y-cor point)
  (cdr point))


(define (print-point p) 
	(newline)
	(display "(") 
	(display (x-cor p)) 
	(display ",")
	(display (y-cor p))
	(display ")"))

(define (make-segment start end)
  (cons start end))

(define (start-point segment)
  (car segment))

(define (end-point segment)
  (cdr segment))

(define (midpoint-segment segment)
  (define (avg a b ) ( / (+ a b) 2.0 ))
  (make-point 
    (avg (x-cor (start-point segment))
         (x-cor (end-point segment)))
    (avg (y-cor (start-point segment))
         (y-cor (end-point segment)))))


;(define p1 (make-point 1 4))
;
;;Value: p1
;
;19 error> (define p2 (make-point 2 5))
;
;;Value: p2
;
;19 error> (define seg (make-segment p1 p2))
;
;;Value: seg
;
;19 error> (define mid-point (midpoint-segment seg))

;Value: mid-point


;(print-point mid-point)
;(print-point p1)
;
;(1,4)
;;Unspecified return value
;
;21 error> (print-point p2)
;
;(2,5)

;(1.5,4.5)