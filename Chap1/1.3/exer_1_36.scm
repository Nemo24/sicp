;Modify fixed-point so that it prints the sequence
; of approximations it generates, using the newline and display
; primitives shown in Exercise 1.22. ;
;Then find a solution to x^x = 1000
; by finding a fixed point of x 􏰀→ log(1000)/ log(x ).
; (Use Scheme’s primitive log procedure, which computes 
;natural logarithms.) Compare the number of steps 
;this takes with and without average damping. 
;(Note that you cannot start fixed-point with a guess of 1,;
; as this would cause division by log(1) = 0.


(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2) 
    (< (abs (- v1 v2)) tolerance)) 
  (define (try guess)
    (let ((next (f guess)))
      (display "guess is ")(display guess)(newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))



(define xpowerxeq1000-withoutavgdamp 
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 1.1))
;36 guesses
;guess is 72.47657378429035
;guess is 1.6127318474109593
;guess is 14.45350138636525
;guess is 2.5862669415385087
;guess is 7.269672273367045
;guess is 3.4822383620848467
;guess is 5.536500810236703
;guess is 4.036406406288111
;guess is 4.95053682041456
;guess is 4.318707390180805
;guess is 4.721778787145103
;guess is 4.450341068884912
;guess is 4.626821434106115
;guess is 4.509360945293209
;guess is 4.586349500915509
;guess is 4.535372639594589
;guess is 4.568901484845316
;guess is 4.546751100777536
;guess is 4.561341971741742
;guess is 4.551712230641226
;guess is 4.558059671677587
;guess is 4.55387226495538
;guess is 4.556633177654167
;guess is 4.554812144696459
;guess is 4.556012967736543
;guess is 4.555220997683307
;guess is 4.555743265552239
;guess is 4.555398830243649
;guess is 4.555625974816275
;guess is 4.555476175432173
;guess is 4.555574964557791
;guess is 4.555509814636753
;guess is 4.555552779647764
;guess is 4.555524444961165
;guess is 4.555543131130589
;guess is 4.555530807938518A
;Value: 4.555538934848503

;Value: xpowerxeq1000-withoutavgdamp
(define (x)
  (define (sq a) (* a a))
    (sq 3))

(define  (xpowerxeq1000-withavgdamp) 
   (define (average a b) ( / (+ a b) 2.0))
   (define (log1000bylogx x)
     (let ((logval (/ (log 1000) (log x)) ))
     	(average  logval x)))
   (fixed-point  log1000bylogx 1.1))

; 13 steps
;guess is 1.1
;guess is 36.78828689214517
;guess is 19.352175531882512
;guess is 10.84183367957568
;guess is 6.870048352141772
;guess is 5.227224961967156
;guess is 4.701960195159289
;guess is 4.582196773201124
;guess is 4.560134229703681
;guess is 4.5563204194309606
;guess is 4.555669361784037
;guess is 4.555558462975639
;guess is 4.55553957996306
;Value: 4.555536364911781


;3 error> (expt 4.555536364911781 4.555536364911781)

;Value: 1000.001660074894

;3 error> (expt 4.555538934848503 4.555538934848503)

;Value: 1000.0081269502568
