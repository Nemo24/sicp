(load "/Users/manoharm/mm-personal/learning/sicp/Chap1/1.2/gcd.scm")

(define (make-rat num den)
  (let ((g (gcd num den)))
  	(cons ( / num g) ( / den g)) ))


(define (numer rat)
  (car rat))

(define (denom rat)
  (cdr rat))

(define (add-rat x y)
  (make-rat (+ 
              (* (numer x) (denom y) )
              (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- 
              (* (numer x) (denom y) )
              (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat ( 
              (* (numer x) (num y) )
              (* (denom x) (denom y)))))

(define (div-rat x y)
  (make-rat ( 
              (* (numer x) (denom y) )
              (* (denom x) (numer y)))))

(define (equal-rat? x y)
(= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (print-rat rat)
  (display (numer rat))
  (display "/")
  (display (denom rat)) #t)
