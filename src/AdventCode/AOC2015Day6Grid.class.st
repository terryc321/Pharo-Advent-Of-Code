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
AOC2015Day6Grid >> offCmd: anArray [

	| x y x2 y2 |
 x := anArray at: 2.
	y := anArray at: 3.
	x2 := anArray at: 4.
	y2 := anArray at: 5.

	"hwow do we do assertions at runtime ?"
	(x >= 0 and: [ x <= 999 ]) ifFalse: [ Error signal: 'x out of range' ].
	(y >= 0 and: [ y <= 999 ]) ifFalse: [ Error signal: 'y out of range' ].
	(x2 >= 0 and: [ x2 <= 999 ]) ifFalse: [ Error signal: 'x2 out of range' ].
	(y2 >= 0 and: [ y2 <= 999 ]) ifFalse: [ Error signal: 'y2 out of range' ].

	x to: x2 do: [ :ex |
		y to: y2 do: [ :ey | 
			self turnOff: (ex@ey)			
			 ] ].
	
	
	
]

{ #category : 'initialization' }
AOC2015Day6Grid >> onCmd: anArray [

	| x y x2 y2 |
	x := anArray at: 2.
	y := anArray at: 3.
	x2 := anArray at: 4.
	y2 := anArray at: 5.
	"hwow do we do assertions at runtime ?"
	(x >= 0 and: [ x <= 999 ]) ifFalse: [ Error signal: 'x out of range' ].
	(y >= 0 and: [ y <= 999 ]) ifFalse: [ Error signal: 'y out of range' ].
	(x2 >= 0 and: [ x2 <= 999 ]) ifFalse: [ Error signal: 'x2 out of range' ].
	(y2 >= 0 and: [ y2 <= 999 ]) ifFalse: [ Error signal: 'y2 out of range' ].

	x to: x2 do: [ :ex |
		y to: y2 do: [ :ey | 
			self turnOn: (ex@ey)			
			 ] ].
	
	
	
	
]

{ #category : 'initialization' }
AOC2015Day6Grid >> reset [
	0 to: 999 do: [ :x |
			0 to: 999 do: [ :y |
				grid at: (x@y) put: false.
				]].
		
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
						ifFalse: [ off := off + 1 ] ] ].
	^ {
		  'grid lights on=>'.
		  on.
		  ' : grid lights off => '.
		  off }
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
AOC2015Day6Grid >> toggleCmd: anArray [

	| x y x2 y2 |
	x := anArray at: 2.
	y := anArray at: 3.
	x2 := anArray at: 4.
	y2 := anArray at: 5.
	"hwow do we do assertions at runtime ?"
	(x >= 0 and: [ x <= 999 ]) ifFalse: [ Error signal: 'x out of range' ].
	(y >= 0 and: [ y <= 999 ]) ifFalse: [ Error signal: 'y out of range' ].
	(x2 >= 0 and: [ x2 <= 999 ]) ifFalse: [ Error signal: 'x2 out of range' ].
	(y2 >= 0 and: [ y2 <= 999 ]) ifFalse: [ Error signal: 'y2 out of range' ].

	x to: x2 do: [ :ex |
		y to: y2 do: [ :ey | 
			self toggle: (ex@ey)			
			 ] ].
	
	
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
