;;Louis Reasoner is having great difficulty do- ing Exercise 1.24. His fast-prime? test seems to run more slowly than his prime? test. Louis calls his friend Eva Lu Ator over to help. When they examine Louis’s code, they find that he has rewrien the expmod procedure to use an explicit multiplication, rather than calling square:
;;(define (expmod base exp m) (cond ((= exp 0) 1)
;;        ((even? exp)
;;         (remainder (* (expmod base (/ exp 2) m)
;;                       (expmod base (/ exp 2) m))
;;                    m))
;;(else
;;(remainder (* base
;;                       (expmod base (- exp 1) m))
;;                    m))))
;;“I don’t see what difference that could make,” says Louis. “I do.” says Eva. “By writing the procedure like that, you have transformed the Θ(logn) process into a Θ(n) process.” Explain.
;;


;;answer 
;; when you change (square (expmod base (/ exp 2) m))) to
;;                      * (expmod base (/ exp 2) m)
;;                       (expmod base (/ exp 2) m))
;; the applicative order processing which restrict the computation of expmod to once
;;  for the square function now doubles which takes the O(logn) to a 2^O(logn) which is O(n)
