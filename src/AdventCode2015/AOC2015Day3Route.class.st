"
```language=Pharo
route := AOC2015Day3SantaRoute new.
route deliverPresentAt: 2@3 .
route deliverPresentAt: 2@3 .
""lets see how many locations got atleast one present""
route tabulateAtleastOnePresent . 
```




"
Class {
	#name : 'AOC2015Day3Route',
	#superclass : 'Object',
	#instVars : [
		'dict'
	],
	#category : 'AdventCode2015',
	#package : 'AdventCode2015'
}

{ #category : 'as yet unclassified' }
AOC2015Day3Route >> combineRoute: aRoute [
	"combine two routes "

	| newRoute aDict bDict |
	newRoute := AOC2015Day3Route new.
	aDict := self dict.
	bDict := aRoute dict.
	"add all locations from this santa"
	aDict keysDo: [ :point | newRoute deliverPresentTo: point ].
	bDict keysDo: [ :point | newRoute deliverPresentTo: point ].
	"add all locations from aSanta"
	^ newRoute
]

{ #category : 'initialization' }
AOC2015Day3Route >> deliverPresentTo: aPoint [
	"if a given point is in dictionary , increment value , otherwise give it value of 1"

	| n |
	n := dict at: aPoint ifAbsent: 0.
	dict at: aPoint put: n + 1
]

{ #category : 'initialization' }
AOC2015Day3Route >> dict [ 
 ^ dict .
]

{ #category : 'initialization' }
AOC2015Day3Route >> initialize [ 
 dict := Dictionary new.

]

{ #category : 'initialization' }
AOC2015Day3Route >> tabulateAtleastOnePresent [
	"count locations which have alteast one present delivered there"

	| tot |
	tot := 0 .
	dict keysDo: [ :key |
			| n |
			n := dict at: key.
			n > 0 ifTrue: [ tot := tot + 1 ] ].
	^ tot
]
