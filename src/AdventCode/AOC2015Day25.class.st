Class {
	#name : 'AOC2015Day25',
	#superclass : 'Object',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

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
AOC2015Day25 >> next: anInteger [ 

|previous result multiplier divisor|
previous := anInteger.
multiplier := 252533.
divisor := 33554393.
result := (previous * multiplier) % divisor.
^result 

]

{ #category : 'accessing' }
AOC2015Day25 >> part1 [ 

"7,1 comes after 1,6"

^ (33511524 * 252533) % 33554393 .
]

{ #category : 'accessing' }
AOC2015Day25 >> row: r column: c [

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
	]].


]
