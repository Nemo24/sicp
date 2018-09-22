(define (gcd a b)
  (cond
   ((= 0 b) a )
   (else (gcd b (remainder a b)))
   )
 )
  
   
;; normal order
;;(gcd 206 40)
;;(gcd 40 (remainder 206 40))
;;
;;if  = (remainder 206 40) 0 else
;;(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;;
;;if  (= 6 0) else -- 1 remainder
;;(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;;
;;if (remainder 40 (remainder 206 40)) = 0
;;else
;;(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;;etc
;;this gets complicated to write down 
;;
;;refer
;;http://www.billthelizard.com/2010/01/sicp-exercise-120-gcd.html

;; normal order creates many remainder sum total is 18

;; applicative order

;;; (gcd 40 (remainder 206 40)) ;; 1 remainder
;;; (gcd 40 6) = ( gcd (6 ( remainder 40 6)) ;; 2 remainder
;;; (gcd 6 4) = ( gcd 4 (remainder 6 4)) ;; 3 remainder
;;; (gcd 2 (remainder 4 2)) ;; 4 remainder
;;; (gcd 2 0 ) ;; 4 remainder

;; applicative order only needs 4 remainder calls
		   
		   
