
;A continued fraction representation of the tangent function 
;was published in 1770 by the German math- ematician J.H. Lambert:
;tanx = x / ( 1 - (x^2/(3 - (x^2 -))))--
; where x is in radians. 
; Define a procedure (tan-cf x k) that 
; computes an approximation to the tangent function based on Lambert’s formula.
;  k specifies the number of terms to compute, as in Exercise 1.37.


(load "/Users/manoharm/mm-personal/learning/sicp/Chap1/1.3/exer_1_37.scm")




(define (tan-cf x k)
  (define (num i) 
   (if (= i 1)
      x
      (* -1.0 (* x x))))
  (define (den i) (- (* 2 i) 1.0))
  (cont-frac num den k))

;6 error> (tan-cf 8 100)

;Value: -6.799711455220386

;6 error> (tan-cf 8 1000)

;Value: -6.799711455220386

;6 error> (tan-cf 10 1000)

;Value: .6483608274590866

;6 error> (tan-cf 10 100)

;Value: .6483608274590866

;6 error> 