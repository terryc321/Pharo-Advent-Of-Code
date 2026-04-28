Class {
	#name : 'AOC2015Day7AndNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day7AndNode >> compute [
	"AND node left / right "
	self ready ifTrue: [ ^ self val ].
	self left compute .
	self right compute.
	self val: (self left val bitAnd: self right val).
	^ self val 
	
	

]

{ #category : 'initialization' }
AOC2015Day7AndNode >> isAndNode [ 
 ^ true 
]
