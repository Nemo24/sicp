;;Show that the golden ratio φ (Section 1.2.2) 
;is a fixed point of the transformation x 􏰀→ 1 + 1/x
;, and use this fact to compute φ 
;by means of the fixed-point procedure.
(load "/Users/manoharm/mm-personal/learning/sicp/Chap1/1.3/fixed-point.scm")


;x -> 1 + 1/x
; x -> (x +1 ) /x
; x^2 -x -1 = 0 . Solving for the root , we get phi 

(define phi
  (fixed-point (lambda (x) ( + 1 (/ 1.0 x))) 2.0))