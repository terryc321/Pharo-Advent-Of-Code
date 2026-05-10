"
ideas

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
		'bin1size'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AOC2015Day24 >> example [
"example puzzle input"
	^ (1 to: 11) reject: [:e | e = 6].

]

{ #category : 'accessing' }
AOC2015Day24 >> howTo [ 
"day24 := AOC2015Day24 new.
day24 run: (day24 example).
day24 threeWays: (day24 example).
"
]

{ #category : 'accessing' }
AOC2015Day24 >> initialize [ 
 bins := OrderedCollection new.
 bin1size := nil.




]

{ #category : 'accessing' }
AOC2015Day24 >> input [
"puzzle input"
	^ #( 1 3 5 11 13 17 19 23 29 31 41 43 47 53 59 61 67 71 73 79 83 89
	     97 101 103 107 109 113 )
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
|smallestBin|
smallestBin = { b1 size . b2 size . b3 size } min.

"reject if smallest bin size is too large than something already found"
bin1size ifNotNil: [ (smallestBin > bin1size) ifTrue:[ ^ #nope ]]. 

aCollection isEmpty ifTrue: [
	| weight1 weight2 weight3 |
	weight1 := b1 inject: 0 into: [:acc :each | acc + each].
	weight2 := b2 inject: 0 into: [:acc :each | acc + each].
	weight3 := b3 inject: 0 into: [:acc :each | acc + each].
	Processor yield.
	(weight1 = weight2 and: [weight2 = weight3]) 
	  ifTrue: [ bins add: {b1 . b2 . b3 . weight1 } . 
		         bin1size := {b1 size. b2 size. b3 size} min . 
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
