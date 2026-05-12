Class {
	#name : 'AOC2015Day7RShiftNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'initialization' }
AOC2015Day7RShiftNode >> compute [ 
 "RSHIFT node left / right "
	self ready ifTrue: [ ^ self val ].
		Processor yield.
	self left compute .
		Processor yield.
	self right compute.
		Processor yield.
	self val: ((self left val) bitShift: (0 - (self right val))).
		Transcript show: 'computed ' , val printString , 'for RShift node ' , self printString.	
	Processor yield.
	
	^ self val 


]

{ #category : 'initialization' }
AOC2015Day7RShiftNode >> isRShiftNode [ 
 ^ true 

]

{ #category : 'printing' }
AOC2015Day7RShiftNode >> printOn: aStream [
	aStream nextPutAll: 'RShiftNode{';
	        nextPutAll: (self title);
		     nextPutAll: '}'.
		
]
