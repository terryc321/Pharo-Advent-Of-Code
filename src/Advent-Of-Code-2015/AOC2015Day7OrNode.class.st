Class {
	#name : 'AOC2015Day7OrNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'initialization' }
AOC2015Day7OrNode >> compute [ 
 "OR node left / right "
	self ready ifTrue: [ ^ self val ].
		Processor yield.
	self left compute .
		Processor yield.
	self right compute.
		Processor yield.
	self val: ((self left val) bitOr: (self right val)).
		Transcript show: 'computed ' , val printString , 'for OR node ' , self printString.
		Processor yield.
	^ self val 


]

{ #category : 'initialization' }
AOC2015Day7OrNode >> isOrNode [ 
 ^ true


]

{ #category : 'printing' }
AOC2015Day7OrNode >> printOn: aStream [
	aStream nextPutAll: 'OrNode{';
	        nextPutAll: (self title);
		     nextPutAll: '}'.
		
	
]
