;The idea of smoothing a function is an important concept 
;in signal processing. If f is a function and dx is some small number,
; then the smoothed version of f is the function whose value at a point x is the ;average of f(x - dx), f(x), and f(x + dx). 
; Write a procedure smooth that takes as input a procedure that computes f and ;returns a procedure that computes the smoothed f. 
; It is sometimes valuable to repeatedly smooth a function 
; (that is, smooth the smoothed function, and so on) to obtained the n-fold smoothed function.
;  Show how to generate the n-fold smoothed function of any given function using ;smooth and repeated from exercise 1.43.


(define (smooth f)
  (define dx 0.0001)
  (lambda (x) (/ 3
                (+ 
                  (f (- x dx)) 
                  (f x)
                  (f ( + x dx))))))

(define (n-smooth f n)
  (repeated smooth n))

(define pi 3.1428)
 
(sin (/ pi 2))

(n-smooth )