(load "series-sum")

(define
  (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (*
   (sum f ( + a (/ dx 2.0)) add-dx b)
   dx))
(integral cube 0 1 0.01)

;Value: .24998750000000042

(integral cube 0 1 0.001)
;Value: .249999875000001


;; simpsons rule h/3(y0 +4y1 +2y2 +4y3 +2y4 +···+2yn−2 +4yn−1 +yn)
;; where  h = (b − a)/n
;; yk = f (a + kh)



(define (simpson f a b n )
    (define  h  ( / ( - b a ) n))
    (define (inc x) ( + x 1))
    (define (term k)
      ( cond (( = 0 k) (y 0))
	     (( = k n) (y n))
	     ((is-even? k) ( * 2 (y k)))
	     (else ( * 4 ( y k)))))
    (define (y k ) 
      ( f ( + a (* k h))))
    (* ( /  h  3 ) (sum term 0 inc n)))



(define (simpson-billreal f a b n)
  (define h (/ (- b a) n))
  (define (inc x) (+ x 1))
  (define (y k)
    (f (+ a (* k h))))
  (define (term k)
    (* (cond ((odd? k) 4)
             ((or (= k 0) (= k n)) 1)
             ((even? k) 2))
       (y k)))
  (/ (* h (sum term 0 inc n)) 3))

(define (is-even? n)
  (= 0 (remainder n 2)))


(define (cube x) ( * x x x ))
