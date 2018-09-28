
      
;; fermat method
;; if n is prime then with a as any positive number less than n
;; a^n % n = a%n

(load "expn.scm")

(define (isprime? n)
  1)


(define (fermat-test n)
  ( define (try-it a))
  (display "a ")(display a)
  ( = (remainder-expt a n) a)
  
  (try-it ( + 1 (random ( - n 1)))))


(define (remainder-expt a n)
  (remainder
   (fast-expt a n ) n))

  










  

      
