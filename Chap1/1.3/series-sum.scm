(define (cube x)
  ( * x x x ))


;; simple summation without higher order procedures

(define (sum-integers a b)
  ( if ( > a b )
       0
       ( + a (sum-integers ( + a 1) b))))


(define (sum-cubes a b)
  ( if ( > a b )
       0
       ( + (cube a) (sum-cubes ( + a 1) b))))


(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2)))
	 (pi-sum (+ a 4) b))))


;;(define (⟨name⟩ a b)
;;  (if (> a b)
;;      0
;;      (+ (⟨term⟩ a)
;;	 (⟨name⟩ (⟨next⟩ a) b))))

(define (sum term  a next b)
  (if ( > a b)
      0
      (+ (term a)
	 (sum term (next a) next  b ))))



(define (inc n) (+ n 1))

(define (sum-cubes-highorder a b)
  (sum cube a inc b))

(define (pi-sum-highorder a b)
  (define (term a)
    (/ 1.0 (* a (+ a 2))))
  (define (next a)
    (+ a 4))
  (sum term a next b))
