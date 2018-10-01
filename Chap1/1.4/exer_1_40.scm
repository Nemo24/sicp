;Exercise 1.40: Define a procedure cubic that can be used 
;together with the newtons-method procedure in expressions of the form
;      (newtons-method (cubic a b c) 1)
;to approximate zeros of the cubic x3 + ax2 + bx + c.


(load "/Users/manoharm/mm-personal/learning/sicp/Chap1/1.4/newtons-method.scm")

(define (cubic a b c)
  (lambda (x) (+ (* x x x)
                 (* a x x)
                 (* b x)
                 c)))


(define (cubic-zeros f)
  (newton f 1.0))

;( cubic-zeros ( cubic 1 1 1))
;
;;Value: -.9999911472005417
;
;
;5 error> ( cubic-zeros ( cubic -2 -6 4))

;Value: .5857925308300285

; bill lizard answer
;( cubic-zeros (cubic 3 -2.4 6))

;Value: -3.9813293812991644
