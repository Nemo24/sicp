;An infinite continued fraction is an expression of the 94
; 
;form
;As an example, one can show that the infinite con- tinued fraction expansion with the Ni and the Di all equal to 1 produces 1/φ, where φ is the golden ratio (described in Section 1.2.2). One way to approximate an infinite continued fraction is to truncate the expan- sion aer a given number of terms. Such a truncation— a so-called k-term finite continued fraction—has the form
;N1
;.
;N2 ... + Nk
;Dk
;Suppose that n and d are procedures of one argument
;(the term index i) that return the Ni and Di of the terms of the continued fraction. Define a procedure cont-frac such that evaluating (cont-frac n d k) computes the value of the k -term finite continued frac- tion. Check your procedure by approximating 1/φ us- ing
;(cont-frac (lambda (i) 1.0) (lambda (i) 1.0)
;k)
;f= N1 /
; N2 D2+ N3
;D1 +
;D3 + . . .
;   D1 +
;  95
;
;for successive values of k. How large must you make k in order to get an approximation that is accurate to 4 decimal places?
;b. Ifyourcont-frac procedure generates a recursive process, 
;write one that generates an iterative process. 
;If it generates an iterative process, write one that gen- erates a recursive process.



(define (cont-frac n d k)
  (define (cont-frac-rec n d a)
    (if (= k a)
      (/ (n k) (d k))
      (/ ( n a )  ( + (d  a) (cont-frac-rec n d (+ 1 a))))))
  (cont-frac-rec n d 1)) 

(define (phi k)
  (/ 1 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)))
;Value: phi

; (phi 2)

;Value: 2.

;1 ]=> (phi 3)

;Value: 1.5

;1 ]=> (phi 10)

;Value: 1.6181818181818184

; ]=> (phi 100)

;Value: 1.618033988749895




(define (cont-frac-iter n d k)
  (define (cont-frac-inner n d a result)
    (if (= a 1)
      result
      (cont-frac-inner n d (- a 1) (/ ( n ( - a 1)) (+ (d (- a 1)) result)))))
  (cont-frac-inner n d k (/ (n k) (d k))))


(define (phi-iter k)
  (/ 1 (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) k))) 

(define (cont-frac-iter-bill n d k)
   (define (frac-iter i result)
       (if (= i 0)
           result
           (frac-iter (- i 1) (/ (n i) (+ (d i) result)))))
   (frac-iter (- k 1) (/ (n k) (d k))))

(define (phi-iter-bill k)
  (/ 1 (cont-frac-iter-bill (lambda (i) 1.0) (lambda (i) 1.0) k))) 


;3 error> (phi 3)

;Value: 1.5

;3 error> (phi 100)

;Value: 1.618033988749895

;3 error> (phi-iter 100)

;Value: 1.618033988749895

