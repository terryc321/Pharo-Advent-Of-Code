Class {
	#name : 'AOC2015Day9a',
	#superclass : 'Object',
	#instVars : [
		'paths',
		'best',
		'towns',
		'distances',
		'triples',
		'townDictionary'
	],
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'as yet unclassified' }
AOC2015Day9a >> distances [
^ distances
]

{ #category : 'as yet unclassified' }
AOC2015Day9a >> initialize [
best := 999999999999999999. "some arbitrarily large value"
paths := OrderedCollection new.
self makeTownTriples.
self makeDistances.


]

{ #category : 'accessing' }
AOC2015Day9a >> inputFile [
^ (AdventRepository repoDir / '2015' / 'day9'  / 'input.txt') readStreamDo: [:stream | stream contents].
]

{ #category : 'accessing' }
AOC2015Day9a >> inputLines [
^ self inputFile splitOn: (String lf)
]

{ #category : 'accessing' }
AOC2015Day9a >> makeDistances [
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
AOC2015Day9a >> makeTownTriples [
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
AOC2015Day9a >> puzzleInput [ 
^ ''.

]

{ #category : 'as yet unclassified' }
AOC2015Day9a >> puzzleInputParsed [
	"parsed input goes here"
	^ self notYetImplemented 
	
	
]

{ #category : 'as yet unclassified' }
AOC2015Day9a >> puzzlePart1 [	
^ ' 
'

]

{ #category : 'as yet unclassified' }
AOC2015Day9a >> puzzlePart2 [	
^ ' 

'

]

{ #category : 'as yet unclassified' }
AOC2015Day9a >> recurse2: set at: here dist: d [
	| choices |
	"curtail search if exceed best found so far"
	d > best ifTrue: [ ^ #toofar ].

"	Transcript		show: 'set=>';		show: set;		cr."
	set isEmpty
		ifTrue: [ 
		  "not a salesman problem just a one way trip"
			"tot := d + ((distances at: here) at: 1)."			
			d < best
				ifTrue: [ best := d.
					Transcript
						show: 'new best found ';
						show: best;
						cr ] ].	"otherwise pick one from set and keep recurse"
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
				dist: d + extra ]	"
we start at location 1 .
if collection size is zero - we have exhausted all our choices
"
]

{ #category : 'as yet unclassified' }
AOC2015Day9a >> recurse2: set at: here dist: d path: aCollection [
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
				recurse2: newSet
				at: choice
				dist: d + extra
				path: [| p | 
				   p := aCollection copy.
				   p add: { choice . (towns at: choice) . d . extra . (d + extra)}.
				   p ] value].	
				  "
we start at location 1 .
if collection size is zero - we have exhausted all our choices
"
]

{ #category : 'as yet unclassified' }
AOC2015Day9a >> recurse: set at: here dist: d [
	| choices |
	"curtail search if exceed best found so far"
	d > best ifTrue: [ ^ #toofar ].

"	Transcript		show: 'set=>';		show: set;		cr."
	set isEmpty
		ifTrue: [ 
		  "not a salesman problem just a one way trip"
			"tot := d + ((distances at: here) at: 1)."			
			d < best
				ifTrue: [ best := d.
					Transcript
						show: 'new best found ';
						show: best;
						cr ] ].	"otherwise pick one from set and keep recurse"
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
				dist: d + extra ]	"
we start at location 1 .
if collection size is zero - we have exhausted all our choices
"
]

{ #category : 'as yet unclassified' }
AOC2015Day9a >> run [
	| ntowns |
	Transcript clear.
	Transcript show: 'starting run ....';	cr.
	ntowns := (1 to: towns size).
	ntowns do:[ :i | 
	   self recurse: ((ntowns reject: [:e | e = i]) asSet) at: i dist: 0.
	].
	Transcript
		show: 'finished now .....'; cr
]

{ #category : 'as yet unclassified' }
AOC2015Day9a >> run2 [
	| ntowns |
	Transcript clear.
	Transcript show: 'starting run ....';	cr.
	ntowns := (1 to: towns size).
	ntowns do:[ :i | 
	   self 
	   recurse2: ((ntowns reject: [:e | e = i]) asSet) 
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
AOC2015Day9a >> run2Comment [
" 
want record towns so we need to print path 
"
]

{ #category : 'as yet unclassified' }
AOC2015Day9a >> runComment [
" 
really tricky to get this run method to work , 
got stuck on pharo langauge - expected a boolean on reject - probably missing
closing bracket before asSet?
	ntowns do:[ :i | 
	   self recurse: ((ntowns reject: [:e | e = i]) asSet) at: i dist: 0.
	].
	originally only used location 1 as starting point - but needed to use all the locations as the starting point - can we decipher what the winning towns choice was ?
"
]

{ #category : 'as yet unclassified' }
AOC2015Day9a >> solution1Part1 [

	^ self notYetImplemented
]

{ #category : 'as yet unclassified' }
AOC2015Day9a >> solution1Part2 [

	^ self notYetImplemented
]

{ #category : 'as yet unclassified' }
AOC2015Day9a >> towns [
^ towns
]

{ #category : 'as yet unclassified' }
AOC2015Day9a >> triples [
^ triples
]
