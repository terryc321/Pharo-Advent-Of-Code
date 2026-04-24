"
```language=Pharo
g := AOC2015Day6Grid new .
""all lights initially are off , default grid size 0 to 999 by 0 to 999 inclusive.
g turnOn: 23@35 .
g turnOff: 54@34 .
g toggle: 25@96 .
```


"
Class {
	#name : 'AOC2015Day6Grid',
	#superclass : 'Object',
	#instVars : [
		'grid'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day6Grid >> initialize [

	grid := Dictionary new.
	0 to: 999 do: [ :x | 
		0 to: 999 do: [ :y |
			grid at: (x@y) put: false ] ].
	
]

{ #category : 'initialization' }
AOC2015Day6Grid >> status [

	| on off |
	on := 0.
	off := 0.
	0 to: 999 do: [ :x |
			0 to: 999 do: [ :y |
					| val |
					val := grid at: x @ y.
					val
						ifTrue: [ on := on + 1 ]
						ifFalse: [ off := off + 1 ] ] ]
]

{ #category : 'initialization' }
AOC2015Day6Grid >> toggle: aPos [

	| x y val |
	x := aPos x.
	y := aPos y.
	"hwow do we do assertions at runtime ?"
	(x >= 0 and: [ x <= 999 ]) ifFalse: [ Error signal: 'x out of range' ].
	(y >= 0 and: [ y <= 999 ]) ifFalse: [ Error signal: 'y out of range' ].
	val := grid at: x @ y.
	val
		ifTrue: [ grid at: x @ y put: false ]
		ifFalse: [ grid at: x @ y put: true ]
]

{ #category : 'initialization' }
AOC2015Day6Grid >> turnOff: aPos [

	| x y val |
	x := aPos x.
	y := aPos y.
	"hwow do we do assertions at runtime ?"
	(x >= 0 and: [ x <= 999 ]) ifFalse: [ Error signal: 'x out of range' ].
	(y >= 0 and: [ y <= 999 ]) ifFalse: [ Error signal: 'y out of range' ].
	grid at: (x @ y) put: false.
	
]

{ #category : 'initialization' }
AOC2015Day6Grid >> turnOn: aPos [

	| x y val |
	x := aPos x.
	y := aPos y.
	"hwow do we do assertions at runtime ?"
	(x >= 0 and: [ x <= 999 ]) ifFalse: [ Error signal: 'x out of range' ].
	(y >= 0 and: [ y <= 999 ]) ifFalse: [ Error signal: 'y out of range' ].
	grid at: (x @ y) put: true.
	
	
	
]
