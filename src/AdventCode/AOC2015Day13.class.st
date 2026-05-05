Class {
	#name : 'AOC2015Day13',
	#superclass : 'Object',
	#instVars : [
		'best'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day13 >> best [
^ best
]

{ #category : 'as yet unclassified' }
AOC2015Day13 >> cost: aDict order: aCollection [
	| tot a b |
	tot := 0.
	1 to: aCollection size do: [ :i |
		| left right localLeft localRight me|
		left := i - 1.
		right := i + 1.
		left < 1 ifTrue: [ left := aCollection size ].
		right > aCollection size ifTrue: [ right := 1  ].
		a := aCollection at: left.
		b := aCollection at: right.
		me := aCollection at: i .	
		localLeft := (((aDict at: #connections) at: me) at: a).
		localRight := (((aDict at: #connections) at: me) at: b).
		tot := tot + localLeft.
		tot := tot + localRight.
							 ].
	^ tot

]

{ #category : 'accessing' }
AOC2015Day13 >> example [
^ 'Alice would gain 54 happiness units by sitting next to Bob.
Alice would lose 79 happiness units by sitting next to Carol.
Alice would lose 2 happiness units by sitting next to David.
Bob would gain 83 happiness units by sitting next to Alice.
Bob would lose 7 happiness units by sitting next to Carol.
Bob would lose 63 happiness units by sitting next to David.
Carol would lose 62 happiness units by sitting next to Alice.
Carol would gain 60 happiness units by sitting next to Bob.
Carol would gain 55 happiness units by sitting next to David.
David would gain 46 happiness units by sitting next to Alice.
David would lose 7 happiness units by sitting next to Bob.
David would gain 41 happiness units by sitting next to Carol.'
]

{ #category : 'as yet unclassified' }
AOC2015Day13 >> input [
^ 'Alice would lose 57 happiness units by sitting next to Bob.
Alice would lose 62 happiness units by sitting next to Carol.
Alice would lose 75 happiness units by sitting next to David.
Alice would gain 71 happiness units by sitting next to Eric.
Alice would lose 22 happiness units by sitting next to Frank.
Alice would lose 23 happiness units by sitting next to George.
Alice would lose 76 happiness units by sitting next to Mallory.
Bob would lose 14 happiness units by sitting next to Alice.
Bob would gain 48 happiness units by sitting next to Carol.
Bob would gain 89 happiness units by sitting next to David.
Bob would gain 86 happiness units by sitting next to Eric.
Bob would lose 2 happiness units by sitting next to Frank.
Bob would gain 27 happiness units by sitting next to George.
Bob would gain 19 happiness units by sitting next to Mallory.
Carol would gain 37 happiness units by sitting next to Alice.
Carol would gain 45 happiness units by sitting next to Bob.
Carol would gain 24 happiness units by sitting next to David.
Carol would gain 5 happiness units by sitting next to Eric.
Carol would lose 68 happiness units by sitting next to Frank.
Carol would lose 25 happiness units by sitting next to George.
Carol would gain 30 happiness units by sitting next to Mallory.
David would lose 51 happiness units by sitting next to Alice.
David would gain 34 happiness units by sitting next to Bob.
David would gain 99 happiness units by sitting next to Carol.
David would gain 91 happiness units by sitting next to Eric.
David would lose 38 happiness units by sitting next to Frank.
David would gain 60 happiness units by sitting next to George.
David would lose 63 happiness units by sitting next to Mallory.
Eric would gain 23 happiness units by sitting next to Alice.
Eric would lose 69 happiness units by sitting next to Bob.
Eric would lose 33 happiness units by sitting next to Carol.
Eric would lose 47 happiness units by sitting next to David.
Eric would gain 75 happiness units by sitting next to Frank.
Eric would gain 82 happiness units by sitting next to George.
Eric would gain 13 happiness units by sitting next to Mallory.
Frank would gain 77 happiness units by sitting next to Alice.
Frank would gain 27 happiness units by sitting next to Bob.
Frank would lose 87 happiness units by sitting next to Carol.
Frank would gain 74 happiness units by sitting next to David.
Frank would lose 41 happiness units by sitting next to Eric.
Frank would lose 99 happiness units by sitting next to George.
Frank would gain 26 happiness units by sitting next to Mallory.
George would lose 63 happiness units by sitting next to Alice.
George would lose 51 happiness units by sitting next to Bob.
George would lose 60 happiness units by sitting next to Carol.
George would gain 30 happiness units by sitting next to David.
George would lose 100 happiness units by sitting next to Eric.
George would lose 63 happiness units by sitting next to Frank.
George would gain 57 happiness units by sitting next to Mallory.
Mallory would lose 71 happiness units by sitting next to Alice.
Mallory would lose 28 happiness units by sitting next to Bob.
Mallory would lose 10 happiness units by sitting next to Carol.
Mallory would gain 44 happiness units by sitting next to David.
Mallory would gain 22 happiness units by sitting next to Eric.
Mallory would gain 79 happiness units by sitting next to Frank.
Mallory would lose 16 happiness units by sitting next to George.'
]

{ #category : 'as yet unclassified' }
AOC2015Day13 >> makePairs: anOrd [
| pairs |
pairs := OrderedCollection new.
1 to: anOrd size do:[:i |
 (i + 1) to: anOrd size do: [: j |
    pairs add: {anOrd at:i . anOrd at: j}.
    pairs add: {anOrd at:j . anOrd at: i}.
    ]].
pairs add: {anOrd at: 1 . anOrd at: anOrd size}.
pairs add: {anOrd at: anOrd size . anOrd at: 1}.    
^ pairs.   

]

{ #category : 'as yet unclassified' }
AOC2015Day13 >> parse: s [
| lines lines2 lines3 people connections result|
people := Set new.
result := Dictionary new.
lines := s splitOn: Character lf.
connections := Dictionary new.
lines do: [:line | 
 |split whoA whoB gL val |
 split := line splitOn: Character space.
 whoA := (split at: 1) asSymbol.
 whoB := ((split at: 11) allButLast) asSymbol.
 people add: whoA.
 people add: whoB. 
 connections at: whoA ifAbsent: [ connections at: whoA put: (Dictionary new) ].
 connections at: whoB ifAbsent: [ connections at: whoB put: (Dictionary new) ].
 val := (split at: 4) asInteger.
 gL := (split at: 3).
 gL = 'gain' ifTrue:[ (connections at: whoA ) at: whoB put: val .	                    
                     ] 
             ifFalse: [ (connections at: whoA) at: whoB put: (0 - val).                       
                       ].
].
result at: #people put: people.
result at: #connections put: connections.
^ result.
]

{ #category : 'as yet unclassified' }
AOC2015Day13 >> part1 [
| dict |
best := 0.
dict := self parse: (self input).
self tryCombinations: dict.
]

{ #category : 'as yet unclassified' }
AOC2015Day13 >> tryCombinations: dict [
| people |
best := 0.
people := OrderedCollection new.
(dict at: #people) do: [: each | people add: each].
self tryRecur: dict avail: people chosen: (OrderedCollection new).

]

{ #category : 'as yet unclassified' }
AOC2015Day13 >> tryRecur: dict avail: aColl chosen: aColl2 [
aColl isEmpty ifTrue:[ 
| cost |
 cost := self cost: dict order: aColl2. 
 cost > best ifTrue: [ 
     best := cost.
     Transcript show: 'best so far => ' ; show: best ; show: '<=' ; show: aColl2 ; cr .
  ].
 ]
 ifFalse: [ 
   aColl do: [:each | 
    | newAColl2 |
    newAColl2 := aColl2 copy.
    newAColl2 add: each.
    self tryRecur: dict avail: (aColl reject: [:e | e = each]) chosen: newAColl2.
   ]
 ]

]
