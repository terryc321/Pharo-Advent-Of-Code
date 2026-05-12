Class {
	#name : 'AOC2015Day13Table',
	#superclass : 'Object',
	#instVars : [
		'people',
		'db',
		'comb'
	],
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'as yet unclassified' }
AOC2015Day13Table >> combinations [
^ comb 


]

{ #category : 'as yet unclassified' }
AOC2015Day13Table >> combinations: people [ 
comb := OrderedCollection new.
self combinationsRecur: people acc: (OrderedCollection new).
^ comb.


]

{ #category : 'as yet unclassified' }
AOC2015Day13Table >> combinationsRecur: people acc: acc [
 people isEmpty ifTrue:[ comb add: acc ]
 ifFalse:[ 
	people do: [ :person | 
		| acc2 |
		acc2 := acc copy.
		acc2 add: person.
		self combinationsRecur: (people reject:[:e | e = person]) acc: acc2.
		 ]].



]

{ #category : 'initialization' }
AOC2015Day13Table >> initialize [ 
db := Dictionary new.
db at: #alice put: Dictionary new.
db at: #bob put: Dictionary new.
db at: #carol put: Dictionary new.
db at: #david put: Dictionary new.

"Alice would gain 54 happiness units by sitting next to Bob.
Alice would lose 79 happiness units by sitting next to Carol.
Alice would lose 2 happiness units by sitting next to David."
(db at: #alice) at: #bob put: 54.
(db at: #alice) at: #carol put: -79.
(db at: #alice) at: #david put: -2.

"Bob would gain 83 happiness units by sitting next to Alice.
Bob would lose 7 happiness units by sitting next to Carol.
Bob would lose 63 happiness units by sitting next to David."
(db at: #bob) at: #alice put: 83.
(db at: #bob) at: #carol put: -7.
(db at: #bob) at: #david put: -63.

"Carol would lose 62 happiness units by sitting next to Alice.
Carol would gain 60 happiness units by sitting next to Bob.
Carol would gain 55 happiness units by sitting next to David."
(db at: #carol) at: #alice put: -62.
(db at: #carol) at: #bob put: 60.
(db at: #carol) at: #david put: 55.

"David would gain 46 happiness units by sitting next to Alice.
David would lose 7 happiness units by sitting next to Bob.
David would gain 41 happiness units by sitting next to Carol."
(db at: #david) at: #alice put: 46.
(db at: #david) at: #bob put: -7.
(db at: #david) at: #carol put: 41.



]

{ #category : 'as yet unclassified' }
AOC2015Day13Table >> score: aCollection [
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
		localLeft := (self scoreFor: me with: a) .
		localRight := (self scoreFor: me with: b) .
		tot := tot + localLeft.
		tot := tot + localRight.
	Transcript show: a ; show: ' with  ' ; show: b ; show: ' => ' ; show: localLeft ; show: ' :: '; show: localRight ; show: ' :: ' ; show: tot ; cr.
							 ].
	^ tot
]

{ #category : 'as yet unclassified' }
AOC2015Day13Table >> scoreFor: aPerson with: bPerson [
^ (db at: aPerson) at: bPerson


]
