;;Exercise 1.30: The sum procedure above generates a linear recursion
.  p;;rocedure can be rewritten so that the sum is performed iteratively. Show h;;ow to do this by filling in the missing expressions in the following d;;efin;;ition:
;;(define (sum term a next b) (define (iter a result)
;;(if ⟨??⟩ ⟨??⟩
;;(iter ⟨??⟩ ⟨??⟩))) (iter ⟨??⟩ ⟨??⟩))

(define (sum-iter term a next b)	
  (define (iter a result)
    ( if (> a b ) 
     result 
	 (iter (next a)  (+ (term a) result))))
  (iter a 0))  
	 


(define (inc x ) 
  ( + x 1))

(define (cube x) 
  ( * x x x))
(define (sum-cubes-iter a b)
  (sum-iter cube a inc b))

(sum-cubes-iter 0 3)

(sum-cubes 0 4)
