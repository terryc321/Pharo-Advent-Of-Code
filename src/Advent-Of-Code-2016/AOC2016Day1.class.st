Class {
	#name : 'AOC2016Day1',
	#superclass : 'Object',
	#instVars : [
		'visited'
	],
	#category : 'Advent-Of-Code-2016',
	#package : 'Advent-Of-Code-2016'
}

{ #category : 'execution' }
AOC2016Day1 >> execute: aCollection [
	"initially face north"

	| direction position |
	direction := #north.
	position := 0 @ 0.
	aCollection do: [ :turndist |
			| turn dist |
			turn := turndist at: 1.
			dist := turndist at: 2.
			turn = #left
				ifTrue: [ direction := self leftTurn: direction ]
				ifFalse: [ direction := self rightTurn: direction ].
			position := self
				            forward: position
				            direction: direction
				            distance: dist ].
	^ {
		  position.
		  (position x abs) + (position y abs) }
]

{ #category : 'execution' }
AOC2016Day1 >> executeBunny: aCollection [
	"initially face north"
	| direction position |
	self shouldNotImplement . "this all needs a rewrite - see AOC2016Day1Robot uses mutation though ?"
	visited := Dictionary new.
	direction := #north.
	position := 0 @ 0.
	aCollection do: [ :turndist |
			| turn dist |
			turn := turndist at: 1.
			dist := turndist at: 2.
			turn = #left
				ifTrue: [ direction := self leftTurn: direction ]
				ifFalse: [ direction := self rightTurn: direction ].
			position := self
				            forwardBunny: position
				            direction: direction
				            distance: dist ].
	^ {
		  position.
		  (position x abs) + (position y abs) }
]

{ #category : 'execution' }
AOC2016Day1 >> forward: position direction: direction distance: distance [
| here x y|
here := position.
"1 to: distance do: ["
"	| x y |"
	x := here x.
	y := here y.
 direction = #north ifTrue: [ here := ((x)@(y + distance)) ] ifFalse:[
 direction = #south ifTrue: [ here := ((x)@(y- distance )) ] ifFalse:[
 direction = #east ifTrue: [ here := ((x+distance)@y)  ] ifFalse:[
 direction = #west ifTrue: [ here := ((x-distance)@y) ] ifFalse:[
	Error signal: 'bad direction'.]]]].
  "self registerVisited: here."
"]."
^ here.






]

{ #category : 'execution' }
AOC2016Day1 >> forwardBunny: position direction: direction distance: distance [

	| here |
	here := position.
	1 to: distance do: [ :d|
		  | x y |
			x := here x.
			y := here y.
			Transcript
				show: {
						'forward bunny x => '.
						x printString.
						' y=>'.
						y printString } ;
				cr.
			here := self forwardOneStep: direction position: here.
			self registerVisited: here ].
	^ here
]

{ #category : 'as yet unclassified' }
AOC2016Day1 >> forwardOneStep: aDirection position: aPosition [

	| x y |
	x := aPosition x.
	y := aPosition y.
	aDirection = #north ifTrue: [ ^ x @ (y + 1) ].
	aDirection = #south ifTrue: [ ^ x @ (y - 1) ].
	aDirection = #east ifTrue: [ ^ x + 1 @ y ].
	aDirection = #west ifTrue: [ ^ x - 1 @ y ].
	Error signal: 'bad direction'
]

{ #category : 'accessing' }
AOC2016Day1 >> input [ 
^ 'L1, R3, R1, L5, L2, L5, R4, L2, R2, R2, L2, R1, L5, R3, L4, L1, L2, R3, R5, L2, R5, L1, R2, L5, R4, R2, R2, L1, L1, R1, L3, L1, R1, L3, R5, R3, R3, L4, R4, L2, L4, R1, R1, L193, R2, L1, R54, R1, L1, R71, L4, R3, R191, R3, R2, L4, R3, R2, L2, L4, L5, R4, R1, L2, L2, L3, L2, L1, R4, R1, R5, R3, L5, R3, R4, L2, R3, L1, L3, L3, L5, L1, L3, L3, L1, R3, L3, L2, R1, L3, L1, R5, R4, R3, R2, R3, L1, L2, R4, L3, R1, L1, L1, R5, R2, R4, R5, L1, L1, R1, L2, L4, R3, L1, L3, R5, R4, R3, R3, L2, R2, L1, R4, R2, L3, L4, L2, R2, R2, L4, R3, R5, L2, R2, R4, R5, L2, L3, L2, R5, L4, L2, R3, L5, R2, L1, R1, R3, R3, L5, L2, L2, R5'


]

{ #category : 'turning' }
AOC2016Day1 >> leftTurn: direction [

	direction = #north ifTrue: [ ^ #west ].
	direction = #west ifTrue: [ ^ #south ].
	direction = #south ifTrue: [ ^ #east ].
	direction = #east ifTrue: [ ^ #north ]
]

{ #category : 'parsing' }
AOC2016Day1 >> parse: aString [

	| s |
	s := aString splitOn: ', '.
	^ s collect: [ :str |
			  | dir dist |
			  dir := (str at: 1) = $L
				         ifTrue: [ #left ]
				         ifFalse: [ #right ].
			  dist := str allButFirst asInteger.
			  {
				  dir.
				  dist } ]
]

{ #category : 'turning' }
AOC2016Day1 >> refreshInPlayground [
    self changed.          "notify dependents"
    "self inspectFresh."
    ^self.




]

{ #category : 'as yet unclassified' }
AOC2016Day1 >> registerVisited: aPosition [ 
"raise an exception - already visited here"
visited at: aPosition ifPresent: [ Error signal:{ aPosition . 'already visited'} ] ifAbsentPut: [ true ].


]

{ #category : 'turning' }
AOC2016Day1 >> rightTurn: direction [
 Transcript show: 'turn right' ; cr .
	direction = #north ifTrue: [ ^ #east ].
	direction = #west ifTrue: [ ^ #north ].
	direction = #south ifTrue: [ ^ #west ].
	direction = #east ifTrue: [ ^ #south ].
	

]
