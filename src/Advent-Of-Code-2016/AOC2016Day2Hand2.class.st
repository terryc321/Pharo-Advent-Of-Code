"
# Functional hand 

## usage 

```language=smalltalk
""must first configure database""
AOC2016Day2Hand2 setup.

""this is the centre of keypad at the 7 ""
h := AOC2016Day2Hand2 new centre. 

""each of these creates a new AOC2016Day2Hand2 object""
h left 
h right
h up 
h down

""all share same database which is created once and never altered ""
""no method causes any mutation side effects ?""

```

## keypad

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
	#classInstVars : [
		'database'
	],
	#category : 'Advent-Of-Code-2016',
	#package : 'Advent-Of-Code-2016'
}

{ #category : 'accessing' }
AOC2016Day2Hand2 class >> database [ 
database ifNil: [ self class setup ].
 ^ database
 
]

{ #category : 'as yet unclassified' }
AOC2016Day2Hand2 class >> setup [ 
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
AOC2016Day2Hand2 >> centre [
"return a hand at 7 or create a new one"
(location = (database centre)) ifTrue:[ ^ self ] .
^ AOC2016Day2Hand2 new withDatabase: database atLocation: database centre.






]

{ #category : 'initialization' }
AOC2016Day2Hand2 >> down [

	| dest |
	dest := database downOf: location.
	dest = #x
		ifTrue: [ ^ self ]
		ifFalse: [ ^ AOC2016Day2Hand2 new withDatabase: database at: dest ]
]

{ #category : 'initialization' }
AOC2016Day2Hand2 >> initialize [
database := nil.
location := nil.



]

{ #category : 'initialization' }
AOC2016Day2Hand2 >> keypad [ 
 ^ location 



]

{ #category : 'initialization' }
AOC2016Day2Hand2 >> left [

	| dest |
	dest := database leftOf: location.
	dest = #x
		ifTrue: [ ^ self ]
		ifFalse: [ ^ AOC2016Day2Hand2 new withDatabase: database at: dest ]
]

{ #category : 'initialization' }
AOC2016Day2Hand2 >> right [

	| dest |
	dest := database rightOf: location.
	dest = #x
		ifTrue: [ ^ self ]
		ifFalse: [ ^ AOC2016Day2Hand2 new withDatabase: database at: dest ]
]

{ #category : 'initialization' }
AOC2016Day2Hand2 >> up [

	| dest |
	dest := database upOf: location.
	dest = #x
		ifTrue: [ ^ self ]
		ifFalse: [ ^ AOC2016Day2Hand2 new withDatabase: database at: dest ]
]

{ #category : 'initialization' }
AOC2016Day2Hand2 >> withDatabase: aDatabase at: aLocation [
"assign references"
database := aDatabase .
location := aLocation.
"check valid location"
database validLocation: aLocation.
^ self











]
