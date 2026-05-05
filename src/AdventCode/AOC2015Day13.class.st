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
AOC2015Day13 >> cost: aDict order: anOrd [
"determine cost of placing people in this order - determine pairs and sum costs"
| pairs cost |
cost := 0.
pairs := self makePairs: anOrd.
pairs do: [:aPair | 
 | whoA whoB |
 whoA := aPair at: 1 .
 whoB := aPair at: 2 .
 cost := cost + (((aDict at: #connections) at: whoA) at: whoB).
 ].
^ { pairs . cost }

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
	                    (connections at: whoB ) at: whoA put: val .
                     ] 
             ifFalse: [ (connections at: whoA) at: whoB put: (0 - val).
                        (connections at: whoB) at: whoA put: (0 - val).
                       ].
].
result at: #people put: people.
result at: #connections put: connections.
^ result.
]

{ #category : 'as yet unclassified' }
AOC2015Day13 >> tryCombinations: dict [
| people |
best := 9999999999999.
people := OrderedCollection new.
(dict at: #people) do: [: each | people add: each].
self tryRecur: dict avail: people chosen: (OrderedCollection new).

]

{ #category : 'as yet unclassified' }
AOC2015Day13 >> tryRecur: dict avail: aColl chosen: aColl2 [
aColl isEmpty ifTrue:[ 
| cost |
 cost := self cost: dict order: aColl2.
 (cost at: 2) < best ifTrue: [ 
     best := cost at: 2.
     Transcript show: 'best so far => ' ; show: best ; show: '<=' ; show: aColl2 ; cr .
     Transcript show: 'cost => ' ; show: cost ; cr.
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
