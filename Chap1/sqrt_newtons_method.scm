

(define (square x) ( * x x ))



(define (average x y)
 (/ ( + x y ) 2))


(define (improve-guess guess x)
  (average guess (/ x guess)))

(define (improve-guess-2 guess x)
  (cond (<= 0.001 (abs ( - (improve-guess guess x ) guess)))
  ( guess )
  (else (improve-guess guess x))))

(define (good-enough? guess x)
  (<= (abs (- (square guess) x)) 0.001))

(define (try guess x)
  (if (good-enough? guess x)
      guess      
      (try (improve-guess guess x)
        x)
      )
)

#| if we use the below new-if in the try procedure
   it runs in an infinite loop since new-if is 
   a procedure.A procedure evalautes BOTH conditions in applicative order
   hence recursion runs forever resulting in a
   stack overflow . 
|#
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

#| new-try2 works since we are using cond here
   directly instead of creating a procedure
|#
(define (new-try guess x)
  (new-if (good-enough? guess x)
      guess      
      (new-try (improve-guess guess x)
        x)
      )
) 

(define (new-try2 guess x)
  (cond ((good-enough? guess x)
      guess)      
      (else (new-try2 (improve-guess guess x)
        x))
      )
)
(define (sqrt x) (try 1.0 x))


