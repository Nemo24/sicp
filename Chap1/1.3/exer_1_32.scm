
;; accumulate recursive
(define (accumulate combiner null-value term a next b)
  (if ( > a b )
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b ))))


(define (prod-com term  a next b)
  (accumulate * 1 term a next b))


(define (inc n) (+ n 1))
(define (identity x) x)

(define (prod-linear-com a b)
  (prod-com identity a inc b))

(define (prod-sq a b )
  (prod-com (lambda (x) (* x x )) a inc b))


(define (sum-linear a b)
  (accumulate + 0 identity a inc b))


;; accumulate iterative
(define (accumulate-iter combiner null-value term a next b)
    (define (iter a result)
    ( if (> a b )
	 result 
	 (iter (next a)  (combiner (term a) result))))
    (iter a null-value))


(define (sum-linear-iter a b)
  (accumulate + 0 identity a inc b))

(define (prod-linear-com-iter a b)
  (accumulate-iter * 1 identity a inc b))