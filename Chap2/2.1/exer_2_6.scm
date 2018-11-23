;In case representing pairs as procedures wasn't mind-boggling enough
;, consider that, in a language that can manipulate procedures
;, we can get by without numbers 
;(at least insofar as nonnegative integers are concerned) 
;by implementing 0 and the operation of adding 1 as
;
;(define zero (lambda (f) (lambda (x) x)))
;
;(define (add-1 n)
;  (lambda (f) (lambda (x) (f ((n f) x)))))
;
;This representation is known as Church numerals
;, after its inventor, Alonzo Church, the logician 
;who invented the  calculus.
;
;Define one and two directly 
;(not in terms of zero and add-1). 
;(Hint: Use substitution to evaluate (add-1 zero)). 
;Give a direct definition of the addition procedure 
;+ (not in terms of repeated application of add-1).

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (
               lambda (x) 
               (f (
                   (n f) 
                   x)
                  ))))

; lets use substituion principle

zero --> lambda (f) (lambda (x) x)
add-1 ---> lambda (f) (lambda (x) (f ((n f) x)))
add-1 zero 
(  lambda (f) (lambda (x) (f ((n f) x)))  
    lambda (f) (lambda (x) x) )
substitute zero for n in the body of add-1 

lambda (f) (
               lambda (x) 
               (f (
                   (zero f) 
                   x)
                  ))


lambda (f) (
            lambda (x) (			       
                        f ((lambda (x) x)  ; (lambda(x) x) applied to x returns
                        x))                ; x

= lambda (f) ( lambda (x) ( f x) )
            
if we compare this with zero the body has (f x) instead of x

one -> lambda (f) ( lambda (x) ( f x) )

(define one
  (lambda (f) ( lambda (x) ( f x) )))

;((one inc) 1)

;Value: 2

;11 error> ((one inc) 3)

;Value: 4
------------------------------------
lets try to add-one to one now

lambda (f) (
               lambda (x) 
               (f (
                   (n f) 
                   x)
                  ))

substitute lambda (f) ( lambda (x) ( f x) ) for n
lambda (f) (
            lambda (x) 
            (f (
                (lambda (f) ( lambda (x) ( f x) ) f) ;; this resolves to ( lambda (x) ( f x) )
                x)))

                    
lambda (f) (
            lambda (x) 
            (f (
                ( lambda (x) ( f x) ) ;resolves to (f x)
                x)))                  ;
   
 lambda (f) ( lambda (x) (f (f x)))   
 
 two ->  lambda (f) ( lambda (x) (f (f x)))  
 
 (define two 
   (lambda (f) ( lambda (x) (f (f x)))))
 
; ((two inc) 3)

;Value: 5

 ; for testing
 (define (inc n)
   (+ n 1))  
 
                           
                           
                           
                           