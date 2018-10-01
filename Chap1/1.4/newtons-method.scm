(load "/Users/manoharm/mm-personal/learning/sicp/Chap1/1.3/fixed-point.scm")

; der(f(x)) = (f(x + dx) - f(x))/ dx where limit dx -> 0

(define (deriv f)
   (define dx 0.00001)
   (lambda (x) ( / ( - (f (+ x dx)) 
                    ( f x))
                dx))) 

(define (cube x) (* x x x))

; ((deriv cube) 5)

;Value: 75.00014999664018


; newtons method 
; fixed-point of f(x) fixed-point(f(x)) = x - (f(x)/deriv(f(x)))
(define (average a b) ( / (+ a b) 2.0))

; average-damp takes a function and returns a function 
(define (average-damp f) (lambda (x) (average (f x) x))) 	 	


(define (newton-transform f)
 (define transform (lambda (x) (- x (/ (f x) ((deriv f) x)))))
 (average-damp transform) )

(define (newton f guess)
  (fixed-point (newton-transform f) guess))

(define (sqrt x)
  (newton (lambda (y) (- x (* y y))) 1.0))