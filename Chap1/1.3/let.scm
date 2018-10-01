(define (test x)
  (let ((x 3 )
        (y (+ x 2))) ;; here x takes the value passed from (test x)
  	(* x y))) ; here x is 3 within the let expression


;; (test 2)

;Value: 12

