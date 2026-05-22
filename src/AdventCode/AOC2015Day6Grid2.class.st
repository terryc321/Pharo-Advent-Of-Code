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
	#name : 'AOC2015Day6Grid2',
	#superclass : 'Object',
	#instVars : [
		'grid'
	],
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day6Grid2 >> initialize [

	grid := Dictionary new.
	self reset.
	
]

{ #category : 'initialization' }
AOC2015Day6Grid2 >> offCmd: anArray [

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
AOC2015Day6Grid2 >> onCmd: anArray [

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
AOC2015Day6Grid2 >> reset [
	0 to: 999 do: [ :x |
			0 to: 999 do: [ :y |
				grid at: (x@y) put: 0.
				]].
		
]

{ #category : 'initialization' }
AOC2015Day6Grid2 >> status [
"sum up the total of all lights"
	| tot |
	tot := 0.
	0 to: 999 do: [ :x |
			0 to: 999 do: [ :y |
					tot := tot + ( grid at: x @ y ) ]].
	^ {	  'grid lights total =>' .	tot }
			
			
		
]

{ #category : 'initialization' }
AOC2015Day6Grid2 >> toggle: aPos [
"toggle increase brightness by 2 "
	| x y val |
	x := aPos x.
	y := aPos y.
	"hwow do we do assertions at runtime ?"
	(x >= 0 and: [ x <= 999 ]) ifFalse: [ Error signal: 'x out of range' ].
	(y >= 0 and: [ y <= 999 ]) ifFalse: [ Error signal: 'y out of range' ].
	grid at: (x @ y) put: ((grid at: (x @ y)) + 2).
	

]

{ #category : 'initialization' }
AOC2015Day6Grid2 >> toggleCmd: anArray [

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
AOC2015Day6Grid2 >> turnOff: aPos [
"decrease brightness by 1 until zero"
	| x y val |
	x := aPos x.
	y := aPos y.
	"hwow do we do assertions at runtime ?"
	(x >= 0 and: [ x <= 999 ]) ifFalse: [ Error signal: 'x out of range' ].
	(y >= 0 and: [ y <= 999 ]) ifFalse: [ Error signal: 'y out of range' ].
	grid at: (x @ y) put: (((grid at: (x @ y)) - 1) max: 0).
	
	" -2 max: 0 . 
	3 max: 0 . 
	0 max: 0 . 
	"
	

]

{ #category : 'initialization' }
AOC2015Day6Grid2 >> turnOn: aPos [
 "increase brightness by 1 "
	| x y val |
	x := aPos x.
	y := aPos y.
	"hwow do we do assertions at runtime ?"
	(x >= 0 and: [ x <= 999 ]) ifFalse: [ Error signal: 'x out of range' ].
	(y >= 0 and: [ y <= 999 ]) ifFalse: [ Error signal: 'y out of range' ].
	grid at: (x @ y) put: ((grid at: (x @ y)) + 1).
	
	
	
	
]
