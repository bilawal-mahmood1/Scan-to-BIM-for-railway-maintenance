(defun c:cPoly (/ ent1 ent2 i len pt p1 dist)
  (vl-load-com)

  (setq ent1 (car (entsel "\nSelect First Polyline: ")))
  (if (and ent1 (wcmatch (cdr (assoc 0 (entget ent1))) "*POLYLINE"))
    (progn
      (setq ent2 (car (entsel "\nSelect Second Polyline: ")))
      (if (and ent2 (wcmatch (cdr (assoc 0 (entget ent2))) "*POLYLINE"))
        (progn
          (setq i -1
                len (/ (vla-get-Length (vlax-ename->vla-object ent1)) 100.)
                dist 0.0) ; Initialize distance variable

          (while (setq pt (vlax-curve-getPointatDist ent1 (* (setq i (1+ i)) len)))
            (setq p1 (vlax-curve-getClosestPointto ent2 pt t)
                  dist (distance pt p1)) ; Assign the distance to 'dist' variable
            
            (prompt (strcat "\nSelected point: " (rtos (car pt) 2) ", " (rtos (cadr pt) 2)))
            (prompt (strcat "\nCalculated distance: " (rtos dist 2)))
          )

          (princ "\nFinished calculating distances.\n")
        )
        (princ "\nSecond selection is not a polyline.\n")
      )
    )
    (princ "\nFirst selection is not a polyline.\n")
  )
)
