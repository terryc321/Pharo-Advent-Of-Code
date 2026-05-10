"
ideas

aha ! if all three bins of numbers must add up to the same - then each is one third the sum of the set of numbers
- first find a set of numbers that add up to 1/3 total
- take one of this set - and match it against another - where all numbers are distinct - if whats left is this 
automatically a known solution already ?


put lowest value into first group and fight over rest.
put moderately large singular value into first group and see about the rest .

if bins are orderedcollections then 
if bins are sets - more useful as numbers are not duplpicated ? maybe\




what is the puzzle ?

split a group of numbers into three groups equal weight 
first group has to have fewest possible number of parcels
first group has to have lowest possible product of their weights called entanglement

example group of numbers 1 through 5 and 7 through 11 
(1 to 11 except 6)

```
(1 to: 11) reject: [:e | e = 6].

""cannot multitask adding an item to a copied collection as returns only last item added""
| a b |
a := #(1 2 3) asOrderedCollection .
b := a copy.
b add: 4.
b yourself.

```

"
Class {
	#name : 'AOC2015Day24',
	#superclass : 'Object',
	#instVars : [
		'bins',
		'bin1size',
		'lowestWeight',
		'firstSet'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'as yet unclassified' }
AOC2015Day24 >> addsUpTo: aCollection [ 
| tot target | 
tot := aCollection inject: 0 into: [:acc :each | acc + each].
target := tot / 3 . 
Transcript show: 'target is ' ; show: target; cr.
Transcript show: 'collection is ' ; show: aCollection ; cr.
^ self addsUpToRecur: aCollection target: target sum:0 group: (Set new) .










]

{ #category : 'as yet unclassified' }
AOC2015Day24 >> addsUpTo: aCollection target: anInteger [
^ self addsUpToRecur: aCollection target: anInteger sum:0 group: (Set new) .








]

{ #category : 'as yet unclassified' }
AOC2015Day24 >> addsUpToRecur: col target: t sum: s group: set [
s = t ifTrue:[ firstSet add: set . 
	             Transcript show: set ; cr. 
	             ^ #ok ].
s > t ifTrue:[ ^ #tooBig ].
"if collection col is empty - it cant iterate over itself"
col do: [:n | 
	((n + s) <= t) ifTrue:[
		|col2|
		col2 := col copy.		
	Processor yield.
	   self addsUpToRecur: (col2 reject:[:e | e =n]) target:t sum: (n+s) group: ([|set2| set2 := set copy. set2 add: n . set2] value).
	]].
	




]

{ #category : 'accessing' }
AOC2015Day24 >> example [
"example puzzle input"
	^ (1 to: 11) reject: [:e | e = 6].

]

{ #category : 'accessing' }
AOC2015Day24 >> experiment [
|tot athird|
tot := (self example) inject: 0 into: [:acc :each | acc + each].
athird := tot/3 . 
^ {tot . athird } .

]

{ #category : 'accessing' }
AOC2015Day24 >> howTo [ 
"
day24 := AOC2015Day24 new.
day24 experiment.
day24 addsUpTo: (day24 example).

lets try entire input
day24 addsUpTo: (day24 input).


self sorted: [:a :b |  smallest set size of a < smallest set size of b ].


if want to fork it ... but didnt update transcript ?huh?
process := [ day24 addsUpTo: (day24 example) ] forkAt: Processor userBackgroundPriority.
process terminate.


day24 := AOC2015Day24 new.
day24 run: (day24 example).
day24 threeWays: (day24 example).

process := [ day24 addsUpTo: (day24 example) ] forkAt: Processor userBackgroundPriority.
process terminate.

smalltalk can compare Sets - containing sets and tell me if they are the same

s1 := Set new.
s1 add: 1 .
s1 add: 2 .
s1 add: 3 . 
s2 := Set new.
s2 add: 3.
s2 add: 2.
s2 add: 1.
s3 := Set new.
s3 add: s1.
s3 add: s2.


s4 := Set new.
s4 add: 1 .
s4 add: 2 .
s4 add: 3 . 
s5 := Set new.
s5 add: 3.
s5 add: 2.
s5 add: 1.
s6 := Set new.
s6 add: s1.
s6 add: s2.


set comparison 
A B C 
s1 := Set new.
s1 add: 1 .
s1 add: 2 .
s1 add: 3 . 
s2 := Set new.
s2 add: 3.
s2 add: 2.
s2 add: 1.
s1 = s2 


... some faulty logic here .
|smallestBin|
smallestBin := { b1 size . b2 size . b3 size } min.

reject if smallest bin size is too large than something already found
bin1size ifNotNil: [ (smallestBin > bin1size) ifTrue:[ ^ #nope ]]. 

"
]

{ #category : 'accessing' }
AOC2015Day24 >> initialize [ 
 bins := Set new.
 firstSet := Set new.
 









]

{ #category : 'accessing' }
AOC2015Day24 >> input [
"puzzle input"
	^ #( 1 3 5 11 13 17 19 23 29 31 41 43 47 53 59 61 67 71 73 79 83 89
	     97 101 103 107 109 113 )
]

{ #category : 'as yet unclassified' }
AOC2015Day24 >> possibleSolution: anArray [ 
| b1 b2 b3 w set |
"each bin is a set of numbers"
b1 := anArray at: 1.
b2 := anArray at: 2.
b3 := anArray at: 3.
w := anArray at: 4 .
set := Set new.
set add: b1.
set add: b2.
set add: b3.

"lowestWeight ifNil: [ lowestWeight := w ].
w < lowestWeight ifTrue: [
	bins := OrderedCollection new.
	bins add: anArray.
	lowestWeight := w .
	Transcript show: 'new best weight' ; show: anArray ; cr .
	^ #newBest 
	].
w > lowestWeight ifTrue:[ ^ #tooHeavy ].
"
(bins includes: set) ifTrue: [ ^ #alreadySeen ].

Transcript show: set ; cr.
bins add: set.




]

{ #category : 'running' }
AOC2015Day24 >> run: aCollection [

	| task |
	task := [ self threeWays: aCollection ] future.
	task onSuccessDo: [ :v | 'Finished' traceCr ].
	task onFailureDo: [ :error | 'Error occurred ' traceCr . error traceCr ]
]

{ #category : 'as yet unclassified' }
AOC2015Day24 >> threeWays: aCollection [ 
"three ways to organise a collection such that all groups have same weight"
|b1 b2 b3 |
bin1size := nil.
b1 := Set new.
b2 := Set new.
b3 := Set new.
self threeWaysRecur: aCollection bin1: b1 bin2: b2 bin3: b3 .
Transcript show: 'threeWays finished' ; cr. 

]

{ #category : 'as yet unclassified' }
AOC2015Day24 >> threeWaysRecur: aCollection bin1: b1 bin2: b2 bin3: b3 [ 

aCollection isEmpty ifTrue: [
	| weight1 weight2 weight3 |
	weight1 := b1 inject: 0 into: [:acc :each | acc + each].
	weight2 := b2 inject: 0 into: [:acc :each | acc + each].
	weight3 := b3 inject: 0 into: [:acc :each | acc + each].
	Processor yield.
	(weight1 = weight2 and: [weight2 = weight3]) 
	  ifTrue: [ self possibleSolution: {b1 . b2 . b3 . weight1 } . 		         
		         ^ #done] 
	  ifFalse: [^ #nope ]].
"keep searching"
aCollection do: [:box |
	| rj bc1 bc2 bc3 |
	rj := aCollection reject:[:b| b = box].	
	bc1 := b1 copy.
	bc1 add: box.
	Processor yield.
	self threeWaysRecur: rj bin1: bc1 bin2: b2 bin3: b3.
	bc2 := b2 copy.
	bc2 add: box.
	Processor yield.
	self threeWaysRecur: rj bin1: b1 bin2: bc2 bin3: b3.
	bc3 := b3 copy.
	bc3 add: box.
	Processor yield.
	self threeWaysRecur: rj bin1: b1 bin2: b2 bin3: bc3.	
	].

]
