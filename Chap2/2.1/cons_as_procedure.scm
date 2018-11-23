

(define (cons x y) 
	(define (dispatch m)
		(cond ((= m 0) x)
        ((= m 1) y)
        (else (error "Argument not 0 or 1: CONS" m))))
  dispatch)

(define (car z) (z 0)) 
(define (cdr z) (z 1))

; what is basically happening in above prcedure is that 
; we are creating a function in cons and returning that function
; that function creates a closure for x and y and later when car/cdr is called
; selects the appropriate value based on dispatch from the closure
;(cons 1 2)
;Value 9: #[compound-procedure 9 dispatch]

; (define bb (cons 2 3))
;Value: bb
; (car bb)
;Value: 2
; (cdr bb)
;Value: 3

;(bb 0)

;Value: 2

; (bb 1)

;Value: 3