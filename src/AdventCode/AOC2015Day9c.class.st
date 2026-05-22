Class {
	#name : 'AOC2015Day9c',
	#superclass : 'Object',
	#instVars : [
		'paths',
		'best',
		'towns',
		'distances',
		'triples',
		'townDictionary'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day9c >> initialize [
"make a new"
best := 999999999999999999. "some arbitrarily large value"
paths := OrderedCollection new.
self makeTownTriples.
self makeDistances.


]

{ #category : 'accessing' }
AOC2015Day9c >> inputFile [
"get input file"
^ (AdventRepository repoDir / '2015' / 'day9'  / 'input.txt') readStreamDo: [:stream | stream contents].
]

{ #category : 'accessing' }
AOC2015Day9c >> inputLines [
"the lines of input split on linefeed"
^ self inputFile splitOn: (String lf)
]

{ #category : 'accessing' }
AOC2015Day9c >> makeDistances [
	"assign a unique integer to each town
make a two dimensional collection
iterate over triples - retrieve index town A , index town B , distance insert into 2d collection
triple is a / b / distance-a-to-b
"

	townDictionary := Dictionary new.

	1 to: towns size do: [ :n | townDictionary at: (towns at: n) put: n ].

	distances := OrderedCollection new: towns size withAll: nil.
	1
		to: distances size
		do: [ :n | distances at: n put: (OrderedCollection new: distances size withAll: nil) ].

	triples
		do: [ :triple | 
			| townA townB distance indexA indexB |
			townA := triple at: 1.
			townB := triple at: 2.
			distance := triple at: 3.
			indexA := townDictionary at: townA.
			indexB := townDictionary at: townB.
			(distances at: indexA) at: indexB put: distance.
			(distances at: indexB) at: indexA put: distance ].
	^ distances
]

{ #category : 'accessing' }
AOC2015Day9c >> makeTownTriples [
	| lines lines2 lines3 |
	"a triple townA townB and distance between them"
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

{ #category : 'as yet unclassified' }
AOC2015Day9c >> recurse: set at: here dist: d path: path [
	| choices |
	set isEmpty	ifTrue: [ 
	(d > best) ifTrue: [ paths := OrderedCollection new].
	(d >= best) ifTrue: [ best := d.
					        Transcript show: 'equal best found ';show: best;show: path ;cr.
						      paths add: path  ].
	].
	"choices still to be made"	
	choices := set asOrderedCollection.
	choices
		do: [ :choice | 
			| extra newSet p |
			newSet := set copy.
			newSet remove: choice.
			extra := (distances at: here) at: choice.			
			Processor yield.
			p := path copy.
			p add: { choice . (towns at: choice) . d . extra . (d + extra) }.
			self recurse: newSet at: choice dist: d + extra	path: p].
			

]

{ #category : 'as yet unclassified' }
AOC2015Day9c >> run [
"this is first entryt point"
	| ntowns |
	best := 0 .
	Transcript clear.
	Transcript show: 'starting run ....';	cr.
	ntowns := (1 to: towns size).
	ntowns do:[ :i | 
		| p |
		p := OrderedCollection new.
      p add: { i . (towns at: i) . 0 . 0 . 0 }.	         
	   self recurse: ((ntowns reject: [:e | e = i]) asSet) at: i dist: 0 path: p ].
	Transcript show: 'finished now .....'; cr.
]

{ #category : 'as yet unclassified' }
AOC2015Day9c >> towns [
"a selector we cannot delete for some reason"
^ towns
]
