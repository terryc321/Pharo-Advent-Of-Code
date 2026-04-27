Class {
	#name : 'AOC2015Day7LShiftNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day7LShiftNode >> compute [ 
 "LSHIFT node left / right "
(self left ready and: [ self right ready ]) ifTrue: [ self val: (self left val bitShift: self right val) ]





]

{ #category : 'initialization' }
AOC2015Day7LShiftNode >> isLShiftNode [ 
 ^ true 
]
