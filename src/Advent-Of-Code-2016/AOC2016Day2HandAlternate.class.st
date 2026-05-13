"
# Mutating hand 
```
    1
  2 3 4
5 6 7 8 9
  A B C
    D
```
Object represent keypad '7' initially . ob #left => ob2 
ob2 represent keypad object '6'


map position as coordinates
or 
 at 1 : up left or right - i cannot do that 
choices
 - throw exception
 - accept cannot do that and return object that is at same **position**



I am the alternarte hand that is controlled from the given input
L left R right U up D down



positive Y means down keypad higher numbers , negative Y means lower numbers

positive X means higher number s , negative Y means lower numbers 



"
Class {
	#name : 'AOC2016Day2HandAlternate',
	#superclass : 'Object',
	#instVars : [
		'position'
	],
	#category : 'Advent-Of-Code-2016',
	#package : 'Advent-Of-Code-2016'
}

{ #category : 'initialization' }
AOC2016Day2HandAlternate >> centre [
"centre hand on keypad"
	position := 2 @ 2
	
]

{ #category : 'initialization' }
AOC2016Day2HandAlternate >> initialize [
   self centre .
]

{ #category : 'initialization' }
AOC2016Day2HandAlternate >> keypad [

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
AOC2016Day2HandAlternate >> moveDown [
position y >= 3 ifTrue: [^ #cannot].
position := position + (0@1).




]

{ #category : 'initialization' }
AOC2016Day2HandAlternate >> moveLeft [
position x <= 1 ifTrue: [^ #cannot].
position := position + (-1@0).

]

{ #category : 'initialization' }
AOC2016Day2HandAlternate >> moveRight [
position x >= 3 ifTrue: [^ #cannot].
position := position + (1@0).


]

{ #category : 'initialization' }
AOC2016Day2HandAlternate >> moveUp [
position y <= 1 ifTrue: [^ #cannot].
position := position + (0@(-1)).


]
