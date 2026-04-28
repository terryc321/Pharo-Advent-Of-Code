Class {
	#name : 'AOC2015Day7RShiftNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day7RShiftNode >> compute [ 
 "RSHIFT node left / right "
	self ready ifTrue: [ ^ self val ].
	self left compute .
	self right compute.
	self val: ((self left val) bitShift: (0 - (self right val))).
	^ self val 


]

{ #category : 'initialization' }
AOC2015Day7RShiftNode >> isRShiftNode [ 
 ^ true 

]
