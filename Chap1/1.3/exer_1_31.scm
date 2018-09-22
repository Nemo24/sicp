
(define (prod term  a next b)
  (if ( > a b)
      1
      (* (term a)
	 (prod term (next a) next  b ))))


(define (inc n) (+ n 1))

(define (identity x) x)
(define (prod-series a b)
  (prod identity a inc b))

(prod-series 1 4)

;Value: 24


(define (square x) (* x x))
(define (prod-square a b)
  (prod square a inc b))

(prod-square 1 3)



(define (prod-iter term a next b)	
  (define (iter a result)
    ( if (> a b )
	 result 
	 (iter (next a)  (* (term a) result))))
    (iter a 1))

(define (prod-square-iter a b)
  (prod-iter square a inc b))

(prod-square-iter 1 3)

( * 36 16)


;π/4  =2·4·4·6·6·8···/  3·3·5·5·7·7···

(define (pi n)
  (define (plus2 n) ( + n 2))
  
  (define (num-prod n)
    (define (mult x) (* ( * 2 x) (plus2 ( * 2 x))))
    ( prod-iter mult 1.0 inc n))
  
  (define (den-prod n)
      ( prod-iter square 1.0 plus2 ( * 2 (+ 1 n))))
   ( * 4 ( / (num-prod n) ( den-prod n))))
