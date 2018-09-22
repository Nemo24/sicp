
; at each stage , there is a factorial n -1 to remember
; so it behaves like a recursive process
(define (factorial n)
  (if (= n 1)
      n
      (* n (factorial (- n 1)))))


; use an accumulator so that its a
; tail recursive process. 
; at each stage there is nothing to remember 
; and it behaves like a iterative processs
(define (factorial_iter n)
(define (fact-iter n current_n current_accum)
  (if (= n current_n)
    current_accum
    (fact-iter n current_n (* n current_accum)
    )
  )
)
(fact-iter n 1 1)
)
      
; we could have written above like this
; to avoid having n as an additional parameter in the inner proc
(define (factorial_iter2 n)
(define (iter product counter)
(if (> counter n) product
        (iter (* counter product)
              (+ counter 1))))
(iter 1 1))
