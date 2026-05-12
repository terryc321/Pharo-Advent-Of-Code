
(defparameter test-data 
  '((20151125  18749137  17289845  30943339  10071777  33511524 )
    (31916031  21629792  16929656   7726640  15514188   4041754 )
    (16080970   8057251   1601130   7981243  11661866  16474243 )
    (24592653  32451966  21345942   9380097  10600672  31527494 )
    (   77061  17552253  28094349   6899651   9250759  31663883 )
    (33071741   6796745  25397450  24659492   1534922  27995004 )))

(defun generate-tests ()
  (let (i j)
    (setq i 1)
    (loop for row in test-data do
      (setq j 1)
      ;;(format t "row is ~a~%" row)
      (loop for data in row do
	;;(format t "row ~a column ~a is ~a~%" i j data)
	(format t "self assert: (aoc computeRow: ~a column: ~a) equals: ~a.~%" i j data)
	(incf j))
      (incf i))))

#|
self assert: (aoc row: 1 column: 1) equals: 20151125.
self assert: (aoc row: 1 column: 2) equals: 18749137.
self assert: (aoc row: 1 column: 3) equals: 17289845.
self assert: (aoc row: 1 column: 4) equals: 30943339.
self assert: (aoc row: 1 column: 5) equals: 10071777.
self assert: (aoc row: 1 column: 6) equals: 33511524.
self assert: (aoc row: 2 column: 1) equals: 31916031.
self assert: (aoc row: 2 column: 2) equals: 21629792.
self assert: (aoc row: 2 column: 3) equals: 16929656.
self assert: (aoc row: 2 column: 4) equals: 7726640.
self assert: (aoc row: 2 column: 5) equals: 15514188.
self assert: (aoc row: 2 column: 6) equals: 4041754.
self assert: (aoc row: 3 column: 1) equals: 16080970.
self assert: (aoc row: 3 column: 2) equals: 8057251.
self assert: (aoc row: 3 column: 3) equals: 1601130.
self assert: (aoc row: 3 column: 4) equals: 7981243.
self assert: (aoc row: 3 column: 5) equals: 11661866.
self assert: (aoc row: 3 column: 6) equals: 16474243.
self assert: (aoc row: 4 column: 1) equals: 24592653.
self assert: (aoc row: 4 column: 2) equals: 32451966.
self assert: (aoc row: 4 column: 3) equals: 21345942.
self assert: (aoc row: 4 column: 4) equals: 9380097.
self assert: (aoc row: 4 column: 5) equals: 10600672.
self assert: (aoc row: 4 column: 6) equals: 31527494.
self assert: (aoc row: 5 column: 1) equals: 77061.
self assert: (aoc row: 5 column: 2) equals: 17552253.
self assert: (aoc row: 5 column: 3) equals: 28094349.
self assert: (aoc row: 5 column: 4) equals: 6899651.
self assert: (aoc row: 5 column: 5) equals: 9250759.
self assert: (aoc row: 5 column: 6) equals: 31663883.
self assert: (aoc row: 6 column: 1) equals: 33071741.
self assert: (aoc row: 6 column: 2) equals: 6796745.
self assert: (aoc row: 6 column: 3) equals: 25397450.
self assert: (aoc row: 6 column: 4) equals: 24659492.
self assert: (aoc row: 6 column: 5) equals: 1534922.
self assert: (aoc row: 6 column: 6) equals: 27995004.
|#
      

