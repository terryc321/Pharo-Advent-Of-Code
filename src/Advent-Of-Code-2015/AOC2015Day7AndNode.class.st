Class {
	#name : 'AOC2015Day7AndNode',
	#superclass : 'AOC2015Day7Node',
	#category : 'Advent-Of-Code-2015',
	#package : 'Advent-Of-Code-2015'
}

{ #category : 'initialization' }
AOC2015Day7AndNode >> compute [
	"AND node left / right "
	self ready ifTrue: [ ^ self val ].
	Processor yield.
	self left compute .
	self right compute.
	self val: (self left val bitAnd: self right val).	
	Transcript show: 'computed ' , val printString , 'for AND node ' , self printString.
	Processor yield.
	^ self val 
	
	

]

{ #category : 'initialization' }
AOC2015Day7AndNode >> isAndNode [ 
 ^ true 
]

{ #category : 'printing' }
AOC2015Day7AndNode >> printOn: aStream [
	aStream nextPutAll: 'AndNode{';
	        nextPutAll: (self title);
		     nextPutAll: '}'.
		
]
