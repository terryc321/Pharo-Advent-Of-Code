Class {
	#name : 'AOC2015Day9b',
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
AOC2015Day9b >> initialize [
best := 999999999999999999. "some arbitrarily large value"
paths := OrderedCollection new.
self makeTownTriples.
self makeDistances.


]

{ #category : 'accessing' }
AOC2015Day9b >> inputFile [
^ (AdventRepository repoDir / '2015' / 'day9'  / 'input.txt') readStreamDo: [:stream | stream contents].
]

{ #category : 'accessing' }
AOC2015Day9b >> inputLines [
^ self inputFile splitOn: (String lf)
]

{ #category : 'accessing' }
AOC2015Day9b >> makeDistances [
	"
assign a unique integer to each town
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
AOC2015Day9b >> makeTownTriples [
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

{ #category : 'as yet unclassified' }
AOC2015Day9b >> recurse: set at: here dist: d path: aCollection [
	| choices |
	"curtail search if exceed best found so far"
	d > best ifTrue: [ ^ #toofar ].

"	Transcript		show: 'set=>';		show: set;		cr."
	set isEmpty
		ifTrue: [ 
		  "not a salesman problem just a one way trip"
			"tot := d + ((distances at: here) at: 1)."			
			d < best ifTrue: [
			paths := OrderedCollection new.
			].
			d <= best
				ifTrue: [ best := d.
					Transcript
						show: 'equal best found ';
						show: best;
						show: aCollection ;
						cr.

						paths add: { aCollection } ].
						 ].	"otherwise pick one from set and keep recurse"
	choices := set asOrderedCollection.
	choices
		do: [ :choice | 
			| extra newSet |
			newSet := set copy.
			newSet remove: choice.
			extra := (distances at: here) at: choice.
			Processor yield.
			self
				recurse: newSet
				at: choice
				dist: d + extra
				path: [| p | 
				   p := aCollection copy.
				   p add: { choice . (towns at: choice) . d . extra . (d + extra)} ] value].	
				  "
we start at location 1 .
if collection size is zero - we have exhausted all our choices
"
]

{ #category : 'as yet unclassified' }
AOC2015Day9b >> run [
	| ntowns |
	Transcript clear.
	Transcript show: 'starting run ....';	cr.
	ntowns := (1 to: towns size).
	ntowns do:[ :i | 
	   self 
	   recurse: ((ntowns reject: [:e | e = i]) asSet) 
	   at: i 
	   dist: 0 
	   path: ([| p | 
	         p := OrderedCollection new.
	         p add: { i . (towns at: i) . 0 . 0 . 0 } ] value).
	].
	Transcript
		show: 'finished now .....'; cr
]

{ #category : 'as yet unclassified' }
AOC2015Day9b >> towns [
^ towns
]
