; Here is an alternative procedural representation of pairs. 
;For this representation, verify that (car (cons x y)) yields 
;x for any objects x and y.

(define (cons x y) 
  (lambda (m) (m x y)))

(define (car z)
(z (lambda (p q) p)))

(define (cdr z)
(z (lambda (p q) q)))

;(car (cons 3 4)))
;Value: 4
;(cdr (cons 3 4)))
;Value: 4

;lets use substitution and see how this works

;z -> (cons 3 4) -> lambda(m) (m 3 4) -> returns a procedure which accepts m as argument and returns ( m 3 4) as value
;(car z) -> (z lambda( p q) p)  --> applies lambda(p q) p as argument for the above m parameter
;--> ( (lambda (p q) p) ( 3 4)) --> applies ( 3 4) values to procedure (lambda (p q) p)
;--> (lambda ( 3 4) 3) -> 3