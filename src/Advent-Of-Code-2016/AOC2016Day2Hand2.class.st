"
# Functional hand 
```
    1
  2 3 4
5 6 7 8 9
  A B C
    D
```


|---+------+-------+----+------|
|   | left | right | up | down |
|---+------+-------+----+------|
| 1 |      |       |    |      |
|---+------+-------+----+------|
| 2 |      |       |    |      |
|---+------+-------+----+------|
| 3 |      |       |    |      |
|---+------+-------+----+------|
| 4 |      |       |    |      |
|---+------+-------+----+------|
| 5 |      |       |    |      |
|---+------+-------+----+------|
| 6 |      |       |    |      |
|---+------+-------+----+------|
| 7 |      |       |    |      |
|---+------+-------+----+------|
| 8 |      |       |    |      |
|---+------+-------+----+------|
| 9 |      |       |    |      |
|---+------+-------+----+------|
| A |      |       |    |      |
|---+------+-------+----+------|
| B |      |       |    |      |
|---+------+-------+----+------|
| C |      |       |    |      |
|---+------+-------+----+------|
| D |      |       |    |      |
|---+------+-------+----+------|



"
Class {
	#name : 'AOC2016Day2Hand2',
	#superclass : 'Object',
	#instVars : [
		'location',
		'database'
	],
	#category : 'Advent-Of-Code-2016',
	#package : 'Advent-Of-Code-2016'
}

{ #category : 'initialization' }
AOC2016Day2Hand2 >> centre [
"return a hand at 7 or create a new one"
location = 7 ifTrue:[ ^ self ] ifFalse:[ ^ AOC2016Day2Hand2 new with: 7 ].




]

{ #category : 'initialization' }
AOC2016Day2Hand2 >> down [
|hand data dest |

data := database at: location.
dest := data at: 4.
dest = #x ifTrue: [ ^ self ] ifFalse: [ AOC2016Day2Hand2 new with: dest ].
]

{ #category : 'initialization' }
AOC2016Day2Hand2 >> initialize [
database := Dictionary new.
"format LEFT RIGHT UP DOWN"
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
database at: #d put: { #x . #x . #b . #x }.  



]

{ #category : 'initialization' }
AOC2016Day2Hand2 >> keypad [ 
 ^ location 



]

{ #category : 'initialization' }
AOC2016Day2Hand2 >> left [ 
|hand data dest |

data := database at: location.
dest := data at: 1.
dest = #x ifTrue: [ ^ self ] ifFalse: [ AOC2016Day2Hand2 new with: dest ].
]

{ #category : 'initialization' }
AOC2016Day2Hand2 >> right [
|hand data dest |

data := database at: location.
dest := data at: 2.
dest = #x ifTrue: [ ^ self ] ifFalse: [ AOC2016Day2Hand2 new with: dest ].
]

{ #category : 'initialization' }
AOC2016Day2Hand2 >> up [
|hand data dest |

data := database at: location.
dest := data at: 3.
dest = #x ifTrue: [ ^ self ] ifFalse: [ AOC2016Day2Hand2 new with: dest ].

]

{ #category : 'initialization' }
AOC2016Day2Hand2 >> with: aLocation [ 
location := aLocation .



]
