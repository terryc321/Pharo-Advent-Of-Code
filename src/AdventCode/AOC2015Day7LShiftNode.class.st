Class {
	#name : 'AOC2015Day7LShiftNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day7LShiftNode >> compute [ 
 "LSHIFT node left / right "
 (self left ready) ifFalse:[ self left compute ].
 (self right ready) ifFalse:[ self right compute ]. 
 self val: ((self left val) bitShift: (self right val)).
 ^ val 





]

{ #category : 'initialization' }
AOC2015Day7LShiftNode >> isLShiftNode [ 
 ^ true 
]
