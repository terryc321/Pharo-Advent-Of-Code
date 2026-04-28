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
		Processor yield.
	self left compute .
		Processor yield.
	self right compute.
		Processor yield.
	self val: (self left val bitShift: self right val).
		Transcript show: 'computed ' , val printString , 'for Left shift node ' , self printString.
		Processor yield.
	^ self val 



]

{ #category : 'initialization' }
AOC2015Day7LShiftNode >> isLShiftNode [ 
 ^ true 
]

{ #category : 'printing' }
AOC2015Day7LShiftNode >> printOn: aStream [
	aStream nextPutAll: 'LShiftNode{';
	        nextPutAll: (self title);
		     nextPutAll: '}'.
		
]
