;We saw in section 1.3.3 that attempting to compute square roots
; by naively finding a fixed point of y  x/y does not converge
; , and that this can be fixed by average damping. 
; The same method works for finding cube roots
;  as fixed points of the average-damped y -> x/y2.
;   Unfortunately, the process does not work for fourth roots 
;   -- a single average damp is not enough to make a fixed-point search 
;   for y -> x/y3 converge. 
;   On the other hand, 
;   if we average damp twice 
;   (i.e., use the average damp of the average damp of y -> x/y3) 
;   the fixed-point search does converge. 
;   Do some experiments to determine how many average damps 
;   are required to compute nth roots 
;as a fixed-point search based upon repeated average damping of y -> x/yn-1. 
;Use this to implement a simple procedure for computing nth roots 
;using fixed-point, average-damp, and the repeated procedure of exercise 1.43. 
;Assume that any arithmetic operations you need are available as primitives.


(load "/Users/manoharm/mm-personal/learning/sicp/Chap1/1.3/fixed-point.scm")
(load "/Users/manoharm/mm-personal/learning/sicp/Chap1/1.4/exer_1_43.scm")
(load "/Users/manoharm/mm-personal/learning/sicp/Chap1/1.4/newtons-method.scm")


(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))


(define (cuberoot x)
  (fixed-point (average-damp (lambda (y) (/ x ( * y y))))
               1.0))




(define (fourth-root x n)
  (fixed-point ((repeated average-damp n) (lambda (y) (/ x ( * y y y)))) 
               1.0))

;(fourth-root 16 2)

;Value: 2.0000000000021965

;2 error> (fourth-root 256 2)

;Value: 4.000000000000006
(define (nth-root x n dampingfreq)
  (fixed-point ((repeated average-damp dampingfreq) (lambda (y) (/ x ( expt y (- n 1)))))
               1.0))

; 1 ]=> (nth-root 32 5 2)

;Value: 2.000001512995761

;1 ]=> (nth-root 243 5 2)

;Value: 3.0000008877496294




;Value: 2.000004634424174

;1 ]=> (nth-root (expt 2 30) 30 6)
;
;;Value: 2.0000066271485544
;
;1 ]=> (nth-root (expt 2 30) 30 5)
;
;;Value: 2.0000002860592985
;
;1 ]=> (/ (log 10) (log 2))
;
;;Value: 3.3219280948873626
;
;1 ]=> (/ (log 20) (log 2))
;
;;Value: 4.321928094887363
;
;1 ]=> (/ (log 4) (log 2))
;
;;Value: 2.
;
;1 ]=> (/ (log 3) (log 2))
;
;;Value: 1.5849625007211563
;
;1 ]=> (/ (log 8) (log 2))
;
;;Value: 3.
;
;1 ]=> (/ (log 30) (log 2))
;
;;Value: 4.906890595608519
;
;1 ]=> (nth-root (expt 2 30) 30 4)

;Value: 2.0000044907654058