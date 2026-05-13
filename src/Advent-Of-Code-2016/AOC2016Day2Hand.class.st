"
Mutating hand 

I am the hand that is controlled from the given input L left R right U up D down

positive Y means down keypad higher numbers , negative Y means lower numbers

positive X means higher number s , negative Y means lower numbers 

x -> 

y 
|
v 




"
Class {
	#name : 'AOC2016Day2Hand',
	#superclass : 'Object',
	#instVars : [
		'position'
	],
	#category : 'Advent-Of-Code-2016',
	#package : 'Advent-Of-Code-2016'
}

{ #category : 'initialization' }
AOC2016Day2Hand >> centre [
"centre hand on keypad"
	position := 2 @ 2
	
]

{ #category : 'initialization' }
AOC2016Day2Hand >> initialize [
   self centre .
]

{ #category : 'initialization' }
AOC2016Day2Hand >> keypad [

	position = (1 @ 1) ifTrue: [ ^ 1 ].
	position = (2 @ 1) ifTrue: [ ^ 2 ].
	position = (3 @ 1) ifTrue: [ ^ 3 ].

	position = (1 @ 2) ifTrue: [ ^ 4 ].
	position = (2 @ 2) ifTrue: [ ^ 5 ].
	position = (3 @ 2) ifTrue: [ ^ 6 ].

	position = (1 @ 3) ifTrue: [ ^ 7 ].
	position = (2 @ 3) ifTrue: [ ^ 8 ].
	position = (3 @ 3) ifTrue: [ ^ 9 ].

	Error signal: 'position invalid'
]

{ #category : 'initialization' }
AOC2016Day2Hand >> moveDown [
position y >= 3 ifTrue: [^ #cannot].
position := position + (0@1).




]

{ #category : 'initialization' }
AOC2016Day2Hand >> moveLeft [
position x <= 1 ifTrue: [^ #cannot].
position := position + (-1@0).

]

{ #category : 'initialization' }
AOC2016Day2Hand >> moveRight [
position x >= 3 ifTrue: [^ #cannot].
position := position + (1@0).


]

{ #category : 'initialization' }
AOC2016Day2Hand >> moveUp [
position y <= 1 ifTrue: [^ #cannot].
position := position + (0@(-1)).


]
