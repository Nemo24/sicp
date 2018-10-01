(define (f g) (g 2))
(f square)

;Value: 4
(f (lambda (z) (* z (+ z 1))))

;Value: 6

;;What happens if we (perversely) 
;;ask the interpreter to evaluate the combination (f f)? Explain.
( f f)

;The object 2 is not applicable.
;To continue, call RESTART with an option number:
; (RESTART 2) => Specify a procedure to use in its place.
; (RESTART 1) => Return to read-eval-print level 1.

;; the definition is (f g ) (g 2)
;g is expected to be a function
;lets try to for square via the substituion method
;(f square) ==> ( square 2) ==> 4

;; similarly use substitution method for ( f f)
;( f f ) 
;==> (f 2) 
;==> ( 2 2) 
;==> this throws error since 2 is not a function