;;;;
;;;; W::wonderfully
;;;;

(define-words :pos W::adv :templ PRED-VP-TEMPL 
 :words (
	   (W::wonderfully
	  (SENSES
    ((lf-parent ont::great-val)
	    (TEMPL ADJ-OPERATOR-TEMPL)	    
	    (example "his ankles are wonderfully strong" "he is wonderfully healthy")
	    (SEM (f::gradability +) (f::orientation f::pos) (f::intensity f::hi))
	    (meta-data :origin cardiac :entry-date 20080613 :change-date nil :comments nil :wn nil)
	    )
    ((lf-parent ont::great-val)
	    (TEMPL PRED-VP-TEMPL)	    
	    (example "he performed wonderfully on the exam")
	    (SEM (f::gradability +) (f::orientation f::pos) (f::intensity f::hi))
	    (meta-data :origin cardiac :entry-date 20080613 :change-date nil :comments nil :wn nil)
	    )
	   )
	  )
))

