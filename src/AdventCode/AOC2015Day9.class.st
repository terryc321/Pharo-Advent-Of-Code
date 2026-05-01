Class {
	#name : 'AOC2015Day9',
	#superclass : 'Object',
	#instVars : [
		'towns',
		'distances',
		'triples',
		'townDictionary'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day9 >> distances [
^ distances
]

{ #category : 'as yet unclassified' }
AOC2015Day9 >> initialize [

]

{ #category : 'accessing' }
AOC2015Day9 >> inputFile [
^ (AdventRepository repoDir / '2015' / 'day9'  / 'input.txt') readStreamDo: [:stream | stream contents].
]

{ #category : 'accessing' }
AOC2015Day9 >> inputLines [
^ self inputFile splitOn: (String lf)
]

{ #category : 'accessing' }
AOC2015Day9 >> makeDistances [
"
assign a unique integer to each town
make a two dimensional collection
iterate over triples - retrieve index town A , index town B , distance insert into 2d collection
triple is a / b / distance-a-to-b
"
townDictionary := Dictionary new.

1 to: towns size do:[:n | townDictionary at: (towns at: n) put: n ]. 

distances := OrderedCollection new: (towns size).
1 to: distances size do: [:n | distances  at: n put: (OrderedCollection new: distances size)].

triples do: [:triple | 
 |  townA townB distance indexA indexB|
 townA := triple at: 1 . 
 townB := triple at: 2 .
 distance := triple at: 3. 
 indexA := townDictionary at: townA.
 indexB := townDictionary at: townB.
 (distances at: indexA) at: indexB put: distance.
 (distances at: indexB) at: indexA put: distance.
 ].
 ^ distances
]

{ #category : 'accessing' }
AOC2015Day9 >> makeTownTriples [
	| lines lines2 lines3 |
	towns := Set new.
	lines := self inputLines.
	lines2 := lines reject: [ :line | line = '' ].
	lines3 := lines2 collect: [ :line | line splitOn: String space ].
	triples := lines3
			collect: [ :ord | 
				| s t v triple |
				triple := OrderedCollection new.
				s := (ord at: 1) asSymbol.
				t := (ord at: 3) asSymbol.
				v := (ord at: 5) asInteger.
				triple add: s.
				triple add: t.
				triple add: v.
				towns add: s.
				towns add: t.
				triple ].
				"convert a set to an ordered list "
		towns := towns asOrderedCollection.

	
]

{ #category : 'accessing' }
AOC2015Day9 >> privateMakeDistances [
"a dictionary of dictionaries"
| top |
top := Dictionary new.
towns do:[:town |
	top at: town put: (Dictionary new)
].
towns do: [:triple | "a / b / distance-a-to-b"
 |  a b dist |
 a := triple at: 1 . 
 b := triple at: 2 .
 dist := triple at: 3. 
 (top at: a) at: b put: dist.
 (top at: b) at: a put: dist.
 ].
distances:= top.
]

{ #category : 'accessing' }
AOC2015Day9 >> puzzleInput [ 
^ ''.

]

{ #category : 'as yet unclassified' }
AOC2015Day9 >> puzzleInputParsed [
	"parsed input goes here"
	^ self notYetImplemented 
	
	
]

{ #category : 'as yet unclassified' }
AOC2015Day9 >> puzzlePart1 [	
^ ' 
'

]

{ #category : 'as yet unclassified' }
AOC2015Day9 >> puzzlePart2 [	
^ ' 

'

]

{ #category : 'as yet unclassified' }
AOC2015Day9 >> solution1Part1 [

	^ self notYetImplemented
]

{ #category : 'as yet unclassified' }
AOC2015Day9 >> solution1Part2 [

	^ self notYetImplemented
]

{ #category : 'as yet unclassified' }
AOC2015Day9 >> towns [
^ towns
]

{ #category : 'as yet unclassified' }
AOC2015Day9 >> triples [
^ triples
]
