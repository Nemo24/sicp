
;Several of the numerical methods described in this chapter are instances of an 
;extremely general computational strategy known as iterative improvement. Iterative 
;improvement says that, to compute something, we start with an initial guess for the 
;answer, test if the guess is good enough, and otherwise improve the guess and 
;continue the process using the improved guess as the new guess. Write a procedure 
;iterative-improve that takes two procedures as arguments: a method for telling 
;whether a guess is good enough and a method for improving a guess. Iterative-improve 
;should return as its value a procedure that takes a guess as argument and keeps 
;improving the guess until it is good enough. Rewrite the sqrt procedure of section 
;1.1.7 and the fixed-point procedure of section 1.3.3 in terms of iterative-improve.

(define (iterative-improve good-enuf? improve-guess)
  (define ( try guess) 
    (if (good-enuf? guess)
         guess
        (try (improve-guess guess))))
  try)


;; below is what we have in section 1.17 for sqrt
;(define (sqrt-iter guess x) (if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve guess x) x)))
;(define (improve guess x) (average guess (/ x guess)))
;where
;(define (average x y) (/ (+ x y) 2))
;We also have to say what we mean by “good enough.” 
;(define (good-enough? guess x)
;(< (abs (- (square guess) x)) 0.001))
;
; 
;Finally, we need a way to get started. 
;(define (sqrt x) (sqrt-iter 1.0 x))

;; lets try to define what good-enuf is in the iterative-improve method first
;;good-enuf is a procedure which takes guess as an argument 
;; and says whether it is good enuf


(define ( sqrt-it-improved x) 
  (define guess 1.0)
  (define (good-enuf? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve-guess guess)
    (define (average a b) ( / ( + a b) 2))
    (average guess (/ x guess))) 
  ((iterative-improve good-enuf?    improve-guess ) guess))
 
 ; if i want good-enuf? to be outside of the sqrt-it function , then 
 ;i need a procedure which accepts x as input and returns a procedure which accept the guess as input
 
 (define (good-enuf? x)
    (lambda (guess) (< (abs (- (square guess) x)) 0.001))) 
 
 ;similarly improve guess also shud be this way
 (define (improve-guess x)
    (define (average a b) ( / ( + a b) 2))
    (lambda (guess) (average guess (/ x guess)))) 
 
 
 ; have to apply good-enuf and improve-guess 
 ;with x { (good-enuf? x) (improve-guess x) in velow procedure}
 ; to get the actual procedure
 ; but this is confusing and sqrt-it-improved is much more clean 
 (define ( sqrt-it-improved2 x) 
  (define guess 1.0)
  ((iterative-improve (good-enuf? x)    (improve-guess x) ) guess)) 
 
;fixed-point definition was 
;(define (fixed-point f first-guess)
; (define (close-enough? v1 v2) 
;   (< (abs (- v1 v2)) tolerance)) 
; (define (try guess)
;   (let ((next (f guess)))
;     (if (close-enough? guess next)
;         next
;         (try next))))
; (try first-guess))


;method for testing fixed point was 
;define (sqrt x)
; (define (average a b) (/ ( + a b) 2.0))
; (fixed-point 
;   (lambda (y) (average ( / x y) y)) 1.0 ))


(define (fixed-point f first-guess)
  (define (close-enough? guess)
    (< (abs (- guess (f guess))) 0.0001))
  (define (improve-guess guess)
    (f guess))
  ((iterative-improve close-enough? improve-guess) first-guess))

(define (sqrt-fp x)
 (define (average a b) (/ ( + a b) 2.0))
 (fixed-point 
   (lambda (y) (average ( / x y) y)) 1.0 ))
