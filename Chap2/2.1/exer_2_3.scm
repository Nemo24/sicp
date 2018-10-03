;Implement a representation for rectangles in a plane. 
;(Hint: You may want to make use of Exercise 2.2.) 
;In terms of your constructors and selectors, 
;create procedures that compute the perimeter 
;and the area of a given rectangle. 
;Now implement a different representation for rectangles. 
;Can you design your system with suitable abstraction barriers, so that the same 
;perimeter and area procedures will work using either representation?

(load "/Users/manoharm/mm-personal/learning/sicp/Chap2/2.1/exer_2_2.scm")

; giving the segment similar to this
;A......B
;.
;.
;.
;C
; here A-B is len-segment and A-C is width segment

(define (make-rect len-seg wid-seg) (cons len-seg wid-seg))

(define (length rect) (seg-len (car rect)))

(define (width rect) (seg-len (cdr rect)))

(define (seg-len segment)
  (let ((x1 (x-cor (start-point segment)))
        (x2 (x-cor (end-point segment)))
        (y1 (y-cor (start-point segment)))
        (y2 (y-cor (end-point segment))))
  	(sqrt (+ 
           (square (- x1 x2))
           (square (- y1 y2))))))



(define (perimeter rect)
  (let ((len (length rect))
        (wid (width rect)))
  	(+ (* 2 len)
      (* 2 wid))))

(define (area rect)
  (let ((len (length rect))
        (wid (width rect)))
    ( * len wid)))
  	
   
;(define a (make-point 0 5 ))
;;Value: a
;(define c (make-point  0 0 ))
;;Value: c
;(define b (make-point 6 5 ))
;;Value: b
  
;(define len-seg (make-segment a b))
;Value: len-seg
;(define wid-seg (make-segment a c))
;Value: wid-seg  
;(define rec1 (make-rect len-seg wid-seg))
;Value: rec1

;(perimeter rec1)

;Value: 22

;(area rec1)

;Value: 30


; now lets represent the rectangle using 2 corner points
;A
; ...........
; .         .
; .         .
; .         . 
; ...........
;            D

(define (make-rect-2 corner1 corner2)
  (cons corner1 corner2))

(define (length rect)
  (let ((c1 (car rect))
        (c2 (cdr rect)))  
  	(abs ( - (x-cor c1) (x-cor c2)))))

(define (width rect)
  (let ((c1 (car rect))
        (c2 (cdr rect)))  
  	(abs ( - (y-cor c1) (y-cor c2)))))

;(define a (make-point 0 5 ))
;Value: a

;(define d (make-point 6 0 ))
;Value: d

;(define rect2 (make-rect-2 a d))
;Value: rect2

;(perimeter rect2)
;Value: 22

; (area rect2)
;Value: 30

; perimeter and area is same as top exaple using segments to represent rectangles
;with only selectors(length and width) and constructors(make-rect*) changing for making a rectangle
;we can still retain the logic of perimeter and area without any changes

