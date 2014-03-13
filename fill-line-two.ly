#(define-markup-command (fill-line-two layout props args)
   (markup-list?)
   #:category align
   #:properties ((text-direction RIGHT)
                 (word-space 0.6)
                 (line-width #f))
   (let* ((orig-stencils (interpret-markup-list layout props args))
          (stencils
           (map (lambda (stc)
                  (if (ly:stencil-empty? stc)
                      point-stencil
                      stc)) orig-stencils))
          (text-widths
           (map (lambda (stc)
                  (if (ly:stencil-empty? stc)
                      0.0
                      (interval-length (ly:stencil-extent stc X))))
             stencils))
          (text-width (apply + text-widths))
          (word-count (length stencils))
          (line-width (or line-width (ly:output-def-lookup layout 'line-width)))
          (fill-space
           (cond
            ((= word-count 1)
             (list
              (/ (- line-width text-width) 2)
              (/ (- line-width text-width) 2)))
            ((= word-count 2)
             (list
              (- line-width text-width)))
            (else
             (make-list
               (1- word-count) 
               (/ (- line-width text-width) (1- word-count))))))
          
          (line-contents (if (= word-count 1)
                             (list
                              point-stencil
                              (car stencils)
                              point-stencil)
                             stencils)))
     
     (if (null? (remove ly:stencil-empty? orig-stencils))
         empty-stencil
         (begin
          (if (= text-direction LEFT)
              (set! line-contents (reverse line-contents)))
          (set! line-contents
                (stack-stencils-padding-list
                 X RIGHT fill-space line-contents))
          (if (> word-count 1)
              ;; shift s.t. stencils align on the left edge, even if
              ;; first stencil had negative X-extent (e.g. center-column)
              ;; (if word-count = 1, X-extents are already normalized in
              ;; the definition of line-contents)
              (set! line-contents
                    (ly:stencil-translate-axis
                     line-contents
                     (- (car (ly:stencil-extent (car stencils) X)))
                     X)))
          line-contents))))