;Define a better version of make-rat that handles
;both positive and negative arguments.
;make-rat should normalize the sign
;so that if the rational number is positive, 
;both the numerator and denominator are positive, and 
;if the rational number is negative,
;only the numerator is negative.

(load "/Users/manoharm/mm-personal/learning/sicp/Chap2/2.1/rational.scm")

(define (make-rat-2 num den)
  (let ((g (gcd num den)))
        (let ((numnew (/ num g))
              (dennew (/ den g)))
          (if (and (< dennew 0) (> numnew 0))
              (cons  (* -1 numnew) (* -1 dennew))
              (cons numnew dennew)))))
    
    
;(print-rat (make-rat-2 -1 6))
;(print-rat (make-rat-2 -1 -6))
;(print-rat (make-rat-2 -3 6))
;(print-rat (make-rat-2 -3 -6))
;(print-rat (make-rat-2 3 6))
;(print-rat (make-rat-2 3 -6))
;-1/6
;;Value: #t
;
;19 error> 1/6
;;Value: #t
;
;19 error> -1/2
;;Value: #t
;
;19 error> 1/2
;;Value: #t
;
;19 error> 1/2
;;Value: #t
;
;19 error> -1/2
;Value: #t
