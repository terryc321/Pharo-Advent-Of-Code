Class {
	#name : 'AOC2015Day25',
	#superclass : 'Object',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'accessing' }
AOC2015Day25 >> next: anInteger [ 

|previous result multiplier divisor|
previous := anInteger.
multiplier := 252533.
divisor := 33554393.
result := (previous * multiplier) % divisor.
^result 

]

{ #category : 'accessing' }
AOC2015Day25 >> part1 [ 

"7,1 comes after 1,6"

^ (33511524 * 252533) % 33554393 .
]
