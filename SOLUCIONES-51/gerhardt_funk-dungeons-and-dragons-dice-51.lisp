(define (avg d s)
  (/ (+ d (* s d)) 2))

(define poss
  (let ([ret '()])
    (for ([s (in-range 2 14 2)])
      (for ([d (in-range 1 6)])
        (set! ret (append ret (list (list (avg d s) (list d s)))))))
    ret))

(define (diffs num)
  (let ([ret '()])
    (for ([i (in-range 0 (length poss))])
      (set! ret (append ret (list (abs (- num (list-ref (list-ref poss i) 0)))))))
    ret))

(define (least ls)
  (let ([cur (car ls)] [ret 0])
    (for ([i (in-range 0 (length ls))])
      (cond [(< (list-ref ls i) cur)
             (set! ret i)
             (set! cur (list-ref ls i))]))
    ret))

(define (average ls)
  (let ([s 0])
    (for ([i (in-range 0 (length ls))])
      (set! s (+ s (list-ref ls i))))
    (/ s (- (length ls) 1))))

(define (ds ls)
  (list-ref (list-ref poss (least (diffs (average ls)))) 1))