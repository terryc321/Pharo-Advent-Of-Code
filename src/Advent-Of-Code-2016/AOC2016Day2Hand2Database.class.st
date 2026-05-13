Class {
	#name : 'AOC2016Day2Hand2Database',
	#superclass : 'Object',
	#instVars : [
		'database',
		'validLocation'
	],
	#category : 'Advent-Of-Code-2016',
	#package : 'Advent-Of-Code-2016'
}

{ #category : 'as yet unclassified' }
AOC2016Day2Hand2Database >> centre [ 
^ 7



]

{ #category : 'as yet unclassified' }
AOC2016Day2Hand2Database >> downOf: aLocation [ 

|dest |

dest := (database at: aLocation) at: 4.
(dest = #x) ifTrue: [ ^ false ].
^ dest

]

{ #category : 'as yet unclassified' }
AOC2016Day2Hand2Database >> hasDownOf: aLocation [ 
^ self downOf: aLocation = #x . 

]

{ #category : 'as yet unclassified' }
AOC2016Day2Hand2Database >> hasLeftOf: aLocation [ 
^ self leftOf: aLocation = #x . 

]

{ #category : 'as yet unclassified' }
AOC2016Day2Hand2Database >> hasRightOf: aLocation [ 
^ self rightOf: aLocation = #x . 

]

{ #category : 'as yet unclassified' }
AOC2016Day2Hand2Database >> hasUpOf: aLocation [ 
^ self upOf: aLocation = #x . 

]

{ #category : 'initialization' }
AOC2016Day2Hand2Database >> initialize [ 
Transcript showCr: 'Creating AOC2016Day2Hand2Database '.
database := Dictionary new.
"format              LEFT RIGHT UP DOWN"
database at: 1 put: { #x . #x . #x . 3 }.
database at: 2 put: { #x . 3 . 1 . 6 }.
database at: 3 put: { 2 . 4 . 1 . 7 }. 
database at: 4 put: { 3 . #x . #x . 8 }.  
database at: 5 put: { #x . 6 . #x . #x }.  
database at: 6 put: { 5 . 7 . 2 . #a }.  
database at: 7 put: { 6 . 8 . 3 . #b }.  
database at: 8 put: { 7 . 9 . 4 . #c }.  
database at: 9 put: { 8 . #x . #x . #x }.  
database at: #a put: { #x . #b . 6 . #x }.  
database at: #b put: { #a . #c  . 7 . #d }.  
database at: #c put: { #b . #x . 8 . #x }.  
database at: #d put: { #x . #x . #x . #x }.  

validLocation := { 1 . 2 . 3 . 4 . 5 . 6 . 7. 8 . 9 . #a . #b . #c . #d }.
^ self.


]

{ #category : 'as yet unclassified' }
AOC2016Day2Hand2Database >> leftOf: aLocation [ 

|dest |

dest := (database at: aLocation) at: 1.
(dest = #x) ifTrue: [ ^ false ].
^ dest

]

{ #category : 'as yet unclassified' }
AOC2016Day2Hand2Database >> rightOf: aLocation [ 

|dest |

dest := (database at: aLocation) at: 2.
(dest = #x) ifTrue: [ ^ false ].
^ dest

]

{ #category : 'as yet unclassified' }
AOC2016Day2Hand2Database >> upOf: aLocation [ 

|dest |

dest := (database at: aLocation) at: 3.
(dest = #x) ifTrue: [ ^ false ].
^ dest

]

{ #category : 'as yet unclassified' }
AOC2016Day2Hand2Database >> validLocation: aLocation [ 
^ validLocation contains: [ :e | e = aLocation ].


]
