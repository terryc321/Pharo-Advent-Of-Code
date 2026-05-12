Class {
	#name : 'AOC2015Day25Test',
	#superclass : 'TestCase',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'tests' }
AOC2015Day25Test >> testAllRowColumnTable [
|aoc gen|
aoc := AOC2015Day25 new.
gen := aoc intGenerator.
self assert: (aoc computeRow: 1 column: 1) equals: 20151125.
self assert: (aoc computeRow: 1 column: 2) equals: 18749137.
self assert: (aoc computeRow: 1 column: 3) equals: 17289845.
self assert: (aoc computeRow: 1 column: 4) equals: 30943339.
self assert: (aoc computeRow: 1 column: 5) equals: 10071777.
self assert: (aoc computeRow: 1 column: 6) equals: 33511524.
self assert: (aoc computeRow: 2 column: 1) equals: 31916031.
self assert: (aoc computeRow: 2 column: 2) equals: 21629792.
self assert: (aoc computeRow: 2 column: 3) equals: 16929656.
self assert: (aoc computeRow: 2 column: 4) equals: 7726640.
self assert: (aoc computeRow: 2 column: 5) equals: 15514188.
self assert: (aoc computeRow: 2 column: 6) equals: 4041754.
self assert: (aoc computeRow: 3 column: 1) equals: 16080970.
self assert: (aoc computeRow: 3 column: 2) equals: 8057251.
self assert: (aoc computeRow: 3 column: 3) equals: 1601130.
self assert: (aoc computeRow: 3 column: 4) equals: 7981243.
self assert: (aoc computeRow: 3 column: 5) equals: 11661866.
self assert: (aoc computeRow: 3 column: 6) equals: 16474243.
self assert: (aoc computeRow: 4 column: 1) equals: 24592653.
self assert: (aoc computeRow: 4 column: 2) equals: 32451966.
self assert: (aoc computeRow: 4 column: 3) equals: 21345942.
self assert: (aoc computeRow: 4 column: 4) equals: 9380097.
self assert: (aoc computeRow: 4 column: 5) equals: 10600672.
self assert: (aoc computeRow: 4 column: 6) equals: 31527494.
self assert: (aoc computeRow: 5 column: 1) equals: 77061.
self assert: (aoc computeRow: 5 column: 2) equals: 17552253.
self assert: (aoc computeRow: 5 column: 3) equals: 28094349.
self assert: (aoc computeRow: 5 column: 4) equals: 6899651.
self assert: (aoc computeRow: 5 column: 5) equals: 9250759.
self assert: (aoc computeRow: 5 column: 6) equals: 31663883.
self assert: (aoc computeRow: 6 column: 1) equals: 33071741.
self assert: (aoc computeRow: 6 column: 2) equals: 6796745.
self assert: (aoc computeRow: 6 column: 3) equals: 25397450.
self assert: (aoc computeRow: 6 column: 4) equals: 24659492.
self assert: (aoc computeRow: 6 column: 5) equals: 1534922.
self assert: (aoc computeRow: 6 column: 6) equals: 27995004.
]

{ #category : 'tests' }
AOC2015Day25Test >> testComputeRowColumnOne [
"test how many iterations of algorithm required if calculated in order
1st iteration just returns initial starting value
"
|aoc |
aoc := AOC2015Day25 new.
self assert: (aoc computeRow: 1 column: 1) equals: 20151125.





]

{ #category : 'tests' }
AOC2015Day25Test >> testComputeRowColumnTwo [
"test how many iterations of algorithm required if calculated in order
1st iteration just returns initial starting value
"
|aoc |
aoc := AOC2015Day25 new.
self assert: (aoc computeRow: 2 column: 1) equals: 31916031 .





]

{ #category : 'tests' }
AOC2015Day25Test >> testF1 [
|aoc gen|
aoc := AOC2015Day25 new.
gen := aoc intGenerator.
self assert: (gen next) equals: 20151125




]

{ #category : 'tests' }
AOC2015Day25Test >> testF2 [
|aoc gen|
aoc := AOC2015Day25 new.
gen := aoc intGenerator.
gen next.
self assert: (gen next) equals: 31916031




]

{ #category : 'tests' }
AOC2015Day25Test >> testRowColumnOne [
"test how many iterations of algorithm required if calculated in order
1st iteration just returns initial starting value
"
|aoc |
aoc := AOC2015Day25 new.
self assert: (aoc row: 1 column: 1) equals: { 1 . 1 . 1 }.





]

{ #category : 'tests' }
AOC2015Day25Test >> testRowColumnThree [
|aoc |
aoc := AOC2015Day25 new.
self assert: (aoc row: 3 column: 1) equals: { 3 . 1 . 4 }.
self assert: (aoc row: 2 column: 2) equals: { 2 . 2 . 5 }.
self assert: (aoc row: 1 column: 3) equals: { 1 . 3 . 6 }.





]

{ #category : 'tests' }
AOC2015Day25Test >> testRowColumnTwo [
|aoc |
aoc := AOC2015Day25 new.
self assert: (aoc row: 2 column: 1) equals: { 2 . 1 . 2 }.
self assert: (aoc row: 1 column: 2) equals: { 1 . 2 . 3 }.





]
