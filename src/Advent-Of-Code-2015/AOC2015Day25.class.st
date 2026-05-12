"
need to memo it perhaps 


"
Class {
	#name : 'AOC2015Day25',
	#superclass : 'Object',
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'accessing' }
AOC2015Day25 >> bruteRow: r column: c [

"determine what value should be at row column "
|len row column val generator |
generator := self intGenerator .
len := 1.
row := 1.
column := 1.
[true] whileTrue:[
1 to: len do: [:n |
	n = 1 ifTrue:[ row := n . column := 1 ].
	val := generator next.
	(row = r and: [column = c]) ifTrue: [ ^ val  ]	.
	row := row - 1.
	column := column + 1.	
	].
 len := len + 1].


]

{ #category : 'accessing' }
AOC2015Day25 >> computeRow: row column: column [

	| count n generator |
	generator := self intGenerator.
	count := 1.
	n := 1.
	[
		1 to: n do: [ :x |
				| y val |
				y := n - x + 1.
				val := generator next.
				(row = y and: [column = x]) ifTrue: [^ val "{y . x . count . val}" ].
				count := count + 1 ].
		n := n + 1 ] repeat.
	

]

{ #category : 'accessing' }
AOC2015Day25 >> howto [ 
"aoc := AOC2015Day25 new.

r := 20151125.
n := 2015.
(n - 1) timesRepeat: [ 
      r := (aoc next: r)].
r


Transcript clear. 
aoc line: 2500.
aoc row:1 column: 2.

aoc part1. "
]

{ #category : 'accessing' }
AOC2015Day25 >> intGenerator [

	| intGenerator |
	intGenerator := Generator on: [ :generator |
			                | n multiplier divisor |
			                n := 20151125.
			                [
				                generator yield: n.
				                multiplier := 252533.
				                divisor := 33554393.
				                n := n * multiplier % divisor ] repeat "Creates an infinite sequence" ].
	^ intGenerator

	"Consume the lazy stream
pointGenerator next. ""Returns the first point (1@1)""
pointGenerator next. ""Returns the second point (2@4)""
pointGenerator next. ""Returns the third point (3@9)""
"
]

{ #category : 'accessing' }
AOC2015Day25 >> line: n [ 
|c|
c := 1.
1 to: n do: [:x |
	|y|
	y := n - x + 1.
	
	Transcript show: {x . y} printString ; show: ' ' .
	c := c + 1.
	].


	
	 

]

{ #category : 'accessing' }
AOC2015Day25 >> next: anInteger [ 

|previous result multiplier divisor|
previous := anInteger.
multiplier := 252533.
divisor := 33554393.
result := (previous * multiplier) % divisor.
^result 

]

{ #category : 'accessing' }
AOC2015Day25 >> oldrow: r column: c [

"determine what value should be at row column "
|len row column val generator |
generator := self intGenerator .
len := 1.
row := 1.
column := 1.
[true] whileTrue:[
1 to: len do: [:n |
	n = 1 ifTrue:[ row := n . column := 1 ].
	val := generator next.
	(row = r and: [column = c]) ifTrue: [ ^ val  ]	.
	row := row - 1.
	column := column + 1.	
	].
 len := len + 1].


]

{ #category : 'accessing' }
AOC2015Day25 >> part1 [ 
[
|result|
Transcript show: '*** AOC2015Day25 ***' ; cr. 
Transcript show: '*** computing for row 3010 and column 3019 ***' ; cr. 
Transcript show: 'AOC start time is ' ; show: (Time now print24) ; cr. 
result:= self computeRow: 3010 column: 3019.
Transcript show: 'result => ' ; show: result printString ; cr.
Transcript show: 'AOC finish time is ' ; show: (Time now print24) ; cr. 
	] forkAt: Processor userBackgroundPriority named: 'advent-code-2015-day-25-brute-force'.


]

{ #category : 'accessing' }
AOC2015Day25 >> row: row column: column [

	| count n |
	count := 1.
	n := 1.
	[
		1 to: n do: [ :x |
				| y |
				y := n - x + 1.
				(row = y and: [column = x]) ifTrue: [^ {y . x . count}].
				count := count + 1 ].
		n := n + 1 ] repeat.
	

]
