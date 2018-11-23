;Show that we can represent pairs of nonnegative integers 
;using only numbers and arithmetic operations 
;if we represent the pair a and b as 
;the integer that is the product 2ˆa * 3ˆb .
;Give the corresponding definitions of the procedures cons, car, and cdr.


(define (cons a b)
  (* (expt 2 a) 
  	(expt 3 b)))

; below procedure decides how much times can a number get divided by a divided
; example 2ˆa * 3ˆb dividies-times 2 should give back a 

(define (divides-times input divident result)
  (display input)(display " ")(display divident)(newline)
  (if ( or (<= input 0) (not (= (floor input) input))) ; when its no more a integer this will pass
      (- result 1)     ; we have already increased this number .. but the last incrment does not hold 
      (divides-times  (/ input divident) divident (1+ result))))
(define (car a)
  (divides-times a 2 0))

(define (cdr a)
  (divides-times a 3 0))


