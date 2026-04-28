Class {
	#name : 'AOC2015Day7AssignNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'AdventCode',
	#package : 'AdventCode'
}

{ #category : 'initialization' }
AOC2015Day7AssignNode >> compute [ 
 "ASSIGN node left "
	self ready ifTrue: [ ^ self val ].
	self left compute .
	self val: (self left val).
	^ self val 




]

{ #category : 'initialization' }
AOC2015Day7AssignNode >> isAssignNode [ 
 ^ true

]
