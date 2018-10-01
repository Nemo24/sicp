
;In 1737, the Swiss mathematician Leonhard Euler 
;published a memoir De Fractionibus Continuis, 
;which included a continued fraction expansion 
;for e − 2, where e is the base 
;of the natural logarithms. In this fraction,
; the Ni are all 1, 
; and the Di are successively
;  1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, 
;  . . .. Write a program that uses your cont-frac
;   procedure from Exercise 1.37 to approximate e,
;    based on Euler’s expansion

(load "/Users/manoharm/mm-personal/learning/sicp/Chap1/1.3/exer_1_37.scm")


(define (n i) 1.0)

(define (d i)
  (cond ((= i 1) 1.0)
        ((= i 2) 2.0)
  		((= (remainder i 3) 2) (+ 2.0 ( * (quotient i 3) 2.0)))
    ( else 1))) 

(define (e k)
  (+ 2 (cont-frac n d k)))


;Value: 2.6666666666666665

;6 error> (e 3)

;Value: 2.75

;6 error> (e 4)

;Value: 2.7142857142857144

;6 error> (e 100)

;Value: 2.7182818284590455