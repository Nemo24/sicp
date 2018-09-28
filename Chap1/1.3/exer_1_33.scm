(define (accumulate-filter combiner predicate null-value term a next b)
    (define (iter a result)
    ( if (> a b )
	 result 
	 (iter (next a)  
        (if (predicate a)
            (combiner (term a) result) 
            result))))
    (iter a null-value))


;; getting prime from below file
(load "/Users/manoharm/mm-personal/learning/sicp/Chap1/1.2/timed-prime.scm")

;;the sum of the squares of the prime numbers
;;in the interval a to b (assuming that 
;; you have a prime? pred- icate already written)
(define (sum-sqa a b)
  (accumulate-filter + prime? 0 (lambda (x) (* x x)) a 1+ b)) ;; 1+ is the builtin increment operator

;;theproductofallthepositiveintegerslessthann 
;;that are relatively prime to n 
;;(i.e., all positive integers i < n such that gcd(i,n) = 1).

;; getting gcd from below 
(load "/Users/manoharm/mm-personal/learning/sicp/Chap1/1.2/gcd.scm")



(define (identity x)  x)

(define (prod-gcd1 a b)
  (define (is-gcd-1? i)
  (= (gcd i b ) 1))
  (accumulate-filter * is-gcd-1? 1 identity a 1+ b)) ;; 1+ is the builtin increment operator
