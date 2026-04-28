Class {
	#name : 'AOC2015Day7LShiftNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day7LShiftNode >> compute [ 
 "LSHIFT node left / right "
	self ready ifTrue: [ ^ self val ].
	self left compute .
	self right compute.
	self val: (self left val bitShift: self right val).
	^ self val 



]

{ #category : 'initialization' }
AOC2015Day7LShiftNode >> isLShiftNode [ 
 ^ true 
]
