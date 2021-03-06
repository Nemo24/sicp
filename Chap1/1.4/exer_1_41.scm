; Define a procedure double that takes a procedure of one argument 
; as argument and returns a procedure that applies the
; original procedure twice. For example, if inc is a procedure 
; that adds 1 to its argument, 
; then (double inc) should be a procedure that adds 2. What value is returned by
;
;(((double (double double)) inc) 5)

(define (double f)
  (lambda (x) (f (f x))))


(define (inc a) ( + 1 a))

(define doubleinc (double inc))

; (doubleinc 3)
;
;;Value: 5
;
;5 error> (doubleinc 4)
;
;;Value: 6
;
;5 error> (doubleinc 10)
;
;;Value: 12


;(((double (double double)) inc) 5)

;Value: 21